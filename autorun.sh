#!/bin/bash

set -o nounset                              # Treat unset variables as an error

#sshfs

ping -c1 -W1 `grep -A1 "Host l" ~/.ssh/config|sed 1d|cut -d ' ' -f 2` &> /dev/null
if [ "$?" = "0" ]; then
sshfs -o transform_symlinks -o reconnect -o follow_symlinks -o uid=1000 -o gid=1000 -o umask=022 \
l:/home/`grep -A2 "Host l" ~/.ssh/config|sed 1,2d|cut -d ' ' -f 2` ~/service/gate
fi

ping -c1 -W1 `grep -A1 "Host a" ~/.ssh/config|sed 1d|cut -d ' ' -f 2` &> /dev/null
if [ "$?" = "0" ]; then
sshfs -o transform_symlinks -o reconnect -o follow_symlinks -o uid=1000 -o gid=1000 -o umask=022 \
a:/home/`grep -A2 "Host l" ~/.ssh/config|sed 1,2d|cut -d ' ' -f 2` ~/service/hpc
fi

ping -c1 -W1 `grep -A1 "Host p" ~/.ssh/config|sed 1d|cut -d ' ' -f 2` &> /dev/null
if [ "$?" = "0" ]; then
sshfs -o transform_symlinks -o reconnect -o follow_symlinks -o uid=1000 -o gid=1000 -o umask=022 \
p:/media/DTSE9 ~/MyDatabase
fi
