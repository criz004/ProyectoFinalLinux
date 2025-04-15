#!/bin/bash

echo "=== Memoria RAM ==="
awk '/MemTotal/ {print "Total RAM: " $2/1024 " MB"}' /proc/meminfo

echo -e "\n=== Architectura ==="
cat /proc/cpuinfo | grep flags | grep -q ' lm ' && echo "64-bit" || echo "32-bit"

echo -e "\n=== Versión del sistema ==="
cat /etc/os-release
