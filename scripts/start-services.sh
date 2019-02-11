#!/usr/bin/env bash
export _JAVA_OPTIONS=-Xmx1048m

# Start Elasticsearch
sudo service elasticsearch start
# Wait for Elasticsearch to start up before doing anything.
until curl -s http://localhost:9200/_cat/health -o /dev/null; do
    echo Waiting for Elasticsearch to start...
    sleep 3
done

# Start Kibana
sudo service kibana start

# Wait for Kibana to start up before doing anything.
until curl -s http://localhost:5601/ -o /dev/null; do
    echo Waiting for Kibana...
    sleep 3
done