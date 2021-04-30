FROM jenkins/jenkins:lts

USER root

RUN apt-get update -y
RUN apt-get install git sshpass wget ansible gnupg2 curl vim openssh-server openssh-client sudo fish -y

RUN curl -fsSL https://get.docker.com | sh
RUN usermod -aG docker jenkins
RUN curl -sL "https://github.com/docker/compose/releases/download/1.25.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose

# Perso VIM
RUN mkdir -p /root/.vim/autoload /root/.vim/bundle
RUN curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
COPY .vimrc /root/.vimrc
RUN git clone https://github.com/vim-airline/vim-airline.git /root/.vim/bundle/vim-airline
RUN git clone https://github.com/vim-syntastic/syntastic.git /root/.vim/bundle/syntastic
RUN git clone https://github.com/majutsushi/tagbar.git /root/.vim/bundle/tagbar
RUN git clone https://github.com/kien/ctrlp.vim.git /root/.vim/bundle/ctrlp/
RUN git clone https://github.com/Shougo/vimproc.vim.git /root/.vim/bundle/vimproc.vim

# Installation de SSH
RUN echo 'jenkins ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

RUN service ssh start

USER jenkins