#!/bin/bash

set -e

MODULE="Logstash"

function start()
{
    sudo start logstash
}

ctx logger info "Starting ${MODULE}"
start
ctx logger info "Started Successfully!"