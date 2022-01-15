FROM fedora:35

LABEL maintainer="Gaëtan Ritel"
ENV container docker
ENV LC_ALL C

# Enable systemd.
RUN dnf -y install systemd vim fish python sudo bash iproute net-tools openssh-server openssh-clients openssh 
RUN dnf clean all

RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PermitRootLogin/PermitRootLogin/' /etc/ssh/sshd_config
RUN rm -f /lib/systemd/system/multi-user.target.wants/* \
    /etc/systemd/system/*.wants/* \
    /lib/systemd/system/local-fs.target.wants/* \
    /lib/systemd/system/sockets.target.wants/*udev* \
    /lib/systemd/system/sockets.target.wants/*initctl* \
    /lib/systemd/system/sysinit.target.wants/systemd-tmpfiles-setup* \
    /lib/systemd/system/systemd-update-utmp*

# RUN rm /sbin/init
# RUN ln -s /lib/systemd/system /sbin/init
RUN systemctl set-default multi-user.target

RUN sed -i 's#root:\*#root:sa3tHJ3/KuYvI#' /etc/shadow
ENV init /lib/systemd/systemd
VOLUME [ "/sys/fs/cgroup" ]

# ENTRYPOINT ["/lib/systemd/systemd"]
ENTRYPOINT ["/sbin/init"]

