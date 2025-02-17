#!/bin/bash
cd /home/container

# Make internal Docker IP address available to processes.
export INTERNAL_IP=`ip route get 1 | awk '{print $NF;exit}'`

# Replace Startup Variables
MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
echo ":/home/container$ ${MODIFIED_STARTUP}"
dockerd --host=unix:///home/container/.docker/docker.sock --data-root /home/container/.docker/data --storage-driver=vfs

# Run the Server
eval ${MODIFIED_STARTUP}
