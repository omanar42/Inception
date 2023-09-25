#!/bin/bash

mkdir -p /home/vsftpd
chown -R ftp:ftp /home/vsftpd
echo -e "${FTP_USER}\n${FTP_PASS}" > /etc/vsftpd.userlist

vsftpd /etc/vsftpd/vsftpd.conf
