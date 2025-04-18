#!/bin/bash

echo "Cerrando la terminal, bye..."
sleep 5

trap '' SIGINT
trap '' SIGTSTP

kill -9 $$