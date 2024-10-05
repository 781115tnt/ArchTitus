#!/bin/bash

watch -n1 "cat /proc/cpuinfo | grep MHz | awk '{print $1}' && sensors -A coretemp-isa-0000"

