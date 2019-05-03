#! /bin/bash
# @edt ASIX M06 2018-2019
# startup.sh
# -------------------------------------
/opt/docker/install.sh && echo "Tot instalat"
/usr/sbin/xinetd -dontfork && echo "Correu en marxa"
/opt/docker/sendmail.sh && echo "Mails enviats"

