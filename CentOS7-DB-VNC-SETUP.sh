#!/bin/bash
yum update && yum upgrade -y
yum groupinstall "GNOME Desktop" -y
yum install tigervnc-server -y
useradd user
passwd user
su - user -c "vncserver -kill :1"
cp /lib/systemd/system/vncserver@.service /etc/systemd/system/vncserver@:1.service
nano /etc/systemd/system/vncserver@:1.service
systemctl daemon-reload
systemctl enable vncserver@:1.service
systemctl start vncserver@:1.service
cd ~
wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u161-b12/2f38c3b165be4555a1fa6e98c45e0808/jre-8u161-linux-x64.rpm"
yum localinstall jre-8u161-linux-x64.rpm
rm jre-8u161-linux-x64.rpm
