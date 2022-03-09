#!/bin/bash

#test1.0 enable all disable none
servicename="testing1.0"
pmm-admin add mongodb --username=admin --password=admin --service-name=$servicename --enable-all-collectors --max-collections-limit=100 --host=some-mongo --port=27017
#Getting Agent_ID
export serviceid=$(pmm-admin list | grep ${servicename} | awk -F" " '{print $4}')
export agentid=$(pmm-admin list | grep ${serviceid} | grep mongodb_exporter | awk -F" " '{print $4}')
#Getting Port
sleep 10
port=$(ps aux | grep -v grep | grep /mongodb_exporter | awk -F"web.listen-address=:" '{print $2}')
echo "port=$port"
#tokenizing and checking if the right collectors are working
export token=$(printf '%s' pmm:${agentid} | base64)
if curl --silent -H "Authorization: Basic ${token}" "http://localhost:$port/metrics" | grep -q mongodb_top_ ; then
    echo topmetrics found
else
    echo topmetrics not found
    echo ERROR: was expecting output= topmetrics found
    pmm-admin remove mongodb $servicename
    exit 1
fi
if curl --silent -H "Authorization: Basic ${token}" "http://localhost:$port/metrics" | grep -q mongodb_dbstats_ ; then
    echo dbstats found
else
    echo dbstats not found
    echo ERROR: was expecting output= dbstats found
    pmm-admin remove mongodb $servicename
    exit 1
fi
if curl --silent -H "Authorization: Basic ${token}" "http://localhost:$port/metrics" | grep -q mongodb_db2_col7_latencystats ; then
    echo collstats found
else
    echo collstats not found
    echo ERROR: was expecting output= collstats found
    pmm-admin remove mongodb $servicename
    exit 1
fi
if curl --silent -H "Authorization: Basic ${token}" "http://localhost:$port/metrics" | grep -q index ; then
    echo indexstats found
else
    echo indexstats not found
    echo ERROR: was expecting output= indexstats found
    pmm-admin remove mongodb $servicename
    exit 1
fi
pmm-admin remove mongodb $servicename

#test1.1 enable all disable topstats
servicename="testing1.1"
pmm-admin add mongodb --username=admin --password=admin --service-name=$servicename --enable-all-collectors --disable-collectors=topstats --max-collections-limit=100 --host=some-mongo --port=27017
#Getting Agent_ID
export serviceid=$(pmm-admin list | grep ${servicename} | awk -F" " '{print $4}')
export agentid=$(pmm-admin list | grep ${serviceid} | grep mongodb_exporter | awk -F" " '{print $4}')
#Getting Port
sleep 10
port=$(ps aux | grep -v grep | grep /mongodb_exporter | awk -F"web.listen-address=:" '{print $2}')
echo "port=$port"
#tokenizing and checking if the right collectors are working
export token=$(printf '%s' pmm:${agentid} | base64)

if curl --silent -H "Authorization: Basic ${token}" "http://localhost:$port/metrics" | grep -q mongodb_top_ ; then
    echo topmetrics found
    echo ERROR: was expecting output= topmetrics not found
    pmm-admin remove mongodb $servicename
    exit 1
else
    echo topmetrics not found
fi
if curl --silent -H "Authorization: Basic ${token}" "http://localhost:$port/metrics" | grep -q mongodb_dbstats_ ; then
    echo dbstats found
else
    echo dbstats not found
    echo ERROR: was expecting output= dbstats found
    pmm-admin remove mongodb $servicename
    exit 1
fi
if curl --silent -H "Authorization: Basic ${token}" "http://localhost:$port/metrics" | grep -q mongodb_db2_col7_latencystats ; then
    echo collstats found
else
    echo collstats not found
    echo ERROR: was expecting output= collstats found
    pmm-admin remove mongodb $servicename
    exit 1
fi
if curl --silent -H "Authorization: Basic ${token}" "http://localhost:$port/metrics" | grep -q index ; then
    echo indexstats found
else
    echo indexstats not found
    echo ERROR: was expecting output= indexstats found
    pmm-admin remove mongodb $servicename
    exit 1
fi
pmm-admin remove mongodb $servicename

