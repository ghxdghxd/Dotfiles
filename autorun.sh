#!/bin/bash

set -o nounset                              # Treat unset variables as an error

#sshfs

ping -c1 -W1 $ip1 &> /dev/null
if [ "$?" = "0" ]; then
sshfs -p $port -o transform_symlinks -o reconnect -o follow_symlinks -o uid=1000 -o gid=1000 -o umask=022 $user@$ip1:~ ~/service/gate
fi

ping -c1 -W1 $ip2 &> /dev/null
if [ "$?" = "0" ]; then
sshfs -o transform_symlinks -o reconnect -o follow_symlinks -o uid=1000 -o gid=1000 -o umask=022 $user@$ip1:~ ~/service/hpc
fi

ping -c1 -W1 192.168.11.1 &> /dev/null
if [ "$?" = "0" ]; then
sshfs -o transform_symlinks -o reconnect -o follow_symlinks -o uid=1000 -o gid=1000 -o umask=022 admin@192.168.11.1:/media/DTSE9 ~/MyDatabase/
sshfs -o transform_symlinks -o reconnect -o follow_symlinks -o uid=1000 -o gid=1000 -o umask=022 admin@192.168.11.1:/media/AiCard_02/Share ~/Share
fi
