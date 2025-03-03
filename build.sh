#!/bin/sh
# code/build.sh
# This shell script runs a Docker image to build a java program.
# A new image is build based on Dockerfile and run in a temporary container.

# Check if both project folder and project name are provided.
if [ -z "$1" ]; then
    echo "Usage: build <project-folder>"
    exit 1
fi

PROJECT_FOLDER="$1"
CONTAINER="code-container"
IMAGE="code-image"

echo "Starting a temporary container and building a Docker image..."
docker build -t $IMAGE .
docker run -d --name $CONTAINER $IMAGE sleep infinity # Persistent
docker cp $PROJECT_FOLDER $CONTAINER:/app/

echo "Building project '$PROJECT_FOLDER' in Docker container..."
docker exec $CONTAINER sh -c "cd /app/$PROJECT_FOLDER && javac *.java"

echo "Creating temporary image ID to run the program with..."
NEW_IMAGE_ID=$(docker commit $CONTAINER)

echo "Running project '$PROJECT_FOLDER' inside the Docker container..."
docker run -it --rm $NEW_IMAGE_ID java -cp /app/$PROJECT_FOLDER

echo "Stopping and removing the Docker container and image..."
docker rm -f $CONTAINER
docker rmi -f $NEW_IMAGE_ID
