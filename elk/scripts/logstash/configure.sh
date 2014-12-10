#!/bin/bash

set -e

function configure()
{
    ctx download-resource resources/logstash_config.conf /opt/logstash/logstash.conf
    ELASTICSEARCH_IP_ADDRESS=$(ctx instance runtime-properties elasticsearch_ip_address)
    sudo sed -i s|HOST_PLACEHOLDER|${ELASTICSEARCH_IP_ADDRESS}|g /opt/logstash/logstash.conf
}

ctx logger info "Configuring Logstash"
configure
ctx logger info "Configuration Completed Successfully!"