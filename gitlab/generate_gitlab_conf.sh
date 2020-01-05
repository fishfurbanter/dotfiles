#!/bin/bash

cat <<EOF >&1
[global]
default = main
ssl_verify = true
timeout = 5
[main]
url = $1
private_token = $2
api_version = 4
EOF
