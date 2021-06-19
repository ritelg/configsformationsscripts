FROM jenkins/jenkins:lts

USER root

RUN apt-get update -y
RUN apt-get install git sshpass wget ansible gnupg2 curl vim openssh-server openssh-client sudo fish acl make -y


# Installation de SSH
RUN echo 'jenkins ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers


RUN sed -i 's/.*pipelining.*/pipelining = True/' /etc/ansible/ansible.cfg
RUN sed -i 's/.*allow_world_readable_tmpfiles.*/allow_world_readable_tmpfiles = True/' /etc/ansible/ansible.cfg

RUN curl -fsSL https://get.docker.com | sh
RUN usermod -aG docker jenkins

RUN curl -sL "https://github.com/docker/compose/releases/download/1.25.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose 

RUN service ssh start

ARG USER_ID
ARG GROUP_ID

RUN groupadd -f --gid $GROUP_ID jenkins
RUN usermod --uid $USER_ID --gid $GROUP_ID jenkins


RUN mkdir -p /etc/docker
RUN touch /etc/docker/daemon.json
RUN echo '{"insecure-registries" : ["172.20.0.3:5000"]}' >/etc/docker/daemon.json


VOLUME /var/run/
VOLUME /home/jenkins

RUN setfacl -m d:u:jenkins:rw /var/run/
RUN setfacl -m d:u:jenkins:rw /home/jenkins

USER jenkins
