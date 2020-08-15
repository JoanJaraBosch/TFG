#!/bin/bash

#Required
domain=$1
commonname=$domain

#Change to your company details
mkdir -p /etc/nginx/ssl/

country=ES
state=Tarragona
locality=Reus
organization=URV
organizationalunit=URV
email=joan.jara@estudiants.urv.cat

#Optional
password=urvodroid

if [ -z "$domain" ]
then
    echo "Argument not present."
    echo "Useage $0 [common name]"

    exit 99
fi

echo "Generating key request for $domain"

openssl genrsa -des3 -passout pass:$password -out /etc/nginx/ssl/nginx..key 2048 -noout

#Remove passphrase from the key. Comment the line out to keep the passphrase
echo "Removing passphrase from key"
openssl rsa -in /etc/nginx/ssl/nginx..key -passin pass:$password -out /etc/nginx/ssl/nginx..key

#Create the request
echo "Creating CSR"
openssl req -new -key /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt -passin pass:$password \
    -subj "/C=$country/ST=$state/L=$locality/O=$organization/OU=$organizationalunit/CN=$commonname/emailAddress=$email"

echo "---------------------------"
echo "-----Below is your CSR-----"
echo "---------------------------"
echo
cat /etc/nginx/ssl/nginx.csr

echo
echo "---------------------------"
echo "-----Below is your Key-----"
echo "---------------------------"
echo
cat /etc/nginx/ssl/nginx.crt

openssl dhparam -out /etc/nginx/ssl/dhparam.pem 4096&

