#!/bin/bash

set -e

MODULE="Elasticsearch"

function start()
{
    sudo /etc/init.d/elasticsearch start
}

ctx logger info "Starting ${MODULE}"
start
ctx logger info "Started Successfully!"