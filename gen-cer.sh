#!/bin/bash
#Author: Joan Jara Bosch
#Description: Script to generate the key and certificates (autosigned) to make the websocket connection and webapp more secure.
#Version: 1
#Date: 16/8/2020

#Required
domain=$1
commonname=$domain

#We create the directory where the key will be 
mkdir -p /etc/nginx/ssl/

#Parameters to generate the key
country=ES
state=Tarragona
locality=Reus
organization=URV
organizationalunit=URV
email=joan.jara@estudiants.urv.cat

#Optional
password=urvodroid

#If the domain don't exist, then we finish the script with an error
if [ -z "$domain" ]
then
    echo "Argument not present."
    echo "Useage $0 [common name]"

    exit 99
fi

#Generate the key and the crt
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

#Generate the pem
openssl dhparam -dsaparam -out /etc/nginx/ssl/dhparam.pem 4096

#Changing the owner and group
chown odroid:odroid /etc/nginx/ssl/nginx.key
chown odroid:odroid /etc/nginx/ssl/nginx.crt
