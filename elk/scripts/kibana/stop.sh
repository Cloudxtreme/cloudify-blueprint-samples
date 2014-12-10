#!/bin/bash

set -e

MODULE="Kibana"

function stop()
{
    sudo stop kibana
}

ctx logger info "Stopping ${MODULE}"
stop
ctx logger info "Stopped Successfully!"