FROM ubuntu

RUN apt-get -y update
RUN apt-get install -y python3 git vim build-essential
RUN cd /root && git clone https://github.com/MatzeB/cifirm.git
RUN mkdir -p /root/workspace
RUN mkdir -p /root/artifacts
RUN cd /root/artifacts && git init --bare
RUN apt-get install -y python
RUN DEBIAN_FRONTEND=noninteractive apt-get install -yq chef
COPY cirun /bin/cirun

WORKDIR /root
CMD /bin/bash
