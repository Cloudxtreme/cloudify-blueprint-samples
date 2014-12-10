#!/bin/bash

set -e

MODULE="Kibana"
PKG="https://download.elasticsearch.org/kibana/kibana/kibana-4.0.0-BETA2.tar.gz"

function install()
{
    sudo mkdir /opt/kibana
    ctx logger debug "Downloading ${MODULE} deb file from: $1"
    sudo wget $1 -O /opt/kibana.tar.gz
    sudo tar -xzvf /opt/kibana.tar.gz -C /opt/kibana --strip-components=1

    # create kibana upstart file
    echo 'description kibana' | sudo tee --append /etc/init/kibana.conf
    echo 'start on runlevel [2345]' | sudo tee --append /etc/init/kibana.conf
    echo 'stop on runlevel [016]' | sudo tee --append /etc/init/kibana.conf
    echo 'kill timeout 60' | sudo tee --append /etc/init/kibana.conf
    echo 'respawn' | sudo tee --append /etc/init/kibana.conf
    echo 'respawn limit 10 5' | sudo tee --append /etc/init/kibana.conf
    echo 'exec /opt/kibana/bin/kibana' | sudo tee --append /etc/init/kibana.conf
    sudo rm /opt/kibana.tar.gz
}

ctx logger debug "Updating Local Cache"
sudo apt-get update
ctx logger info "Installing ${MODULE}"
install PKG
ctx logger info "Installation Completed Successfully!"