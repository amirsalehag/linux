#!/bin/bash

logfile=~/test.log

exec > "$logfile"  2>&1

container_name=$(sudo docker ps --format '{{.Names}}')

for names in $container_name
do
  container_volume=$(sudo docker inspect "$names" -f '{{ json .HostConfig.Binds }}')
  echo -e "$names" = Volumes: "$container_volume\n"
done


###########   this script orders the docker containers and its volumes   ##############
