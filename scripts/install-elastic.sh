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

ELASTIC_DEB_URL="https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.6.0.deb"
ELASTIC_DEB_FILENAME="elasticsearch-6.6.0.deb"

# Download elastic deb
echo "Downdloading $ELASTIC_DEB_URL"

mkdir /vagrant/tmp &> /dev/null

cd /vagrant/tmp

curl $ELASTIC_DEB_URL --output $ELASTIC_DEB_FILENAME --silent

echo "Finished downloading $ELASTIC_DEB_FILENAME"

echo "Install Elasticsearch"

# Install .deb file
sudo dpkg -i $ELASTIC_DEB_FILENAME

# Remove .deb file
rm $ELASTIC_DEB_FILENAME

#sudo echo "network.host: 0.0.0.0" >> /etc/elasticsearch/elasticsearch.yml



