FROM jenkins/jenkins:lts

USER root

RUN apt-get update -y
RUN apt-get install git sshpass wget ansible gnupg2 curl vim openssh-server openssh-client sudo fish -y

RUN curl -fsSL https://get.docker.com | sh
RUN usermod -aG docker jenkins
RUN curl -sL "https://github.com/docker/compose/releases/download/1.25.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose

# Installation de SSH
RUN echo 'jenkins ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers


RUN apt-get update -qq >/dev/null
RUN apt-get install -qq -y git sshpass wget ansible gnupg2 curl >/dev/null


RUN sed -i 's/.*pipelining.*/pipelining = True/' /etc/ansible/ansible.cfg
RUN sed -i 's/.*allow_world_readable_tmpfiles.*/allow_world_readable_tmpfiles = True/' /etc/ansible/ansible.cfg

RUN curl -fsSL https://get.docker.com | sh
RUN usermod -aG docker jenkins
RUN curl -sL "https://github.com/docker/compose/releases/download/1.25.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose 

# RUN echo '{"insecure-registries" : ["172.20.0.3:5000"]}'>/etc/docker/daemon.json
# RUN docker run hello-world

RUN service ssh start