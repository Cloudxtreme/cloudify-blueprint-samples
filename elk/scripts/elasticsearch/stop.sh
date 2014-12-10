#!/bin/bash

set -e

MODULE="Elasticsearch"

function stop()
{
    # ctx logger debug "Updating rc.d to disable elasticsearch"
    # update-rc.d elasticsearch disable
    sudo /etc/init.d/elasticsearch stop
}

ctx logger info "Stopping ${MODULE}"
stop
ctx logger info "Stopped Successfully!"