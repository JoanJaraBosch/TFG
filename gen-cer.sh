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
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx.key -subj "/C=$country/ST=$state/L=$locality/O=$organization/OU=$organizationalunit/CN=$commonname/emailAddress=$email" -out /etc/nginx/ssl/nginx.crt 

echo "---------------------------"
echo "-----Below is your CRT-----"
echo "---------------------------"
echo
cat /etc/nginx/ssl/nginx.crt

echo
echo "---------------------------"
echo "-----Below is your Key-----"
echo "---------------------------"
echo
cat /etc/nginx/ssl/nginx.key

openssl dhparam -dsaparam -out /etc/nginx/ssl/dhparam.pem 4096


chown odroid:odroid /etc/nginx/ssl/nginx.key
chown odroid:odroid /etc/nginx/ssl/nginx.crt
