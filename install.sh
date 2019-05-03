#! /bin/bash
# @edt ASIX M06 2018-2019
# instal.lacio
#  - crear usuaris locals
# -------------------------------------

useradd pere
echo "pere" | passwd --stdin pere
useradd marta
echo "marta" | passwd --stdin marta
cp /opt/docker/ipop3 /etc/xinetd.d/
cp /opt/docker/pop3s /etc/xinetd.d/

