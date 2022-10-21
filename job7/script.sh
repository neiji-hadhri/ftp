#!/bin/bash
# fair la mis a jour 
sudo apt update
sudo apt upgrade 

# installe le proFTPd 
sudo apt install proftpd

#Ajout de l'utilisateur Merry
sudo useradd -m Merry
echo "Merry:kalimac" | sudo chpasswd 

#Ajout de l'utilisateur Pippin
sudo useradd -m Pippin
sudo echo "Pippin:secondbreakfast" | sudo chpasswd

#config proftpd 
sudo nano /etc/proftpd/proftpd.conf
echo "/home/djamel/Documents/PROJET-FTP/FTP/job7/proftpd.conf" >> /etc/proftpd/proftpd.conf

#redémarrer le serveur proftpd
sudo /etc/init.d/proftpd restart
systemctl restart proftpd.service

#installer le chiffrement SSL/TLS
sudo apt install openssl

#config tls
sudo nano /etc/proftpd/proftpd.conf
echo "/home/djamel/Documents/PROJET-FTP/FTP/job7/tls.conf" >> /etc/proftpd/tls.conf

#Generation des clefs de chiffrement tls "
sudo mkdir /etc/proftpd/ssl
sudo openssl req -new -x509 -keyout /etc/proftpd/ssl/proftpd.key.pem -days 365 -nodes -out /etc/proftpd/ssl/proftpd.cert.pem

#Redémarage du service tls"
sudo /etc/init.d/proftpd restart
systemctl restart proftpd.service

echo "Installation fini"
