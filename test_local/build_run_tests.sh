#!/bin/bash
script_dir="$(cd "$(dirname "$(readlink -f "$0")")" && pwd)"
cd $script_dir/..
# remove old containers
echo "Delete old Docker containers"
docker ps -a | grep test/interproscan_sdk:latest | awk '{print $1}' | xargs docker rm -v
# store old image id (we would like to remove it after rebuilding new one)
echo ""
echo "Build Docker image"
docker build --rm -t test/interproscan_sdk:latest .
echo ""
echo "Delete old Docker images"
docker images -q --filter "dangling=true" | xargs docker rmi
echo ""
docker run -v $script_dir/workdir:/kb/module/work test/interproscan_sdk:latest test
