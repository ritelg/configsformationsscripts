FROM kalilinux/kali-rolling:latest

RUN apt-get update --fix-missing -y
RUN apt-get install fish vim git -y
RUN git clone https://github.com/faizann24/XssPy /opt/XssPy
RUN apt-get install zaproxy wpscan wapiti sqlmap nmap wfuzz -y


RUN apt-get install metasploit-framework maltego owasp-mantra-ff burpsuite -y
# RUN apt-get install arachni vega grabber golismero -y
RUN apt-get install kali-tools-web -y

## Installation de w3af
# RUN git clone https://github.com/andresriancho/w3af.git 
# RUN cd w3af/ 
# RUN ./w3af_console
# RUN . /tmp/w3af_dependency_install.sh

RUN apt-get install kali-tools-top10 -y
RUN apt-get install kali-tools-vulnerability -y
RUN apt-get install kali-tools-database -y
## RUN apt-cache search kali-tools