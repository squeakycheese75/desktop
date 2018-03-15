echo 'Running consul primary'
docker run -d --name=dev-consul -e CONSUL_BIND_INTERFACE=eth0 consul
echo 'Joining 2nd node'
docker run -d -e CONSUL_BIND_INTERFACE=eth0 consul agent -dev -join=docker inspect --format='{{.NetworkSettings.Networks.bridge.IPAddress}}' dev-consul
echo 'Joining 3rd node'
docker run -d -e CONSUL_BIND_INTERFACE=eth0 consul agent -dev -join=docker inspect --format='{{.NetworkSettings.Networks.bridge.IPAddress}}' dev-consul

echo 'Get the IP of the primary'
docker inspect --format='{{.NetworkSettings.Networks.bridge.IPAddress}}' dev-consul
#docker inspect dev-cosul

echo 'Open in browser(i use chrome)'
dockerIp=$(docker inspect --format='{{.NetworkSettings.Networks.bridge.IPAddress}}' dev-consul)
echo $dockerIp
google-chrome http://"$dockerIp":8500
