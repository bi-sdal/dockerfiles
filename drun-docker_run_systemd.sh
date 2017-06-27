set -ex
# SET THE FOLLOWING VARIABLES
# docker hub username
USERNAME=sdal
# image name
IMAGE=${PWD##*/}
echo $IMAGE
docker run -dit -v /sys/fs/cgroup:/sys/fs/cgroup:ro --cap-add=SYS_ADMIN $USERNAME/$IMAGE:latest .


