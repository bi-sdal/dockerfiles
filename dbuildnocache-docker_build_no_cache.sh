set -ex
# SET THE FOLLOWING VARIABLES
# docker hub username
USERNAME=sdal
# image name
IMAGE=${PWD##*/}
echo $IMAGE
docker build --no-cache --rm -t $USERNAME/$IMAGE:latest .
