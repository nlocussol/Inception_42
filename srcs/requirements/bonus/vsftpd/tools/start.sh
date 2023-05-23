adduser --disabled-password ${FTP_USER}

echo ${FTP_USER}:${FTP_PASSWD} | chpasswd 

echo ${FTP_USER} >  /etc/vsftpd.userlist

exec vsftpd /etc/vsftpd.conf 
