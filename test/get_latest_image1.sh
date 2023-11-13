DOCKERHUB_USERNAME="$1"
IMAGE_NAME="$2"

# Query the Docker Hub API to get image information
api_response=$(curl -s "https://hub.docker.com/v2/repositories/${DOCKERHUB_USERNAME}/${IMAGE_NAME}/tags")


# Extract the latest version tag from the API response
latest_tag=$(echo "$api_response" | jq -r '.results | map(select(.name != "latest")) | max_by(.last_updated) | .name')

if [ -z "$latest_tag" ]; then
    echo "Failed to retrieve the latest image version tag."
    exit 1
else
    echo "Latest version tag: $latest_tag"
    echo "$latest_tag" >> tag_latest_output.txt
fi