#test1.2 enable all disable dbstats
servicename="testing1.2"
pmm-admin add mongodb --username=admin --password=admin --service-name=$servicename --enable-all-collectors --disable-collectors=dbstats --max-collections-limit=100 --host=some-mongo --port=27017
#Getting Agent_ID
export serviceid=$(pmm-admin list | grep ${servicename} | awk -F" " '{print $4}')
export agentid=$(pmm-admin list | grep ${serviceid} | grep mongodb_exporter | awk -F" " '{print $4}')
#Getting Port
sleep 10
port=$(ps aux | grep -v grep | grep /mongodb_exporter | awk -F"web.listen-address=:" '{print $2}')
echo "port=$port"
#tokenizing and checking if the right collectors are working
export token=$(printf '%s' pmm:${agentid} | base64)

if curl --silent -H "Authorization: Basic ${token}" "http://localhost:$port/metrics" | grep -q mongodb_top_ ; then
    echo topmetrics found
else
    echo topmetrics not found
    echo ERROR: was expecting output= topmetrics found
    pmm-admin remove mongodb $servicename
    exit 1
fi
if curl --silent -H "Authorization: Basic ${token}" "http://localhost:$port/metrics" | grep -q mongodb_dbstats_ ; then
    echo dbstats found
    echo ERROR: was expecting output= dbstats not found
    pmm-admin remove mongodb $servicename
    exit 1
else
    echo dbstats not found
fi
if curl --silent -H "Authorization: Basic ${token}" "http://localhost:$port/metrics" | grep -q mongodb_db2_col7_latencystats ; then
    echo collstats found
else
    echo collstats not found
    echo ERROR: was expecting output= collstats found
    pmm-admin remove mongodb $servicename
    exit 1
fi
if curl --silent -H "Authorization: Basic ${token}" "http://localhost:$port/metrics" | grep -q index ; then
    echo indexstats found
else
    echo indexstats not found
    echo ERROR: was expecting output= indexstats found
    pmm-admin remove mongodb $servicename
    exit 1
fi
pmm-admin remove mongodb $servicename

#test1.3 enable all disable collstats
servicename="testing1.3"
pmm-admin add mongodb --username=admin --password=admin --service-name=$servicename --enable-all-collectors --disable-collectors=collstats --max-collections-limit=100 --host=some-mongo --port=27017
#Getting Agent_ID
export serviceid=$(pmm-admin list | grep ${servicename} | awk -F" " '{print $4}')
export agentid=$(pmm-admin list | grep ${serviceid} | grep mongodb_exporter | awk -F" " '{print $4}')
#Getting Port
sleep 10
port=$(ps aux | grep -v grep | grep /mongodb_exporter | awk -F"web.listen-address=:" '{print $2}')
echo "port=$port"
#tokenizing and checking if the right collectors are working
export token=$(printf '%s' pmm:${agentid} | base64)

if curl --silent -H "Authorization: Basic ${token}" "http://localhost:$port/metrics" | grep -q mongodb_top_ ; then
    echo topmetrics found
else
    echo topmetrics not found
    echo ERROR: was expecting output= topmetrics found
    pmm-admin remove mongodb $servicename
    exit 1
fi
if curl --silent -H "Authorization: Basic ${token}" "http://localhost:$port/metrics" | grep -q mongodb_dbstats_ ; then
    echo dbstats found
else
    echo dbstats not found
    echo ERROR: was expecting output= dbstats found
    pmm-admin remove mongodb $servicename
    exit 1
fi
if curl --silent -H "Authorization: Basic ${token}" "http://localhost:$port/metrics" | grep -q mongodb_db2_col7_latencystats ; then
    echo collstats found
    echo ERROR: was expecting output= collstats not found
    pmm-admin remove mongodb $servicename
    exit 1
else
    echo collstats not found
fi
if curl --silent -H "Authorization: Basic ${token}" "http://localhost:$port/metrics" | grep -q index ; then
    echo indexstats found
else
    echo indexstats not found
    echo ERROR: was expecting output= indexstats found
    pmm-admin remove mongodb $servicename
    exit 1
fi
pmm-admin remove mongodb $servicename

#test1.4 enable all disable indexstats
servicename="testing1.4"
pmm-admin add mongodb --username=admin --password=admin --service-name=$servicename --enable-all-collectors --disable-collectors=indexstats --max-collections-limit=100 --host=some-mongo --port=27017
#Getting Agent_ID
export serviceid=$(pmm-admin list | grep ${servicename} | awk -F" " '{print $4}')
export agentid=$(pmm-admin list | grep ${serviceid} | grep mongodb_exporter | awk -F" " '{print $4}')
#Getting Port
sleep 10
port=$(ps aux | grep -v grep | grep /mongodb_exporter | awk -F"web.listen-address=:" '{print $2}')
echo "port=$port"
#tokenizing and checking if the right collectors are working
export token=$(printf '%s' pmm:${agentid} | base64)

