FROM cypress/browsers:latest

RUN npm i cypress

RUN apt-get update
RUN apt-get install fish

RUN $(npm bin)/cypress install
