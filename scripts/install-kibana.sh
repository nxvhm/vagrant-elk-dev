#!/usr/bin/env bash
export DEBIAN_FRONTEND=noninteractive

cd /vagrant/tmp

KIBANA_DEB_URL="https://artifacts.elastic.co/downloads/kibana/kibana-6.6.0-amd64.deb"
KIBANA_DEB_FILENAME="kibana-6.6.0-amd64.deb"

echo "Downloading $KIBANA_DEB_URL"

curl $KIBANA_DEB_URL --output $KIBANA_DEB_FILENAME --silent

echo "Finished downloading $KIBANA_DEB_URL"

echo "Install $KIBANA_DEB_FILENAME"

sudo dpkg -i $KIBANA_DEB_FILENAME

echo "Remove downloaded package file $KIBANA_DEB_FILENAME"

rm $KIBANA_DEB_FILENAME
# Mount kibana on 0 to be available outside of the guest machine
sudo echo "server.host: 0.0.0.0" >> /etc/kibana/kibana.yml