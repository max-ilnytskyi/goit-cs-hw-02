#!/bin/bash

website_urls=(https://google.com https://facebook.com https://twitter.com)

log_file_name="website_status.log"
> "$log_file_name"

for website_url in "${website_urls[@]}"
do
    http_status=$(curl -o /dev/null -s -w "%{http_code}" -L "$website_url")

    if [ "$http_status" -eq 200 ]
    then
        echo "<$website_url> is UP" >> "$log_file_name"
    else
        echo "<$website_url> is DOWN" >> "$log_file_name"
    fi
done

echo "Result saved to $log_file_name"