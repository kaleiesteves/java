#!/bin/sh
# scripts/build.sh
# Builds and runs a Docker image to compile and execute a Java program.
# This script should be run while (Java Docker) virtual environment is active.

# Check if valid argument was provided.
if [ -z "$1" ]; then
    echo "Error: No project folder was provided."
    echo "Usage: build <project-folder>"
    exit 1
elif [ ! -d "$1" ]; then
    echo "Error: '$1' is not a valid directory."
    exit 1
else
    PROJECT_FOLDER="$(realpath "$1")"   # Define path to local project
    PROJECT_NAME="$(basename "$1")"     # Extract the project name
fi

# Define the name of Docker container and Docker image to use.
TEMP_CONTAINER="java-docker-container"
TEMP_IMAGE="java-docker-image"

# Set up the Docker container with the built image.
echo "\nStarting a temporary container and building a Docker image..."
export DOCKER_BUILDKIT=1
docker build -t $TEMP_IMAGE .
docker run -d --name $TEMP_CONTAINER $TEMP_IMAGE sleep infinity # Keeps persistent

# Copy the project over to let the Docker image handle the build.
echo "Building project '$PROJECT_NAME' in Docker container..."
docker cp $PROJECT_FOLDER $TEMP_CONTAINER:/app/
docker exec $TEMP_CONTAINER sh -c "cd /app/$PROJECT_NAME && javac *.java"

# Run the project after the build to display its output.
echo "Running project '$PROJECT_NAME' inside the Docker container...\n"
echo "\n***********\n"
TEMP_IMAGE_ID="$(docker commit $TEMP_CONTAINER)" # Needs ID to run the program too.
docker run -it --rm $TEMP_IMAGE_ID java -cp /app/$PROJECT_NAME $PROJECT_NAME
echo "\n***********\n"
# Remove the temporary container and image when complete.
echo "\nStopping and removing the Docker container and temporary image...\n"
docker rm -f $TEMP_CONTAINER
docker rmi -f $TEMP_IMAGE_ID

echo "\nBuild complete!\n"
