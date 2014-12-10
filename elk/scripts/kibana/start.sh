#!/bin/bash

set -e

MODULE="Kibana"

function start()
{
    sudo start kibana
}

ctx logger info "Starting ${MODULE}"
start
ctx logger info "Started Successfully!"