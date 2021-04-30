# FROM node:12

FROM node:14-alpine

RUN mkdir -m 777 /.npm
RUN mkdir -m 777 /.yarn
RUN touch /.yarnrc && chmod 777 /.yarnrc


RUN apk add sudo fish
# RUN apt-get update
# RUN apt-get install -y fish sudo git zip fonts-liberation libappindicator3-1 xdg-utils mplayer
#
# RUN apt-get install --no-install-recommends -y \
#   libgtk2.0-0 \
#   libgtk-3-0 \
#   libnotify-dev \
#   libgconf-2-4 \
#   libnss3 \
#   libxss1 \
#   libasound2 \
#   libxtst6 \
#   xauth \
#   xvfb \
#   # install Chinese fonts
#   # this list was copied from https://github.com/jim3ma/docker-leanote
#   fonts-arphic-bkai00mp \
#   fonts-arphic-bsmi00lp \
#   fonts-arphic-gbsn00lp \
#   fonts-arphic-gkai00mp \
#   fonts-arphic-ukai \
#   fonts-arphic-uming \
#   ttf-wqy-zenhei \
#   ttf-wqy-microhei \
#   xfonts-wqy \
#   # clean up
#   && rm -rf /var/lib/apt/lists/*
#
# RUN npm install -g npm@latest
# RUN npm install -g yarn@latest --force
#
# ENV TERM xterm
# ENV npm_config_loglevel warn
# ENV npm_config_unsafe_perm true
#
# ########################## Cypress Browser https://github.com/cypress-io/cypress-docker-images/blob/master/browsers/node12.8.1-chrome80-ff72/Dockerfile
#
# # install Chrome browser
# ENV CHROME_VERSION 80.0.3987.87
# RUN wget -O /usr/src/google-chrome-stable_current_amd64.deb "http://dl.google.com/linux/chrome/deb/pool/main/g/google-chrome-stable/google-chrome-stable_${CHROME_VERSION}-1_amd64.deb" && \
#   dpkg -i /usr/src/google-chrome-stable_current_amd64.deb ; \
#   apt-get install -f -y && \
#   rm -f /usr/src/google-chrome-stable_current_amd64.deb
# RUN google-chrome --version
#
# # install Firefox browser
# ARG FIREFOX_VERSION=72.0.2
# RUN wget --no-verbose -O /tmp/firefox.tar.bz2 https://download-installer.cdn.mozilla.net/pub/firefox/releases/$FIREFOX_VERSION/linux-x86_64/en-US/firefox-$FIREFOX_VERSION.tar.bz2 \
#   && tar -C /opt -xjf /tmp/firefox.tar.bz2 \
#   && rm /tmp/firefox.tar.bz2 \
#   && ln -fs /opt/firefox/firefox /usr/bin/firefox
#
#
# ########################## Cypress Included https://github.com/cypress-io/cypress-docker-images/blob/master/included/4.1.0/Dockerfileswx
#
# # avoid too many progress messages
# # https://github.com/cypress-io/cypress/issues/1243
# ENV CI=1
#
# # disable shared memory X11 affecting Cypress v4 and Chrome
# # https://github.com/cypress-io/cypress-docker-images/issues/270
# ENV QT_X11_NO_MITSHM=1
# ENV _X11_NO_MITSHM=1
# ENV _MITSHM=0
#
# RUN echo "whoami: $(whoami)"
# RUN npm config -g set user $(whoami)
#
# RUN id
#
# ENV CYPRESS_CACHE_FOLDER=/root/.cache/Cypress
# RUN npm install -g "cypress@4.1.0"
# RUN cypress verify
#
# RUN cypress cache path
# RUN cypress cache list
# RUN cypress info
#
# RUN ls -la /root
# RUN chmod 755 /root
#
# RUN echo  " node version:    $(node -v) \n" \
#   "npm version:     $(npm -v) \n" \
#   "yarn version:    $(yarn -v) \n" \
#   "debian version:  $(cat /etc/debian_version) \n" \
#   "user:            $(whoami) \n" \
#   "chrome:          $(google-chrome --version || true) \n" \
#   "firefox:         $(firefox --version || true) \n"
