FROM cypress/browsers:latest

RUN npm i -g cypress

RUN apt-get update
RUN apt-get install fish -y

RUN cypress install --force
