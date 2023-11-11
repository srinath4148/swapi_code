#!/bin/bash

> EX3_Output_crew_info.txt
echo "******* All the starships that have Crews between 3 and 100 *********"  >> EX3_Output_crew_info.txt

# Extracting the all the starships details with Crew count
starships_crew=$(curl -s "https://swapi.dev/api/starships/" | jq -c '.results[] | select(has("crew"))')

# Looping through the output of the above command, fetching name and crew count and consider the count number with only numeric numbers. 
echo "$starships_crew" | while IFS= read -r star_ship; do
    starship_name=$(echo "$star_ship" | jq -r '.name')
    crew_count=$(echo "$star_ship" | jq -r '.crew | gsub("[^0-9]"; "")')
    
    # For each iteration, check if the crew count is betwen 3 and 100 and display them
    if [[ "$crew_count" =~ ^[0-9]+$ ]] && [ "$crew_count" -ge 3 ] && [ "$crew_count" -le 100 ]; then
        echo "Name of the Starship: '$starship_name' and it's  Crew Count is : '$crew_count'"  >> EX3_Output_crew_info.txt
    fi
done
