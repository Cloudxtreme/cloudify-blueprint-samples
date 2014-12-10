#!/bin/bash

set -e

MODULE="Elasticsearch"
PKG="https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.4.0.deb"

function install_elasticsearch()
{
    ctx logger debug "Downloading ${MODULE} deb file from: $1"
    sudo wget $1 -O /opt/elasticsearch.deb &&
    sudo dpkg -i /opt/elasticsearch.deb &&
    sudo rm /opt/elasticsearch.deb &&
    ctx logger debug "Updating rc.d to run elasticsearch"
    sudo update-rc.d elasticsearch defaults 95 10
}

ctx logger debug "Updating Local Cache"
sudo apt-get update
ctx logger info "Installing ${MODULE}"
install PKG
ctx logger info "Installation Completed Successfully!"