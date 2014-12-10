#!/bin/bash

set -e

ctx source instance runtime-properties elasticsearch_ip_address $(ctx target instance host-ip)