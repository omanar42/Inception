#!/bin/bash

adduser ${FTP_USER} --disabled-password --gecos ""
echo "${FTP_USER}" | tee -a /etc/vsftpd.userlist
echo "${FTP_USER}:${FTP_PASS}" | chpasswd
mkdir -p /var/www/html
chown -R ${FTP_USER}:${FTP_USER} /var/www/html
vsftpd /etc/vsftpd.conf
