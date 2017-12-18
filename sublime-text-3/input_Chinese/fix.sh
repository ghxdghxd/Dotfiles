#!/bin/bash
# @Date    : 2017-12-18 13:47:47
# @Author  : JTGuo
# @Email   : guojt-4451@163.com

sudo dnf install gtk2-devel.x86_64

gcc -shared -o libsublime-imfix.so sublime-imfix.c `pkg-config --libs --cflags gtk+-2.0` -fPIC

if [ -e '/opt/sublime_text/libsublime-imfix.so' ]
  then
  sudo rm /opt/sublime_text/libsublime-imfix.so
  sudo cp libsublime-imfix.so /opt/sublime_text/
else
  sudo cp libsublime-imfix.so /opt/sublime_text/
fi

if [ -e '/usr/bin/subl' ]
  then
  sudo rm /usr/bin/subl
fi
sudo cp subl /usr/bin/

for file in /usr/share/applications/sublime{-,_}text.desktop; do
  if [ -e $file ]
    then
    sudo rm $file && sudo cp sublime-text.desktop /usr/share/applications/
    sudo chmod 644 /usr/share/applications/sublime-text.desktop
    break
  fi
done
