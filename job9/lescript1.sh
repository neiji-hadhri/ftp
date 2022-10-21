#!/bin/bash
#parcourir un fichier CSV et creez un ou plusieurs utilisateurs FTP sollant les éléments nécessaires

export IFS=","
cat /home/djamel/Documents/PROJET-FTP/FTP/job9/Shell_Userlist.csv | while read Id Prenom Nom Mdp Role
do
sudo useradd -m  $Prenom-$Nom
        echo "$Prenom-$Nom:$Mdp" | sudo chpasswd
        sudo usermod -u "$Id" "$Prenom-$Nom"
                if [ "$Role" = "Admin" ]
                then
                sudo usermod -aG sudo $Prenom-$Nom
                fi
done
