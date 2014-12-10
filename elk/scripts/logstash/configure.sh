#!/bin/bash

set -e

function configure_logstash()
{
    ctx download-resource resources/logstash_config.conf ~/logstash/logstash.conf
    ELASTICSEARCH_IP=$(ctx target instance runtime_properties nodejs_binaries_path)
}

ctx logger info "Configuring Logstash"
configure_logstash
ctx logger info "Configuration Completed Successfully!"