#!/bin/bash
script_dir="$(cd "$(dirname "$(readlink -f "$0")")" && pwd)"
docker run -i -t -v $script_dir/workdir:/kb/module/work test/interproscan_sdk:latest bash
