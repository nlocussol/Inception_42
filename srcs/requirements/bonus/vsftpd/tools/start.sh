adduser --disabled-password ${FTP_USER}
echo ${FTP_USER}:${FTP_PASSWD} | chpasswd 

usermod --home /volumes/ ${FTP_USER} 
chown ${FTP_USER}:${FTP_USER} /volumes/

echo ${FTP_USER} > /etc/vsftpd.userlist

exec vsftpd /etc/vsftpd.conf 
