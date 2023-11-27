#!/bin/bash

# Loop through each configuration JSON file
for file in *.json; do
    # Extract the key from the JSON file
    key=$(jq -r '.key' "$file")

    # Replace the filename with the key
    mv "$file" "$key.json"

    # Replace the template value in config.yaml with the key
    sed -i '' -e "s|template: $file|template: $key.json|" config.yaml
done
