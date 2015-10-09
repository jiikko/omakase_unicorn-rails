!/bin/sh
openssl genrsa -out server.key 2048
openssl req -new -key server.key -out server.csr -subj '/C=JP/ST=Tokyo/L=Tokyo/O=Example Ltd./OU=Web/CN=example.com'
openssl x509 -in server.csr -days 3650 -req -signkey server.key > server.crt
rm server.csr
sudo mkdir -p /etc/ssl/certs
sudo mkdir -p /etc/ssl/private
sudo mv server.crt /etc/ssl/certs/ssl-cert-snakeoil.pem;
sudo mv server.key /etc/ssl/private/ssl-cert-snakeoil.key;
