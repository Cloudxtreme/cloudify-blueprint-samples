#!/bin/bash

set -e

MODULE="Logstash"

function stop()
{
    sudo stop logstash
}

ctx logger info "Stopping ${MODULE}"
stop
ctx logger info "Stopped Successfully!"