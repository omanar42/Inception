#!/bin/sh

if [ ! -f "/etc/vsftpd.conf.bak" ]; then

mkdir -p /var/www/html
mkdir -p /var/run/vsftpd/empty

cp /etc/vsftpd.conf /etc/vsftpd.conf.bak

adduser --disabled-password --gecos "" $FTP_USER
usermod -aG sudo $FTP_USER
echo "$FTP_USER:$FTP_PASS" | /usr/sbin/chpasswd &> /dev/null
chown -R $FTP_USER:$FTP_USER /var/www/html
echo $FTP_USER >> /etc/vsftpd.userlist

fi

/usr/sbin/vsftpd /etc/vsftpd.conf
