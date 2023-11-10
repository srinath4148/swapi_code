#!/bin/bash


# EX3: Find all ships that have crews between 3 and 100

#Getting response from API and store it in the variable "ex3_api_response"
ex3_api_response=$(curl -s "https://swapi.dev/api/starships/")

# Extract information for starships with a crew size of 3 or more
crew_starships=$(echo "$ex3_api_response" | grep -o '{[^}]*}' | awk -F '[,}]' '{for(i=1;i<=NF;i++){if($i ~ /"crew":[ ]*"[3-9]|[1-9][0-9]"/) print "{" $i "}"}}')

# Write the output into file Exercise3_output.txt
echo "$crew_starships" >> Exercise3_output.txt