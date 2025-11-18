FROM ubuntu:22.04

RUN apt-get update && apt-get install -y openssh-server sudo

RUN useradd -m ansible && echo "ansible:ansible" | chpasswd

RUN echo "ansible ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

RUN mkdir /var/run/sshd

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
