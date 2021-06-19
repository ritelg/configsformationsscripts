FROM debian:10

ENV container docker
ENV LC_ALL C
ENV DEBIAN_FRONTEND noninteractive

RUN echo 'deb http://deb.debian.org/debian stretch-backports main' >> /etc/apt/sources.list

RUN apt-get update -y
RUN apt-get install -y systemd python sudo bash net-tools openssh-server openssh-client vim bash fish curl git sshpass wget gnupg2

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

RUN rm -Rf /sbin/init
RUN ln -s /lib/systemd/system /sbin/init
RUN systemctl set-default multi-user.target
RUN sed -i 's#root:\*#root:sa3tHJ3/KuYvI#' /etc/shadow
ENV init /lib/systemd/systemd
VOLUME [ "/sys/fs/cgroup" ]

RUN echo 'user ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

ARG USER_ID
ARG GROUP_ID
RUN groupadd -f --gid $GROUP_ID user
RUN adduser --disabled-password --gecos '' --uid $USER_ID --gid $GROUP_ID user

RUN service ssh start

# ENTRYPOINT ["/lib/systemd/systemd"]

