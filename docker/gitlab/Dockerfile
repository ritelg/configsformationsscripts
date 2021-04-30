FROM gitlab/gitlab-ce:latest

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install vim git wget curl fish locales -y

ENV LC_CTYPE=fr_FR.UTF-8
ENV LC_ALL=fr_FR.UTF-8
EXPOSE 80


## NE FONCTIONNE PAS