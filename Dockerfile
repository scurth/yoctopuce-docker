FROM ubuntu:latest
RUN apt update && apt upgrade && apt -y install wget unzip libusb-1.0-0

ARG virtualhubversion

RUN mkdir -p /usr/src/yocto

WORKDIR /usr/src/yocto/ 
RUN wget http://www.yoctopuce.com/EN/downloads/VirtualHub.linux.${virtualhubversion}.zip && \
	unzip -d /usr/src/yocto VirtualHub.linux.${virtualhubversion}.zip && \
	cp /usr/src/yocto/armhf/VirtualHub /usr/sbin/ && \
	cp /usr/src/yocto/startup_script/yVirtualHub /etc/init.d/
