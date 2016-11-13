FROM ubuntu

RUN apt-get -y update
RUN apt-get install -y git
RUN cd /root && git clone https://github.com/MatzeB/cifirm.git

# Note that we split this into multiple stages so docker can snapshot the
# intermediate results (for faster turnaround in case of errors)
RUN DEBIAN_FRONTEND=noninteractive apt-get install -yq chef
RUN cd /root/cifirm/chef && chef-client -z -r apt
RUN cd /root/cifirm/chef && chef-client -z -r comfort
RUN cd /root/cifirm/chef && chef-client -z -r deps_firm

RUN mkdir -p /root/workspace
RUN mkdir -p /root/artifacts
RUN cd /root/artifacts && git init --bare
COPY cirun /bin/cirun

WORKDIR /root
CMD /bin/bash
