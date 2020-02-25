FROM jenkins/jenkins:lts

USER root

RUN apt-get update -y
RUN apt-get install git sshpass wget ansible gnupg2 curl vim zsh -y

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


# Installation de oh my zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
RUN git clone https://github.com/sindresorhus/pure.git /root/pure/
RUN mkdir -p ~/.oh-my-zsh/custom/
RUN mv /root/pure/async.zsh /root/.oh-my-zsh/custom/async.zsh
# RUN rm ~/.oh-my-zsh/themes/pure.zsh-theme
RUN mv /root/pure/pure.zsh /root/.oh-my-zsh/themes/pure.zsh-theme
RUN sed -i "s/robbyrussell/pure/g" /root/.zshrc
 
# Installation de tmux
RUN apt-get install tmux -y
RUN git clone https://github.com/samoshkin/tmux-config.git /root/tmux-config/
RUN chmod +x /root/tmux-config/install.sh
RUN /root/tmux-config/install.sh

USER jenkins
