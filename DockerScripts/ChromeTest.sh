dockerIp=$(docker inspect --format='{{.NetworkSettings.Networks.bridge.IPAddress}}' dev-consul)
echo $dockerIp
google-chrome http://"$dockerIp":8500
