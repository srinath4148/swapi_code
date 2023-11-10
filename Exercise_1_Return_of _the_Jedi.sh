#!/bin/bash

# EX1: Find all ships that appeared in Return of the Jedi

#Getting response from API and store it in the variable "ex1_api_response"
ex1_api_response=$(curl -s "https://swapi.dev/api/films/3/")

# Extract the required details, stucture it and store it in the variable "starships_out"
starships_out=$(echo "$ex1_api_response" | grep -o '"starships":\[[^]]*' | awk -F '["[]' '{for(i=2;i<=NF;i++){print $i}}')

# Write the output into file. 
echo "$starships_out"  >> Exercise1_output.txt
