FROM ubuntu:18.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y python3-notebook
RUN apt-get update && apt-get install -y sudo bsdmainutils python3-pip
ADD requirements.txt /tmp
RUN pip3 install -r /tmp/requirements.txt
EXPOSE 8888 8888
ADD . /tmp
ENV SHELL=/bin/bash
CMD cd /tmp && python3 -m notebook --ip=0.0.0.0 --port=8888 --allow-root
