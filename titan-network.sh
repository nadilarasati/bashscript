#!/bin/bash
docker pull nezha123/titan-edge

mkdir -p ~/.titanedge

docker run --network=host -d -v ~/.titanedge:/root/.titanedge nezha123/titan-edge

read -p "Submit identity code: " identity_code

docker run --rm -it -v ~/.titanedge:/root/.titanedge nezha123/titan-edge bind --hash="$identity_code" https://api-test1.container1.titannet.io/api/v2/device/binding

sleep 10

image_name="nezha123/titan-edge"

container_id=$(docker ps --filter ancestor=$image_name --format "{{.ID}}" | head -n 1)

# Cek apakah container ditemukan
if [ -z "$container_id" ]; then
  echo "not found container run fromimage: $image_name"
  exit 1
fi

docker logs -f $container_id
