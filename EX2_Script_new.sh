#!/bin/bash
# Exercise 2: Find all ships that have a hyperdrive rating >= 1.0

# Purging Old Log file if any
> EX2_Output_starships_hyperdrive.txt
set -e
# Extracting the starships with "hyperdrive_rating" >= 1.0 from the starships API URL
starships_hr=$(curl -s "https://swapi.dev/api/starships/" | jq -c '.results[] | select(.hyperdrive_rating >= 1.0)')

echo "******* List of all the starships along with hyperdrive rating which is >=1.0 *********" >> EX2_Output_starships_hyperdrive.txt
# Looping through all the starships along with hyperdrive rating which is >=1.0
echo "$starships_hr" | while IFS= read -r star_ship; do
    star_ship_name=$(echo "$star_ship" | jq -r '.name')
    hypd_rating=$(echo "$star_ship" | jq -r '.hyperdrive_rating')
    echo "Name of the Starship: $star_ship_name, and Its Hyperdrive Rating is : $hypd_rating"   >> EX2_Output_starships_hyperdrive.txt
done
