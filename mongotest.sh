#!/bin/bash

totalcollections=15
#create named parameters
while getopts ":d:m:s:t:" opt; do
  case $opt in
    d) disablecollectors="$OPTARG"
    ;;
    m) maxcollectionslimit="$OPTARG"
    ;;
    s) statscollections="$OPTARG"
    ;;
    t) totalcollections="$OPTARG"
    ;;
  esac
done

#test
servicename="testing"
if [ ! -z "$maxcollectionslimit" ] && [ ! -z "$statscollections" ]; then
    pmm-admin add mongodb --username=admin --password=admin --service-name=$servicename --enable-all-collectors --disable-collectors=$disablecollectors --max-collections-limit=$maxcollectionslimit --stats-collections=$statscollections --host=some-mongo --port=27017
elif [ ! -z "$maxcollectionslimit" ]; then
    pmm-admin add mongodb --username=admin --password=admin --service-name=$servicename --enable-all-collectors --disable-collectors=$disablecollectors --max-collections-limit=$maxcollectionslimit --host=some-mongo --port=27017
elif [ ! -z "$statscollections" ]; then
    pmm-admin add mongodb --username=admin --password=admin --service-name=$servicename --enable-all-collectors --disable-collectors=$disablecollectors --stats-collections=$statscollections --host=some-mongo --port=27017
else
    pmm-admin add mongodb --username=admin --password=admin --service-name=$servicename --enable-all-collectors --disable-collectors=$disablecollectors --host=some-mongo --port=27017
fi

#Getting Agent_ID
export serviceid=$(pmm-admin list | grep ${servicename} | awk -F" " '{print $4}')
export agentid=$(pmm-admin list | grep ${serviceid} | grep mongodb_exporter | awk -F" " '{print $4}')
#Getting Port
sleep 1
ports=$(ps aux | grep -v grep | grep /mongodb_exporter | awk -F"web.listen-address=:" '{print $2}')
port=${ports: -5}
echo "port=$port"
#tokenizing and checking if the right collectors are working
export token=$(printf '%s' pmm:${agentid} | base64)
#
if [[ -z "$statscollections" ]]; then
    #maxcollectionslimit
    if [[ "$maxcollectionslimit" -gt "$totalcollections" ]]; then
        #topmetrics
        if [[ "$disablecollectors" == *'topmetrics'* ]]; then
            if curl --silent -H "Authorization: Basic ${token}" "http://localhost:$port/metrics" | grep -q mongodb_top_ ; then
                echo topmetrics found
                echo ERROR: was expecting output= topmetrics not found
                pmm-admin remove mongodb $servicename
                exit 1
            else
                echo topmetrics not found
            fi
        else
            if curl --silent -H "Authorization: Basic ${token}" "http://localhost:$port/metrics" | grep -q mongodb_top_ ; then
                echo topmetrics found
            else
                echo topmetrics not found
                echo ERROR: was expecting output= topmetrics found
                pmm-admin remove mongodb $servicename
                exit 1
            fi
        fi
        #dbstats
        if [[ "$disablecollectors" == *'dbstats'* ]]; then
            if curl --silent -H "Authorization: Basic ${token}" "http://localhost:$port/metrics" | grep -q mongodb_dbstats_ ; then
                echo dbstats found
                echo ERROR: was expecting output= dbstats not found
                pmm-admin remove mongodb $servicename
                exit 1
            else
                echo dbstats not found
            fi
        else
            if curl --silent -H "Authorization: Basic ${token}" "http://localhost:$port/metrics" | grep -q mongodb_dbstats_ ; then
                echo dbstats found
            else
                echo dbstats not found
                echo ERROR: was expecting output= dbstats found
                pmm-admin remove mongodb $servicename
                exit 1
            fi
        fi
        #collstats
        if [[ "$disablecollectors" == *'collstats'* ]]; then
            if curl --silent -H "Authorization: Basic ${token}" "http://localhost:$port/metrics" | grep -q mongodb_db_col_latencystats ; then
                echo collstats found
                echo ERROR: was expecting output= collstats not found
                pmm-admin remove mongodb $servicename
                exit 1
            else
                echo collstats not found
            fi
        else
            if curl --silent -H "Authorization: Basic ${token}" "http://localhost:$port/metrics" | grep -q mongodb_db_col_latencystats ; then
                echo collstats found
            else
                echo collstats not found
                echo ERROR: was expecting output= collstats found
                pmm-admin remove mongodb $servicename
                exit 1
            fi
        fi
        #indexstats
        if [[ "$disablecollectors" == *'collstats'* ]]; then
            if curl --silent -H "Authorization: Basic ${token}" "http://localhost:$port/metrics" | grep -q mongodb_index_ ; then
                echo indexstats found
                echo ERROR: was expecting output= indexstats not found
                pmm-admin remove mongodb $servicename
                exit 1
            else
                echo indexstats not found
            fi
        else
            if curl --silent -H "Authorization: Basic ${token}" "http://localhost:$port/metrics" | grep -q mongodb_index_ ; then
                echo indexstats found
            else
                echo indexstats not found
                echo ERROR: was expecting output= indexstats found
                pmm-admin remove mongodb $servicename
                exit 1
            fi
        fi
    else
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
        if curl --silent -H "Authorization: Basic ${token}" "http://localhost:$port/metrics" | grep -q mongodb_index_ ; then
            echo indexstats found
            echo ERROR: was expecting output= indexstats not found
            pmm-admin remove mongodb $servicename
            exit 1
        else
            echo indexstats not found
        fi
    fi
else
    arr=(${statscollections//","/" "})
    for val in "${arr[@]}";
    do
        if [[ "$val" == *"."* ]]; then
            if curl --silent -H "Authorization: Basic ${token}" "http://localhost:$port/metrics" | grep -q mongodb_"${val/"."/_}"_latencystats ; then
                echo collstats found at "${val/"."/_}"
            else
                echo collstats not found at "${val/"."/_}"
                echo ERROR: was expecting output= collstats found at "${val/"."/_}"
                pmm-admin remove mongodb $servicename
                exit 1
            fi
#            if curl --silent -H "Authorization: Basic ${token}" "http://localhost:$port/metrics" | grep -q mongodb_index_ ; then
#                echo indexstats found at "${val/"."/_}"
#            else
#                echo indexstats not found at "${val/"."/_}"
#            fi
        else
            if curl --silent -H "Authorization: Basic ${token}" "http://localhost:$port/metrics" | grep -q mongodb_"$val"_col1_latencystats ; then
                echo collstats found at "$val"_col1
            else
                echo collstats not found at "$val"_col1
                echo ERROR: was expecting output= collstats found at "$val"_col1
                pmm-admin remove mongodb $servicename
                exit 1
            fi
        fi
    done
fi

pmm-admin remove mongodb $servicename
echo TEST SUCCESS