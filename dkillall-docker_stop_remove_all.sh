echo "docker ps -a:"
echo ""
docker ps -a
echo ""
echo "stopping and removing above containers"
echo ""
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
echo ""
echo "docker ps -a:"
echo ""
docker ps -a
