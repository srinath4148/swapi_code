
#!/bin/bash


# EX2:  Find all ships that have a hyperdrive rating >= 1.0

#Getting response from API and store it in the variable "ex2_api_response"
ex2_api_response=$(curl -s "https://swapi.dev/api/starships/")

# Extract the required details, stucture it and store it in the variable "hyperdrive_starships"
hyperdrive_starships=$(echo "$ex2_api_response" | grep -o '{[^}]*}' | grep -E '"hyperdrive_rating":[ ]*"([1-9][.][0-9]+|[1-9])"')

# Write the output into file Exercise2_output.txt
echo "$hyperdrive_starships"   >> Exercise2_output.txt