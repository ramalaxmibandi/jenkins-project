DOCKERHUB_USERNAME="$ramalaxmi"
IMAGE_NAME="$myimage"

old_tag="image: ramalaxmi/myimage"
new_tag="image: ramalaxmi/myimage:"

# Query the Docker Hub API to get image information
api_response=$curl -s  "https://hub.docker.com/v2/repositories/ramalaxmi/myimage/tags"
DOCKERHUB_USERNAME="$1"


# Extract the latest version tag from the API response
latest_tag=$(echo "$api_response" | jq -r '.results | map(select(.name != "latest")) | max_by(.last_updated) | .name')

if [ -z "$latest_tag" ]; then
    echo "Failed to retrieve the latest image version tag."
    exit 1
else
    echo "Latest version tag: $latest_tag"
    echo "$latest_tag" 
fi


# Define the path to the deployment.yaml file
deployment_yaml="deployment.yaml"

# Check if the deployment.yaml file exists
if [ -f "$deployment_yaml" ]; then
    # Replace the image tag in the deployment.yaml file
    sed -i "s/image:/image: 16/g" "$deployment_yaml" 
    
    echo "Updated image tag in $deployment_yaml to $latest_tag."
else
    echo "Deployment YAML file $deployment_yaml not found."
fi
~        
