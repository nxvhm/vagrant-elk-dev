# Elasticsearch/Kibana simple dev. environment based on Vagrant and Virtualbox

## Installation
0. Download and install [Virtualbox](https://www.virtualbox.org/wiki/Downloads) and [Vagrant](https://www.vagrantup.com/downloads.html)  
1. Clone the repository 
2. ``cd valgrant-elk-dev``
3. ``mkdir elastic-stack``        
This is the default shared folder which will contain the elasticsearch data
3. `` vagrant up``

*Required Vagrant version >= 1.9.6*

After boot and provision Elastcisearch should be available on the host machine on localhost:9200
and Kibana should be available on localhost:5601

## Software installed
Java Runtime Environment    
Elasticsearch 6.6.0 (https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.6.0.deb)     
Kibana 6.6.0 (https://artifacts.elastic.co/downloads/kibana/kibana-6.6.0-amd64.deb)      

## Export

If you're going to export the vagrant box and you want the elasticsearch data to be exported too
switch the following lines in ``Vagrantfile``           

```
ubuntu.vm.synced_folder "elastic-stack/", "/elastic-stack/"
#ubuntu.vm.synced_folder "elastic-stack/", "/elastic-stack/", type: "rsync" 
```

## TODO
1. Find a better way to determine if kibana is fully loaded and exposed through http
2. Add Elasticsearch authentication
