FROM debian:9

ENV container docker
ENV LC_ALL C
ENV DEBIAN_FRONTEND noninteractive

RUN echo 'deb http://deb.debian.org/debian stretch-backports main' >> /etc/apt/sources.list

RUN apt-get update
RUN apt-get install -y --no-install-recommends systemd python sudo bash iproute net-tools openssh-server openssh-client vim bash zsh tmux curl
RUN apt-get install git fish -y
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PermitRootLogin/PermitRootLogin/' /etc/ssh/sshd_config
RUN rm -f /lib/systemd/system/multi-user.target.wants/* \
    /etc/systemd/system/*.wants/* \
    /lib/systemd/system/local-fs.target.wants/* \
    /lib/systemd/system/sockets.target.wants/*udev* \
    /lib/systemd/system/sockets.target.wants/*initctl* \
    /lib/systemd/system/sysinit.target.wants/systemd-tmpfiles-setup* \
    /lib/systemd/system/systemd-update-utmp*

RUN ln -s /lib/systemd/system /sbin/init
RUN systemctl set-default multi-user.target
RUN sed -i 's#root:\*#root:sa3tHJ3/KuYvI#' /etc/shadow
ENV init /lib/systemd/systemd
VOLUME [ "/sys/fs/cgroup" ]

# Perso VIM
 RUN mkdir -p /root/.vim/autoload /root/.vim/bundle
 RUN curl -LSso /root/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
 COPY .vimrc /root/.vimrc
 RUN git clone https://github.com/vim-airline/vim-airline.git /root/.vim/bundle/vim-airline
 RUN git clone https://github.com/vim-syntastic/syntastic.git /root/.vim/bundle/syntastic
 RUN git clone https://github.com/majutsushi/tagbar.git /root/.vim/bundle/tagbar
 RUN git clone https://github.com/kien/ctrlp.vim.git /root/.vim/bundle/ctrlp/
 RUN git clone https://github.com/Shougo/vimproc.vim.git /root/.vim/bundle/vimproc.vim

RUN service ssh start

ENTRYPOINT ["/lib/systemd/systemd"]

#docker run -tid --cap-add NET_ADMIN --cap-add SYS_ADMIN --publish-all=true -v /srv/data:/srv/html -v /sys/fs/cgroup:/sys/fs/cgroup:ro --name <nom_contneeur> -h <nom_conteneur> priximmo/debian_systemd:v1.0
