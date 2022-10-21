#!/bin/bash

rm /etc/proftpd/ssl/proftpd.cert.pem 
rm /etc/proftpd/ssl/proftp.key.pem
sudo apt --purge remove proftpd-*

#supprimer les utilisateur

sudo userdel -r Merry && sudo userdel -r Pippin
