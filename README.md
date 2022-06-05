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

**Default security is disabled, check /etc/elasticsearch/elasticsearch.ym**

## Software installed
Java Runtime Environment    
Elasticsearch 8.2.1 (https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-8.2.1.deb)     
Kibana 8.2.2 (https://artifacts.elastic.co/downloads/kibana/kibana-8.2.1-amd64.deb)         
Ubuntu 18.04.6 LTS (https://app.vagrantup.com/ubuntu/boxes/bionic64/versions/20220523.0.0)   


## Start automatically with security on

To enable the security feature comment out line 48 and line 53 ioon ``install-elastic.sh`` script (those disables the default security) and comment out the manual start script from Vagrantfile:
```
# config.vm.provision :shell, path: "scripts/start-services.sh", run: 'always'
```
Then run:
```
vagrant ssh
sudo systemctl enable kibana.service
sudo systemctl enable elasticsearch.service
```

## Export

If you're going to export the vagrant box and you want the elasticsearch data to be exported too
switch the following lines in ``Vagrantfile``           

```
ubuntu.vm.synced_folder "elastic-stack/", "/elastic-stack/"
#ubuntu.vm.synced_folder "elastic-stack/", "/elastic-stack/", type: "rsync" 
```

## TODO
1. Find a better way to determine if kibana is fully loaded and exposed through http
