#!/bin/bash

set -e

function configure()
{
    ctx download-resource resources/logstash_config.conf '@{"target_path": "/opt/logstash/logstash.conf"}'
    # ctx download-resource resources/logstash_config.conf /opt/logstash/logstash.conf
    OUTPUT_ELASTICSEARCH_HOST_PLACEHOLDER=$(ctx instance runtime-properties elasticsearch_ip_address)
    LOGSTASH_INPUT_PORT_UDP=$(ctx instance properties udp_listener_port)
    sudo sed -i s|OUTPUT_ELASTICSEARCH_HOST_PLACEHOLDER|${OUTPUT_ELASTICSEARCH_HOST_PLACEHOLDER}|g /opt/logstash/logstash.conf
    sudo sed -i s|LOGSTASH_INPUT_PORT_UDP|${LOGSTASH_INPUT_PORT_UDP}|g /opt/logstash/logstash.conf
}

ctx logger info "Configuring Logstash"
configure
ctx logger info "Configuration Completed Successfully!"