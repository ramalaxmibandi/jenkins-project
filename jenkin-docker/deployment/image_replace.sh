#!/bin/bash
# Run the shell script to get the image name and tag (e.g., "my-image:latest")
output_image_tag=$(./latest_image.sh)

# Define the path to your deployment.yaml file
deployment_yaml="deployment.yaml"

# Check if the deployment.yaml file exists
if [ -f "$deployment_yaml" ]; then
    # Use sed to replace the image value in the deployment.yaml file
    sed -i "s|image:.*|image: $output_image_tag|" "$deployment_yaml"
    echo "Replaced image value in $deployment_yaml with $output_image_tag."
else
    echo "Deployment YAML file $deployment_yaml not found."
fi
