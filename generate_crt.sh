#!/bin/bash

MY_IP=$(hostname -I | cut -f1 -d' ')

sudo openssl req -newkey rsa:4096 -nodes -sha256 -keyout /var/lib/aion/certs/domain.key -x509 -days 365 -out /var/lib/aion/certs/domain.crt -subj "/C=AU/ST=Some-State/O=Internet Widgits Pty Ltd/CN=${MY_IP}"

sleep 5

echo ""
echo ""
echo "set following file on client!"
echo "dir: /etc/docker/certs.d/${MY_IP}:31112"
echo "file: ca.crt"
echo "content:"
echo ""
cat /var/lib/aion/certs/domain.crt
echo ""
