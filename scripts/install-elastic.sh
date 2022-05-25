#!/usr/bin/env bash
export DEBIAN_FRONTEND=noninteractive

sudo apt-get update
sudo apt-get install software-properties-common

# Install Java if required
if java -version 2>&1 >/dev/null | grep -q "openjdk version" ; then 
    echo "Java Already installed" 
else 
    echo "Java not found. Installing Java Runtime Environment"
    # Install Java Runtime Environment instead of full jdk
    sudo apt-get install default-jre -y
fi

# Download and install the public signing key:
sudo apt-get install apt-transport-https

ELASTIC_DEB_URL="https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-8.2.1-amd64.deb"
ELASTIC_DEB_FILENAME="elasticsearch-8.2.1.deb"

# Download elastic deb
# echo "Downdloading $ELASTIC_DEB_URL"

mkdir /vagrant/tmp &> /dev/null

cd /vagrant/tmp

curl $ELASTIC_DEB_URL --output $ELASTIC_DEB_FILENAME --silent

echo "Finished downloading $ELASTIC_DEB_FILENAME"

echo "Install Elasticsearch"

# Install .deb file
sudo dpkg -i $ELASTIC_DEB_FILENAME

# Remove .deb file
rm $ELASTIC_DEB_FILENAME

# Expose elastic to your host
sudo echo "network.host: 0.0.0.0" >> /etc/elasticsearch/elasticsearch.yml

# Comment out the default path.data config
sudo sed -i '33 s/^/#/' /etc/elasticsearch/elasticsearch.yml

# Comment out the default security  xpack.security.enabled: true
sudo sed -i '98 s/^/#/' /etc/elasticsearch/elasticsearch.yml

# Set elastic data folder to our shared folder
sudo echo "path.data: /vagrant/elastic-stack" >> /etc/elasticsearch/elasticsearch.yml

sudo echo "xpack.security.enabled: false" >> /etc/elasticsearch/elasticsearch.yml

# execute the following statements to configure elasticsearch service to start automatically using systemd
sudo systemctl daemon-reload

# Add vagrant user to elasticsearch group
sudo adduser vagrant elasticsearch

# change owner of elastcisearch folder
sudo chown elasticsearch:elasticsearch /etc/elasticsearch
