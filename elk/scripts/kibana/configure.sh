#!/bin/bash

set -e

MODULE="Elasticsearch"

function configure()
{
    ELASTICSEARCH_IP_ADDRESS=$(ctx instance runtime-properties elasticsearch_ip_address)
    sudo sed -i s|\"localhost:9200\"|\"${ELASTICSEARCH_IP_ADDRESS}:9200\"|g /opt/kibana/config/kibana.yml
}

ctx logger info "Configuring ${MODULE}"
configure
ctx logger info "Configuration Completed Successfully!"