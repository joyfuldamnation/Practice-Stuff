#!/bin/bash
#docker create --volume /srv --name pmm-client-data percona/pmm-client:2 /bin/true
#PMM_SERVER=172.18.0.2
#docker run -d --rm --network pmm-test --name pmm-client -e PMM_AGENT_SERVER_ADDRESS=${PMM_SERVER} -e PMM_AGENT_SERVER_USERNAME=admin -e PMM_AGENT_SERVER_PASSWORD=admin -e PMM_AGENT_SERVER_INSECURE_TLS=1 -e PMM_AGENT_SETUP=1 -e PMM_AGENT_CONFIG_FILE=pmm-agent.yml --volumes-from pmm-client-data percona/pmm-client:2
#docker run -d --network pmm-test --name some-mongo -e MONGO_INITDB_ROOT_USERNAME=admin -e MONGO_INITDB_ROOT_PASSWORD=admin -e ME_CONFIG_MONGODB_ADMINUSERNAME=admin -e ME_CONFIG_MONGODB_ADMINPASSWORD=admin mongo
echo "Enter Service name"
read servicename
#echo "Enable all collectors?(Y/n)"
#read enableans
#if [[$enableans == "Y"]] || [[$enableans == "y"]]
#then
#  echo "Disable which collectors?"
#  read
docker exec pmm-client pmm-admin add mongodb --username=admin --password=admin --service-name=$servicename --enable-all-collectors --max-collections-limit=100 --host=some-mongo --port=27017
#docker exec pmm-client pmm-admin list
#Getting Agent_ID
docker exec pmm-client pmm-admin list > list.txt
serviceid=$(awk '/'"$servicename"'/ {print $4}' list.txt)
prefix="/service_id/"
idnumber=${serviceid#"$prefix"}
    #awk '$2 == "mongodb_exporter" && $2 == "'"$idnumber"'"' list.txt
awk '/'"$idnumber"'/ {print $4}' list.txt > getagentid.txt
agentid=$(awk '/agent_id/ {print}' getagentid.txt)
#echo "$agentid"
#Getting Port
sleep 10
originstring=$(docker exec pmm-client ps aux | grep /mongodb_exporter)
port=${originstring: -5}
echo "$port"
#tokenizing and checking if the right collectors are working
export token=$(printf '%s' pmm:${agentid} | base64)
docker exec pmm-client curl --silent -H "Authorization: Basic ${token}" "http://localhost:$port/metrics" > scriptrunning.txt
docker exec pmm-client pmm-admin remove mongodb $servicename



#docker create --volume /srv --name pmm-client-data percona/pmm-client:2 /bin/true
#PMM_SERVER=172.18.0.2
#docker run -d --rm --network pmm-test --name pmm-client -e PMM_AGENT_SERVER_ADDRESS=${PMM_SERVER} -e PMM_AGENT_SERVER_USERNAME=admin -e PMM_AGENT_SERVER_PASSWORD=admin -e PMM_AGENT_SERVER_INSECURE_TLS=1 -e PMM_AGENT_SETUP=1 -e PMM_AGENT_CONFIG_FILE=pmm-agent.yml --volumes-from pmm-client-data percona/pmm-client:2
#docker run -d --network pmm-test --name some-mongo -e MONGO_INITDB_ROOT_USERNAME=admin -e MONGO_INITDB_ROOT_PASSWORD=admin -e ME_CONFIG_MONGODB_ADMINUSERNAME=admin -e ME_CONFIG_MONGODB_ADMINPASSWORD=admin mongo
#echo "Enter Service name"
#servicename="mongo7"
#echo "$servicename"
#docker exec pmm-client pmm-admin add mongodb --username=admin --password=admin --service-name=$servicename --enable-all-collectors --disable-collectors=topmetrics,indexstats,dbstats --max-collections-limit=100 --host=some-mongo --port=27017
#docker exec pmm-client pmm-admin list
#Getting Agent_ID
#docker exec pmm-client pmm-admin list > list
#serviceid=$(awk '/'"$servicename"'/ {print $4}' list)
#idnumber=${serviceid#"/service_id/"}
    #awk '$2 == "mongodb_exporter" && $2 == "'"$idnumber"'"' list.txt
#awk '/'"$idnumber"'/ {print $4}' list > getagentid
#agentid=$(awk '/agent_id/ {print}' getagentid)
#echo "$agentid"
#Getting Port
#sleep 10
#originstring=$(docker exec pmm-client ps aux | grep /mongodb_exporter)
#port=${originstring: -5}
#echo "$port"
#if [[ "$originstring" == *' --collector.topmetrics '* ]]; then
#  echo "topmetrics is there in process status."
#else
#  echo "topmetrics is NOT there in process status."
#fi
#if [[ "$originstring" == *' --collector.dbstats '* ]]; then
#  echo "dbstats is there in process status."
#else
#  echo "dbstats is NOT there in process status."
#fi
#if [[ "$originstring" == *' --collector.collstats '* ]]; then
#  echo "collstats is there in process status."
#else
#  echo "collstats is NOT there in process status."
#fi
#if [[ "$originstring" == *' --collector.indexstats '* ]]; then
#  echo "indexstats is there in process status."
#else
#  echo "indexstats is NOT there in process status."
#fi
#tokenizing and checking if the right collectors are working
#export token=$(printf '%s' pmm:${agentid} | base64)
#docker exec pmm-client curl --silent -H "Authorization: Basic ${token}" "http://localhost:$port/metrics" > sr



#function myFunction() {
#    var text = "";
#    db = 4;
#    col= 3;
#    var i;
#    var j;
#    for (i = 0; i < db; i++) {
#        print("use db"+j+"\n");
#        for (j = 0; j < col; j++) {
#            print("db.createCollection('col"+j+"')\n");
#            print("db.col"+j+".insertMany([ {name: 'db"+i+"col"+j+"obj1', origin: 'usa', price: 5}, {name: 'orange', origin: 'italy', price: 3}, {name: 'mango', origin: 'malaysia', price: 3} ]\n");
#        }
#    }
#}
