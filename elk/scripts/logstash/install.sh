#!/bin/bash

set -e

MODULE="Logstash"
PKG="https://download.elasticsearch.org/logstash/logstash/logstash-1.4.2.tar.gz"

function install()
{
    # mkdir logstash &&
    sudo mkdir /opt/logstash &&
    ctx logger debug "Downloading ${MODULE} deb file from: $1"
    sudo wget $1 -O /opt/logstash.tar.gz &&
    sudo tar -xzvf /opt/logstash.tar.gz -C /opt/logstash --strip-components=1 &&
    sudo rm /opt/logstash.tar.gz

    echo 'description logstash' | sudo tee --append /etc/init/logstash.conf
    echo 'start on virtual-filesystems' | sudo tee --append /etc/init/logstash.conf
    echo 'stop on runlevel [016]' | sudo tee --append /etc/init/logstash.conf
    # echo 'kill timeout 60' | sudo tee --append /etc/init/logstash.conf
    echo 'respawn' | sudo tee --append /etc/init/logstash.conf
    echo 'respawn limit 5 30' | sudo tee --append /etc/init/logstash.conf
    echo 'limit nofile 65550 65550' | sudo tee --append /etc/init/logstash.conf
    echo 'expect fork' | sudo tee --append /etc/init/logstash.conf
    echo 'chdir /home/logstash' | sudo tee --append /etc/init/logstash.conf
    echo 'exec /opt/logstash/bin/logstash -f /opt/logstash/logstash.conf' | sudo tee --append /etc/init/logstash.conf

    # ctx download-resource resources/logstash_init.conf ~/logstash/logstash.conf
    # sudo mv ~/logstash/logstash.conf /etc/init/

    # INSTALLATION METHOD 2
    # sudo wget https://download.elasticsearch.org/logstash/logstash/packages/debian/logstash_1.4.2-1-2c0f5a1_all.deb -O /opt/logstash.deb
    # sudo dpkg -i /opt/logstash.deb
    # sudo wget https://download.elasticsearch.org/logstash/logstash/packages/debian/logstash-contrib_1.4.2-1-efd53ef_all.deb -O /opt/logstash_contrib.deb
    # sudo dpkg -i /opt/logstash_contrib.deb

    # sudo cp /vagrant/resources/logstash.conf .
}

function install_contrib_plugins()
{
    sudo /opt/logstash/bin/plugin install contrib
}

ctx logger debug "Updating Local Cache"
sudo apt-get update
ctx logger info "Installing ${MODULE}"
install PKG
install_contrib_plugins
ctx logger info "Installation Completed Successfully!"