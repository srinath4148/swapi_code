#!/bin/bash
# Exercise 1: Find all ships that appeared in Return of the Jedi

# Purging the old output file
> EX1_Output_starships_return_of_jd.txt
echo "******* List of API URLs of all the starships of the film 'Return of the Jedi' *********"  >> EX1_Output_starships_return_of_jd.txt
curl -s "https://swapi.dev/api/films/3/" | jq -r '.starships[]' >> EX1_Output_starships_return_of_jd.txt
# Fetch starship URLs from film ID 3 using SWAPI
starship_urls_list=$(curl -s "https://swapi.dev/api/films/3/" | jq -r '.starships[]')

# Looping through the list of all starship URLs and Extractng the IDs from each URL
ship_ids=()
for url in $starship_urls_list; do
    ship_id=$(echo "$url" | awk -F'/' '{print $(NF-1)}')
    if [[ $ship_id =~ ^[0-9]+$ ]]; then
        ship_ids+=("$ship_id")
    fi
done

echo " ">> EX1_Output_starships_return_of_jd.txt
echo "******* Name of the starships that are appeard in 'Return of the Jedi' *********"   >> EX1_Output_starships_return_of_jd.txt
# Loop through each starship ID and redirect the output to a file
for ship_id in "${ship_ids[@]}"; do

    api_url="https://swapi.dev/api/starships/$ship_id/"
    response=$(curl -s "$api_url")
    starship_name=$(echo "$response" | jq -r '.name')

    # Display the starship ID, and name, and redirect to the specified file
    echo "Name of the Starship ID $ship_id is : '$starship_name'" >> EX1_Output_starships_return_of_jd.txt
done
