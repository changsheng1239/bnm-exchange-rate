#!/bin/bash

useragent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36"
header="Accept: application/vnd.BNM.API.v1+json"
url="https://api.bnm.gov.my/public/exchange-rate"

# Get the latest rate from bnm api
data=$(curl -s -H "$header" -A "$useragent" "$url")

session=$(echo "$data" | jq -r '.meta | .session')
last_updated=$(echo "$data" | jq -r '.meta | .last_updated')

# Extract date as folder path
path=$(date --date="$last_updated" "+%Y/%m/%d")/$session.json

mkdir -p $(dirname $path)
echo $data | jq -r '.data' >$path
