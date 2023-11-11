#!/bin/bash
# Exercise 2: Find all ships that have a hyperdrive rating >= 1.0

# Purging Old Log file if any
> EX2_Output_starships_hyperdrive.txt

# Extracting the starships with "hyperdrive_rating" >= 1.0 from the starships API URL
starships_hr=$(curl -s "https://swapi.dev/api/starships/" | jq -c '.results[] | select(has("hyperdrive_rating") and (.hyperdrive_rating | tonumber? // 0) >= 1.0)')

echo "******* List of all the starships along with hyperdrive rating which is >=1.0 *********" >> EX2_Output_starships_hyperdrive.txt
# Loop through selected starships and display name along with Hyperdrive Rating
echo "$starships_hr" | while IFS= read -r star_ship; do
    starship_name=$(echo "$star_ship" | jq -r '.name')
    hypd_rating=$(echo "$star_ship" | jq -r '.hyperdrive_rating | tonumber? // 0')

    # Check if hyperdrive_rating is greater than or equal to 1.0
    if [ "$(echo "$hypd_rating >= 1.0" | bc)" -eq 1 ]; then
        echo "Name of the Starship: $starship_name, and Its Hyperdrive Rating is : $hypd_rating"  >> EX2_Output_starships_hyperdrive.txt
    fi
done
