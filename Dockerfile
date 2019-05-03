# Version: 0.0.1
# @edt M06 2018-2019
# kserver
# -------------------------------------
FROM fedora:27
LABEL author="@edt Raul Baena Nocea ASIX M11-ASO"
LABEL description="Dockerfile Servidor POPete"
RUN dnf -y install uw-imap procps vim tree passwd nmap telnet
RUN mkdir /opt/docker
COPY * /opt/docker/
RUN chmod +x /opt/docker/install.sh /opt/docker/startup.sh
WORKDIR /opt/docker
CMD ["/opt/docker/startup.sh"]
