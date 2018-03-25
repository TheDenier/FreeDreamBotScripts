#!/bin/bash

useradd user
passwd user

yum update && yum upgrade -y && yum groupinstall "GNOME Desktop" -y && yum install tigervnc-server -y

su - user -c "vncserver -localhost"
su - user -c "vncserver -kill :1"

cd ~
wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u161-b12/2f38c3b165be4555a1fa6e98c45e0808/jre-8u161-linux-x64.rpm"
yum localinstall jre-8u161-linux-x64.rpm
rm jre-8u161-linux-x64.rpm

alternatives --config java

echo "Done"
