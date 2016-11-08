FROM ubuntu

RUN apt-get -y update
RUN apt-get install -y python3 git vim build-essential
RUN cd /root && git clone https://github.com/MatzeB/cifirm.git
COPY cirun /bin/cirun

WORKDIR /root
CMD /bin/bash
