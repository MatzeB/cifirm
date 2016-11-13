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
RUN cd /root/cifirm/chef && chef-client -z -r deps_firmdocu
RUN cd /root/cifirm/chef && chef-client -z -r deps_firmtutorial
RUN cd /root/cifirm/chef && chef-client -z -r deps_testsuite_optional
RUN cd /root/cifirm/chef && chef-client -z -r deps_coverage
RUN cd /root/cifirm/chef && chef-client -z -r mips_toolchain
RUN cd /root/cifirm/chef && chef-client -z -r arm_toolchain
RUN cd /root/cifirm/chef && chef-client -z -r sparc_leon_toolchain

WORKDIR /root
CMD /bin/bash
