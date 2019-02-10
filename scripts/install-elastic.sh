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


# Download elastic deb
echo "Downdloading https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.6.0.deb"

mkdir /vagrant/tmp &> /dev/null

cd /vagrant/tmp

curl https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.6.0.deb --output elasticsearch-6.6.0.deb --silent

echo "Finished downloading elasticsearch-6.6.0.deb"

# Install .deb file
echo "Install Elasticsearch"
sudo dpkg -i elasticsearch-6.6.0.deb
# Remove .deb file
rm elasticsearch-6.6.0.deb



