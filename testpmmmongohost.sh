#!/bin/bash

#test1.0 enable all disable none
servicename="testing1.0"
docker exec pmm-client pmm-admin add mongodb --username=admin --password=admin --service-name=$servicename --enable-all-collectors --max-collections-limit=100 --host=some-mongo --port=27017
#Getting Agent_ID
docker exec pmm-client pmm-admin list > list.txt
serviceid=$(awk '/'"$servicename"'/ {print $4}' list.txt)
prefix="/service_id/"
idnumber=${serviceid#"$prefix"}
awk '/'"$idnumber"'/ {print $4}' list.txt > getagentid.txt
agentid=$(awk '/agent_id/ {print}' getagentid.txt)
#checking whether the collectors are visible in ps aux | grep mongo_exporter
sleep 10
originstring=$(docker exec pmm-client ps aux | grep /mongodb_exporter)
port=${originstring: -5}
echo "port=$port"
if [[ "$originstring" == *' --collector.topmetrics '* ]]; then
  echo "topmetrics is in process status."
else
  echo "topmetrics is NOT in process status."
fi
if [[ "$originstring" == *' --collector.dbstats '* ]]; then
  echo "dbstats is in process status."
else
  echo "dbstats is NOT in process status."
fi
if [[ "$originstring" == *' --collector.collstats '* ]]; then
  echo "collstats is in process status."
else
  echo "collstats is NOT in process status."
fi
if [[ "$originstring" == *' --collector.indexstats '* ]]; then
  echo "indexstats is in process status."
else
  echo "indexstats is NOT in process status."
fi
#tokenizing and checking if the right collectors are working
export token=$(printf '%s' pmm:${agentid} | base64)
docker exec pmm-client curl --silent -H "Authorization: Basic ${token}" "http://localhost:$port/metrics" > sr.txt
if grep -q mongodb_top_ sr.txt; then
    echo topmetrics found
else
    echo topmetrics not found
    echo ERROR: was expecting output= topmetrics found
    docker exec pmm-client pmm-admin remove mongodb $servicename
    exit 1
fi
if grep -q mongodb_dbstats_ sr.txt; then
    echo dbstats found
else
    echo dbstats not found
    echo ERROR: was expecting output= dbstats found
    docker exec pmm-client pmm-admin remove mongodb $servicename
    exit 1
fi
if grep -q mongodb_db2_col7_latencystats sr.txt; then
    echo collstats found
else
    echo collstats not found
    echo ERROR: was expecting output= collstats found
    docker exec pmm-client pmm-admin remove mongodb $servicename
    exit 1
fi
if grep -q index sr.txt; then
    echo indexstats found
else
    echo indexstats not found
    echo ERROR: was expecting output= indexstats found
    docker exec pmm-client pmm-admin remove mongodb $servicename
    exit 1
fi
docker exec pmm-client pmm-admin remove mongodb $servicename

#test1.1 enable all disable topstats
servicename="testing1.1"
docker exec pmm-client pmm-admin add mongodb --username=admin --password=admin --service-name=$servicename --enable-all-collectors --disable-collectors=topstats --max-collections-limit=100 --host=some-mongo --port=27017
#Getting Agent_ID
docker exec pmm-client pmm-admin list > list.txt
serviceid=$(awk '/'"$servicename"'/ {print $4}' list.txt)
prefix="/service_id/"
idnumber=${serviceid#"$prefix"}
awk '/'"$idnumber"'/ {print $4}' list.txt > getagentid.txt
agentid=$(awk '/agent_id/ {print}' getagentid.txt)
#Getting Port
sleep 10
originstring=$(docker exec pmm-client ps aux | grep /mongodb_exporter)
port=${originstring: -5}
echo "port=$port"
if [[ "$originstring" == *' --collector.topmetrics '* ]]; then
  echo "topmetrics is in process status."
else
  echo "topmetrics is NOT in process status."
fi
if [[ "$originstring" == *' --collector.dbstats '* ]]; then
  echo "dbstats is in process status."
else
  echo "dbstats is NOT in process status."
fi
if [[ "$originstring" == *' --collector.collstats '* ]]; then
  echo "collstats is in process status."
else
  echo "collstats is NOT in process status."
fi
if [[ "$originstring" == *' --collector.indexstats '* ]]; then
  echo "indexstats is in process status."
else
  echo "indexstats is NOT in process status."
fi
#tokenizing and checking if the right collectors are working
export token=$(printf '%s' pmm:${agentid} | base64)
docker exec pmm-client curl --silent -H "Authorization: Basic ${token}" "http://localhost:$port/metrics" > sr.txt
if grep -q mongodb_top_ sr.txt; then
    echo topmetrics found
    echo ERROR: was expecting output= topmetrics not found
    docker exec pmm-client pmm-admin remove mongodb $servicename
    exit 1
else
    echo topmetrics not found
fi
if grep -q mongodb_dbstats_ sr.txt; then
    echo dbstats found
else
    echo dbstats not found
    echo ERROR: was expecting output= dbstats found
    docker exec pmm-client pmm-admin remove mongodb $servicename
    exit 1
fi
if grep -q mongodb_db2_col7_latencystats sr.txt; then
    echo collstats found
else
    echo collstats not found
    echo ERROR: was expecting output= collstats found
    docker exec pmm-client pmm-admin remove mongodb $servicename
    exit 1
fi
if grep -q index sr.txt; then
    echo indexstats found
else
    echo indexstats not found
    echo ERROR: was expecting output= indexstats found
    docker exec pmm-client pmm-admin remove mongodb $servicename
    exit 1
fi
docker exec pmm-client pmm-admin remove mongodb $servicename

#test1.2 enable all disable dbstats
servicename="testing1.2"
docker exec pmm-client pmm-admin add mongodb --username=admin --password=admin --service-name=$servicename --enable-all-collectors --disable-collectors=dbstats --max-collections-limit=100 --host=some-mongo --port=27017
#Getting Agent_ID
docker exec pmm-client pmm-admin list > list.txt
serviceid=$(awk '/'"$servicename"'/ {print $4}' list.txt)
prefix="/service_id/"
idnumber=${serviceid#"$prefix"}
awk '/'"$idnumber"'/ {print $4}' list.txt > getagentid.txt
agentid=$(awk '/agent_id/ {print}' getagentid.txt)
#Getting Port
sleep 10
originstring=$(docker exec pmm-client ps aux | grep /mongodb_exporter)
port=${originstring: -5}
echo "port=$port"
if [[ "$originstring" == *' --collector.topmetrics '* ]]; then
  echo "topmetrics is in process status."
else
  echo "topmetrics is NOT in process status."
fi
if [[ "$originstring" == *' --collector.dbstats '* ]]; then
  echo "dbstats is in process status."
else
  echo "dbstats is NOT in process status."
fi
if [[ "$originstring" == *' --collector.collstats '* ]]; then
  echo "collstats is in process status."
else
  echo "collstats is NOT in process status."
fi
if [[ "$originstring" == *' --collector.indexstats '* ]]; then
  echo "indexstats is in process status."
else
  echo "indexstats is NOT in process status."
fi
#tokenizing and checking if the right collectors are working
export token=$(printf '%s' pmm:${agentid} | base64)
docker exec pmm-client curl --silent -H "Authorization: Basic ${token}" "http://localhost:$port/metrics" > sr.txt
if grep -q mongodb_top_ sr.txt; then
    echo topmetrics found
else
    echo topmetrics not found
    echo ERROR: was expecting output= topmetrics found
    docker exec pmm-client pmm-admin remove mongodb $servicename
    exit 1
fi
if grep -q mongodb_dbstats_ sr.txt; then
    echo dbstats found
    echo ERROR: was expecting output= dbstats not found
    docker exec pmm-client pmm-admin remove mongodb $servicename
    exit 1
else
    echo dbstats not found
fi
if grep -q mongodb_db2_col7_latencystats sr.txt; then
    echo collstats found
else
    echo collstats not found
    echo ERROR: was expecting output= collstats found
    docker exec pmm-client pmm-admin remove mongodb $servicename
    exit 1
fi
if grep -q index sr.txt; then
    echo indexstats found
else
    echo indexstats not found
    echo ERROR: was expecting output= indexstats found
    docker exec pmm-client pmm-admin remove mongodb $servicename
    exit 1
fi
docker exec pmm-client pmm-admin remove mongodb $servicename

#test1.3 enable all disable collstats
servicename="testing1.3"
docker exec pmm-client pmm-admin add mongodb --username=admin --password=admin --service-name=$servicename --enable-all-collectors --disable-collectors=collstats --max-collections-limit=100 --host=some-mongo --port=27017
#Getting Agent_ID
docker exec pmm-client pmm-admin list > list.txt
serviceid=$(awk '/'"$servicename"'/ {print $4}' list.txt)
prefix="/service_id/"
idnumber=${serviceid#"$prefix"}
awk '/'"$idnumber"'/ {print $4}' list.txt > getagentid.txt
agentid=$(awk '/agent_id/ {print}' getagentid.txt)
#Getting Port
sleep 10
originstring=$(docker exec pmm-client ps aux | grep /mongodb_exporter)
port=${originstring: -5}
echo "port=$port"
if [[ "$originstring" == *' --collector.topmetrics '* ]]; then
  echo "topmetrics is in process status."
else
  echo "topmetrics is NOT in process status."
fi
if [[ "$originstring" == *' --collector.dbstats '* ]]; then
  echo "dbstats is in process status."
else
  echo "dbstats is NOT in process status."
fi
if [[ "$originstring" == *' --collector.collstats '* ]]; then
  echo "collstats is in process status."
else
  echo "collstats is NOT in process status."
fi
if [[ "$originstring" == *' --collector.indexstats '* ]]; then
  echo "indexstats is in process status."
else
  echo "indexstats is NOT in process status."
fi
#tokenizing and checking if the right collectors are working
export token=$(printf '%s' pmm:${agentid} | base64)
docker exec pmm-client curl --silent -H "Authorization: Basic ${token}" "http://localhost:$port/metrics" > sr.txt
if grep -q mongodb_top_ sr.txt; then
    echo topmetrics found
else
    echo topmetrics not found
    echo ERROR: was expecting output= topmetrics found
    docker exec pmm-client pmm-admin remove mongodb $servicename
    exit 1
fi
if grep -q mongodb_dbstats_ sr.txt; then
    echo dbstats found
else
    echo dbstats not found
    echo ERROR: was expecting output= dbstats found
    docker exec pmm-client pmm-admin remove mongodb $servicename
    exit 1
fi
if grep -q mongodb_db2_col7_latencystats sr.txt; then
    echo collstats found
    echo ERROR: was expecting output= collstats not found
    docker exec pmm-client pmm-admin remove mongodb $servicename
    exit 1
else
    echo collstats not found
fi
if grep -q index sr.txt; then
    echo indexstats found
else
    echo indexstats not found
    echo ERROR: was expecting output= indexstats found
    docker exec pmm-client pmm-admin remove mongodb $servicename
    exit 1
fi
docker exec pmm-client pmm-admin remove mongodb $servicename

#test1.4 enable all disable indexstats
servicename="testing1.4"
docker exec pmm-client pmm-admin add mongodb --username=admin --password=admin --service-name=$servicename --enable-all-collectors --disable-collectors=indexstats --max-collections-limit=100 --host=some-mongo --port=27017
#Getting Agent_ID
docker exec pmm-client pmm-admin list > list.txt
serviceid=$(awk '/'"$servicename"'/ {print $4}' list.txt)
prefix="/service_id/"
idnumber=${serviceid#"$prefix"}
awk '/'"$idnumber"'/ {print $4}' list.txt > getagentid.txt
agentid=$(awk '/agent_id/ {print}' getagentid.txt)
#Getting Port
sleep 10
originstring=$(docker exec pmm-client ps aux | grep /mongodb_exporter)
port=${originstring: -5}
echo "port=$port"
if [[ "$originstring" == *' --collector.topmetrics '* ]]; then
  echo "topmetrics is in process status."
else
  echo "topmetrics is NOT in process status."
fi
if [[ "$originstring" == *' --collector.dbstats '* ]]; then
  echo "dbstats is in process status."
else
  echo "dbstats is NOT in process status."
fi
if [[ "$originstring" == *' --collector.collstats '* ]]; then
  echo "collstats is in process status."
else
  echo "collstats is NOT in process status."
fi
if [[ "$originstring" == *' --collector.indexstats '* ]]; then
  echo "indexstats is in process status."
else
  echo "indexstats is NOT in process status."
fi
#tokenizing and checking if the right collectors are working
export token=$(printf '%s' pmm:${agentid} | base64)
docker exec pmm-client curl --silent -H "Authorization: Basic ${token}" "http://localhost:$port/metrics" > sr.txt
if grep -q mongodb_top_ sr.txt; then
    echo topmetrics found
else
    echo topmetrics not found
    echo ERROR: was expecting output= topmetrics found
    docker exec pmm-client pmm-admin remove mongodb $servicename
    exit 1
fi
if grep -q mongodb_dbstats_ sr.txt; then
    echo dbstats found
else
    echo dbstats not found
    echo ERROR: was expecting output= dbstats found
    docker exec pmm-client pmm-admin remove mongodb $servicename
    exit 1
fi
if grep -q mongodb_db2_col7_latencystats sr.txt; then
    echo collstats found
else
    echo collstats not found
    echo ERROR: was expecting output= collstats found
    docker exec pmm-client pmm-admin remove mongodb $servicename
    exit 1
fi
if grep -q index sr.txt; then
    echo indexstats found
    echo ERROR: was expecting output= indexstats not found
    docker exec pmm-client pmm-admin remove mongodb $servicename
    exit 1
else
    echo indexstats not found
fi
docker exec pmm-client pmm-admin remove mongodb $servicename

#test1.5 enableall disable=none maxcollectionslimit=10 totalcollections=12
servicename="testing1.5"
docker exec pmm-client pmm-admin add mongodb --username=admin --password=admin --service-name=$servicename --enable-all-collectors --disable-collectors=indexstats --max-collections-limit=10 --host=some-mongo --port=27017
#Getting Agent_ID
docker exec pmm-client pmm-admin list > list.txt
serviceid=$(awk '/'"$servicename"'/ {print $4}' list.txt)
prefix="/service_id/"
idnumber=${serviceid#"$prefix"}
awk '/'"$idnumber"'/ {print $4}' list.txt > getagentid.txt
agentid=$(awk '/agent_id/ {print}' getagentid.txt)
#Getting Port
sleep 10
originstring=$(docker exec pmm-client ps aux | grep /mongodb_exporter)
port=${originstring: -5}
echo "port=$port"
if [[ "$originstring" == *' --collector.topmetrics '* ]]; then
  echo "topmetrics is in process status."
else
  echo "topmetrics is NOT in process status."
fi
if [[ "$originstring" == *' --collector.dbstats '* ]]; then
  echo "dbstats is in process status."
else
  echo "dbstats is NOT in process status."
fi
if [[ "$originstring" == *' --collector.collstats '* ]]; then
  echo "collstats is in process status."
else
  echo "collstats is NOT in process status."
fi
if [[ "$originstring" == *' --collector.indexstats '* ]]; then
  echo "indexstats is in process status."
else
  echo "indexstats is NOT in process status."
fi
#tokenizing and checking if the right collectors are working
export token=$(printf '%s' pmm:${agentid} | base64)
docker exec pmm-client curl --silent -H "Authorization: Basic ${token}" "http://localhost:$port/metrics" > sr.txt
if grep -q mongodb_top_ sr.txt; then
    echo topmetrics found
    echo ERROR: was expecting output= topmetrics not found
    docker exec pmm-client pmm-admin remove mongodb $servicename
    exit 1
else
    echo topmetrics not found
fi
if grep -q mongodb_dbstats_ sr.txt; then
    echo dbstats found
    echo ERROR: was expecting output= dbstats not found
    docker exec pmm-client pmm-admin remove mongodb $servicename
    exit 1
else
    echo dbstats not found
fi
if grep -q mongodb_db2_col7_latencystats sr.txt; then
    echo collstats found
    echo ERROR: was expecting output= collstats not found
    docker exec pmm-client pmm-admin remove mongodb $servicename
    exit 1
else
    echo collstats not found
fi
if grep -q index sr.txt; then
    echo indexstats found
    echo ERROR: was expecting output= indexstats not found
    docker exec pmm-client pmm-admin remove mongodb $servicename
    exit 1
else
    echo indexstats not found
fi
docker exec pmm-client pmm-admin remove mongodb $servicename

#test1.6 enable all disable none statscollection db2.col7
servicename="testing1.6"
docker exec pmm-client pmm-admin add mongodb --username=admin --password=admin --service-name=$servicename --enable-all-collectors --max-collections-limit=100 --stats-collection=db2.col7 --host=some-mongo --port=27017
#Getting Agent_ID
docker exec pmm-client pmm-admin list > list.txt
serviceid=$(awk '/'"$servicename"'/ {print $4}' list.txt)
prefix="/service_id/"
idnumber=${serviceid#"$prefix"}
awk '/'"$idnumber"'/ {print $4}' list.txt > getagentid.txt
agentid=$(awk '/agent_id/ {print}' getagentid.txt)
#Getting Port
sleep 10
originstring=$(docker exec pmm-client ps aux | grep /mongodb_exporter)
port=${originstring: -5}
echo "port=$port"
if [[ "$originstring" == *' --collector.topmetrics '* ]]; then
  echo "topmetrics is in process status."
else
  echo "topmetrics is NOT in process status."
fi
if [[ "$originstring" == *' --collector.dbstats '* ]]; then
  echo "dbstats is in process status."
else
  echo "dbstats is NOT in process status."
fi
if [[ "$originstring" == *' --collector.collstats '* ]]; then
  echo "collstats is in process status."
else
  echo "collstats is NOT in process status."
fi
if [[ "$originstring" == *' --collector.indexstats '* ]]; then
  echo "indexstats is in process status."
else
  echo "indexstats is NOT in process status."
fi
#tokenizing and checking if the right collectors are working
export token=$(printf '%s' pmm:${agentid} | base64)
docker exec pmm-client curl --silent -H "Authorization: Basic ${token}" "http://localhost:$port/metrics" > sr.txt
if grep -q mongodb_top_ sr.txt; then
    echo topmetrics found
else
    echo topmetrics not found
    echo ERROR: was expecting output= topmetrics found
    docker exec pmm-client pmm-admin remove mongodb $servicename
    exit 1
fi
if grep -q mongodb_dbstats_ sr.txt; then
    echo dbstats found
else
    echo dbstats not found
    echo ERROR: was expecting output= dbstats found
    docker exec pmm-client pmm-admin remove mongodb $servicename
    exit 1
fi
if grep -q mongodb_db2_col7_latencystats sr.txt; then
    echo collstats found
else
    echo collstats not found
    echo ERROR: was expecting output= collstats found
    docker exec pmm-client pmm-admin remove mongodb $servicename
    exit 1
fi
if grep -q index sr.txt; then
    echo indexstats found
else
    echo indexstats not found
    echo ERROR: was expecting output= indexstats found
    docker exec pmm-client pmm-admin remove mongodb $servicename
    exit 1
fi
docker exec pmm-client pmm-admin remove mongodb $servicename

#test1.7 enable all disable none statscollection db2.col5 grepping mongodb_db2_col7_latencystats
servicename="testing1.7"
echo "$servicename"
docker exec pmm-client pmm-admin add mongodb --username=admin --password=admin --service-name=$servicename --enable-all-collectors --max-collections-limit=100 --stats-collection=db2.col5 --host=some-mongo --port=27017
#Getting Agent_ID
docker exec pmm-client pmm-admin list > list.txt
serviceid=$(awk '/'"$servicename"'/ {print $4}' list.txt)
prefix="/service_id/"
idnumber=${serviceid#"$prefix"}
awk '/'"$idnumber"'/ {print $4}' list.txt > getagentid.txt
agentid=$(awk '/agent_id/ {print}' getagentid.txt)
#Getting Port
sleep 10
originstring=$(docker exec pmm-client ps aux | grep /mongodb_exporter)
port=${originstring: -5}
echo "port=$port"
if [[ "$originstring" == *' --collector.topmetrics '* ]]; then
  echo "topmetrics is in process status."
else
  echo "topmetrics is NOT in process status."
fi
if [[ "$originstring" == *' --collector.dbstats '* ]]; then
  echo "dbstats is in process status."
else
  echo "dbstats is NOT in process status."
fi
if [[ "$originstring" == *' --collector.collstats '* ]]; then
  echo "collstats is in process status."
else
  echo "collstats is NOT in process status."
fi
if [[ "$originstring" == *' --collector.indexstats '* ]]; then
  echo "indexstats is in process status."
else
  echo "indexstats is NOT in process status."
fi
#tokenizing and checking if the right collectors are working
export token=$(printf '%s' pmm:${agentid} | base64)
docker exec pmm-client curl --silent -H "Authorization: Basic ${token}" "http://localhost:$port/metrics" > sr.txt
if grep -q mongodb_top_ sr.txt; then
    echo topmetrics found
else
    echo topmetrics not found
    echo ERROR: was expecting output= topmetrics found
    docker exec pmm-client pmm-admin remove mongodb $servicename
    exit 1
fi
if grep -q mongodb_dbstats_ sr.txt; then
    echo dbstats found
else
    echo dbstats not found
    echo ERROR: was expecting output= dbstats found
    docker exec pmm-client pmm-admin remove mongodb $servicename
    exit 1
fi
if grep -q mongodb_db2_col7_latencystats sr.txt; then
    echo collstats found
    echo ERROR: was expecting output= collstats not found
    docker exec pmm-client pmm-admin remove mongodb $servicename
    exit 1
else
    echo collstats not found
fi
if grep -q index sr.txt; then
    echo indexstats found
else
    echo indexstats not found
    echo ERROR: was expecting output= indexstats found
    docker exec pmm-client pmm-admin remove mongodb $servicename
    exit 1
fi
docker exec pmm-client pmm-admin remove mongodb $servicename