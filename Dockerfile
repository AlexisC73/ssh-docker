FROM ubuntu:22.04

RUN apt-get update && apt-get install -y openssh-server vim python3 python-is-python3 net-tools telnet
RUN mkdir /var/run/sshd

RUN echo 'root:pass' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
