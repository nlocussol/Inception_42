mkdir -p ${CERTS}
touch ${CERTS}default.crt ${CERTS}default.key
openssl req -x509 -nodes -days 365 \
    	-subj  "/C=FR/ST=PARIS/O=42/CN=nlocusso.42.fr" \
     	-newkey rsa:2048 -keyout ${CERTS}default.key \
     	-out ${CERTS}default.crt 2>/dev/null

sed -i "s|CERTS|${CERTS}|g" /etc/nginx/http.d/default.conf
sed -i "s|CERTS|${CERTS}|g" /etc/nginx/http.d/default.conf

exec nginx -g "daemon off;"
