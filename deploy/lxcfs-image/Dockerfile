FROM centos:7
RUN yum install fuse-devel -y
STOPSIGNAL SIGINT
ADD start.sh /
ADD lxcfs /lxcfs
CMD ["/start.sh"]
