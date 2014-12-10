#!/bin/bash

set -e

MODULE="Elasticsearch"

function configure()
{
    ctx logger debug "Currently no configuration required"
}

ctx logger info "Configuring ${MODULE}"
configure
ctx logger info "Configuration Completed Successfully!"