if curl --silent -H "Authorization: Basic ${token}" "http://localhost:$port/metrics" | grep -q mongodb_top_ ; then
    echo topmetrics found
else
    echo topmetrics not found
    echo ERROR: was expecting output= topmetrics found
    pmm-admin remove mongodb $servicename
    exit 1
fi
if curl --silent -H "Authorization: Basic ${token}" "http://localhost:$port/metrics" | grep -q mongodb_dbstats_ ; then
    echo dbstats found
else
    echo dbstats not found
    echo ERROR: was expecting output= dbstats found
    pmm-admin remove mongodb $servicename
    exit 1
fi
if curl --silent -H "Authorization: Basic ${token}" "http://localhost:$port/metrics" | grep -q mongodb_db2_col7_latencystats ; then
    echo collstats found
else
    echo collstats not found
    echo ERROR: was expecting output= collstats found
    pmm-admin remove mongodb $servicename
    exit 1
fi
if curl --silent -H "Authorization: Basic ${token}" "http://localhost:$port/metrics" | grep -q index ; then
    echo indexstats found
    echo ERROR: was expecting output= indexstats not found
    pmm-admin remove mongodb $servicename
    exit 1
else
    echo indexstats not found
fi
pmm-admin remove mongodb $servicename

#test1.5 enableall disable=none maxcollectionslimit=10 totalcollections=12
servicename="testing1.5"
pmm-admin add mongodb --username=admin --password=admin --service-name=$servicename --enable-all-collectors --disable-collectors=indexstats --max-collections-limit=10 --host=some-mongo --port=27017
#Getting Agent_ID
export serviceid=$(pmm-admin list | grep ${servicename} | awk -F" " '{print $4}')
export agentid=$(pmm-admin list | grep ${serviceid} | grep mongodb_exporter | awk -F" " '{print $4}')
#Getting Port
sleep 10
port=$(ps aux | grep -v grep | grep /mongodb_exporter | awk -F"web.listen-address=:" '{print $2}')
echo "port=$port"
#tokenizing and checking if the right collectors are working
export token=$(printf '%s' pmm:${agentid} | base64)

if curl --silent -H "Authorization: Basic ${token}" "http://localhost:$port/metrics" | grep -q mongodb_top_ ; then
    echo topmetrics found
    echo ERROR: was expecting output= topmetrics not found
    pmm-admin remove mongodb $servicename
    exit 1
else
    echo topmetrics not found
fi
if curl --silent -H "Authorization: Basic ${token}" "http://localhost:$port/metrics" | grep -q mongodb_dbstats_ ; then
    echo dbstats found
    echo ERROR: was expecting output= dbstats not found
    pmm-admin remove mongodb $servicename
    exit 1
else
    echo dbstats not found
fi
if curl --silent -H "Authorization: Basic ${token}" "http://localhost:$port/metrics" | grep -q mongodb_db2_col7_latencystats ; then
    echo collstats found
    echo ERROR: was expecting output= collstats not found
    pmm-admin remove mongodb $servicename
    exit 1
else
    echo collstats not found
fi
if curl --silent -H "Authorization: Basic ${token}" "http://localhost:$port/metrics" | grep -q index ; then
    echo indexstats found
    echo ERROR: was expecting output= indexstats not found
    pmm-admin remove mongodb $servicename
    exit 1
else
    echo indexstats not found
fi
pmm-admin remove mongodb $servicename

#test1.6 enable all disable none statscollection db2.col7
servicename="testing1.6"
pmm-admin add mongodb --username=admin --password=admin --service-name=$servicename --enable-all-collectors --max-collections-limit=100 --stats-collection=db2.col7 --host=some-mongo --port=27017
#Getting Agent_ID
export serviceid=$(pmm-admin list | grep ${servicename} | awk -F" " '{print $4}')
export agentid=$(pmm-admin list | grep ${serviceid} | grep mongodb_exporter | awk -F" " '{print $4}')
#Getting Port
sleep 10
port=$(ps aux | grep -v grep | grep /mongodb_exporter | awk -F"web.listen-address=:" '{print $2}')
echo "port=$port"
#tokenizing and checking if the right collectors are working
export token=$(printf '%s' pmm:${agentid} | base64)

