#!/bin/bash
USERNAME="ramalaxmi"
PASSWORD="Tinku*1978"
docker login -u $USERNAME -p $PASSWORD

#taglist=`wget -q -O - "https://hub.docker.com/v2/repositories/ramalaxmi/myimage/tags?page_size=100"  | grep -o '"digest": *"[^"]*' | grep -o '[^"]*$'`
taglist=`wget -q -O - "https://hub.docker.com/v2/repositories/ramalaxmi/myimage/tags?page_size=100"  | grep -o '"name": *"[^"]*' | grep -o '[^"]*$'`
echo $taglist

latest_tag=$(echo "$taglist" | jq -r '.results[0].name')

# Output the latest tag
echo "Latest tag for $repository: $latest_tag"


