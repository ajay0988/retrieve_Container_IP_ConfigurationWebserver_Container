FROM centos:latest
RUN yum install openssh-server -y
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''
RUN ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key -N ''
ADD sshd_config /etc/ssh/sshd_config 
RUN echo root:ajay | chpasswd
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
