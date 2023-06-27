#!/bin/bash

#-------
date

#-------
distribut=$(lsb_release -i 2> /dev/null | awk '{print $3}')
version=$(lsb_release -r 2> /dev/null | awk '{print $2}')
echo "OS name: $distribut"
echo  "OS version: $version"

#-------
if cat /etc/apt/sources.list | grep "backport" ;
then
	echo "Already exists"
else
	echo "deb http://ru.archive.ubuntu.com/ubuntu ${version}-backports main restricted universe multiverse" |\
	sudo tee -a /etc/apt/sources.list
fi

#-------
sudo apt-get update -y

#-------
sudo apt-get install -y apache2
sudo systemctl enable apache2
sudo systemctl start apache2

#-------
sudo apt-get install -y python3

#-------
sudo apt-get install -y net-tools

#-------
sudo apt-get install -y ssh
sudo systemctl enable ssh
sudo systemctl start ssh

#-------
sudo apt-get install -y xrdp

#-------
bash ./script_pz1.2

#-------
user=as_user123
if grep $user /etc/passwd
then 
	echo "The user $user EXISTS"
else
	echo "The user $user does not exist..."
fi