if curl --silent -H "Authorization: Basic ${token}" "http://localhost:$port/metrics" | grep -q mongodb_top_ ; then
    echo topmetrics found
else
    echo topmetrics not found
    echo ERROR: was expecting output= topmetrics found
    pmm-admin remove mongodb $servicename
    exit 1
fi
if curl --silent -H "Authorization: Basic ${token}" "http://localhost:$port/metrics" | grep -q mongodb_dbstats_ ; then
    echo dbstats found
else
    echo dbstats not found
    echo ERROR: was expecting output= dbstats found
    pmm-admin remove mongodb $servicename
    exit 1
fi
if curl --silent -H "Authorization: Basic ${token}" "http://localhost:$port/metrics" | grep -q mongodb_db2_col7_latencystats ; then
    echo collstats found
else
    echo collstats not found
    echo ERROR: was expecting output= collstats found
    pmm-admin remove mongodb $servicename
    exit 1
fi
if curl --silent -H "Authorization: Basic ${token}" "http://localhost:$port/metrics" | grep -q index ; then
    echo indexstats found
else
    echo indexstats not found
    echo ERROR: was expecting output= indexstats found
    pmm-admin remove mongodb $servicename
    exit 1
fi
pmm-admin remove mongodb $servicename

#test1.7 enable all disable none statscollection db2.col5 grepping mongodb_db2_col7_latencystats
servicename="testing1.7"
pmm-admin add mongodb --username=admin --password=admin --service-name=$servicename --enable-all-collectors --max-collections-limit=100 --stats-collection=db2.col5 --host=some-mongo --port=27017
#Getting Agent_ID
export serviceid=$(pmm-admin list | grep ${servicename} | awk -F" " '{print $4}')
export agentid=$(pmm-admin list | grep ${serviceid} | grep mongodb_exporter | awk -F" " '{print $4}')
#Getting Port
sleep 10
port=$(ps aux | grep -v grep | grep /mongodb_exporter | awk -F"web.listen-address=:" '{print $2}')
echo "port=$port"
#tokenizing and checking if the right collectors are working
export token=$(printf '%s' pmm:${agentid} | base64)
.txt
if curl --silent -H "Authorization: Basic ${token}" "http://localhost:$port/metrics" | grep -q mongodb_top_ ; then
    echo topmetrics found
else
    echo topmetrics not found
    echo ERROR: was expecting output= topmetrics found
    pmm-admin remove mongodb $servicename
    exit 1
fi
if curl --silent -H "Authorization: Basic ${token}" "http://localhost:$port/metrics" | grep -q mongodb_dbstats_ ; then
    echo dbstats found
else
    echo dbstats not found
    echo ERROR: was expecting output= dbstats found
    pmm-admin remove mongodb $servicename
    exit 1
fi
if curl --silent -H "Authorization: Basic ${token}" "http://localhost:$port/metrics" | grep -q mongodb_db2_col7_latencystats ; then
    echo collstats found
    echo ERROR: was expecting output= collstats not found
    pmm-admin remove mongodb $servicename
    exit 1
else
    echo collstats not found
fi
if curl --silent -H "Authorization: Basic ${token}" "http://localhost:$port/metrics" | grep -q index ; then
    echo indexstats found
else
    echo indexstats not found
    echo ERROR: was expecting output= indexstats found
    pmm-admin remove mongodb $servicename
    exit 1
fi
pmm-admin remove mongodb $servicename

#if [[ "$originstring" == *' --collector.topmetrics '* ]]; then
#  echo "topmetrics is in process status."
#else
#  echo "topmetrics is NOT in process status."
#fi
#if [[ "$originstring" == *' --collector.dbstats '* ]]; then
#  echo "dbstats is in process status."
#else
#  echo "dbstats is NOT in process status."
#fi
#if [[ "$originstring" == *' --collector.collstats '* ]]; then
#  echo "collstats is in process status."
#else
#  echo "collstats is NOT in process status."
#fi
#if [[ "$originstring" == *' --collector.indexstats '* ]]; then
#  echo "indexstats is in process status."
#else
#  echo "indexstats is NOT in process status."
#fi