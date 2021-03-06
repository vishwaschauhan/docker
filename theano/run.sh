#!/bin/bash

IMAGE=theanogru-gpu

if [ "$1" == "train" ]; then
    CMD=./train.sh
elif [ "$1" == "process" ]; then
    CMD=./process.sh
else
    CMD=bash
fi

# execute docker run with nvidia driver and device
docker run -it --device=/dev/nvidiactl --device=/dev/nvidia-uvm --device=/dev/nvidia0 --volume-driver nvidia-docker -v nvidia_driver_367.57:/usr/local/nvidia:ro $IMAGE $CMD
