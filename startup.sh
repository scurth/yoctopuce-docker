#!/bin/bash
hubversion=29281

image_and_tag="virtualhub:$hubversion"

if [ -z $(docker images -q ${image_and_tag}) ]
then
  echo "${image_and_tag} does not exist, builing image..."
#  docker build --build-arg virtualhubversion=${hubversion} -t ${image_and_tag} Dockerfile
  docker build --build-arg virtualhubversion=${hubversion} -t ${image_and_tag} https://raw.githubusercontent.com/scurth/yoctopuce-docker/master/Dockerfile
fi

docker run --memory 16m -d -p 4444:4444 -ti --restart unless-stopped --privileged -v /dev/bus/usb:/dev/bus/usb ${image_and_tag} /usr/src/yocto/${virtualhub}/armhf/VirtualHub
