#!/bin/bash

# Copyright (C) 2024 Francesco Mancuso - www.francescomancuso.it
# È vietata la copia, la pubblicazione, la riproduzione e la redistribuzione dei contenuti in qualsiasi modo o forma.
# GIT - https://github.com/FrancescooM/olimpiadicms-bash
# Versione originale - https://github.com/melongist/CSL/tree/main/CMS

if [[ $SUDO_USER ]] ; then
  echo "Utilizza solo 'bash cms15dev01.sh', senza SUDO"
  exit 1
fi

cd

sudo timedatectl set-timezone 'Europe/Rome'

sudo apt update
sudo apt -y upgrade
sudo apt -y autoremove

sudo aptitude -y install build-essential
sudo aptitude -y install openjdk-11-jdk-headless
sudo aptitude -y install fp-compiler
sudo aptitude -y install postgresql
sudo aptitude -y install postgresql-contrib
sudo aptitude -y install postgresql-client

#for python3.10
sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo apt -y update
sudo aptitude -y install python3.10
#for PyPy3
sudo add-apt-repository ppa:pypy/ppa -y
sudo apt -y update
sudo aptitude -y install pypy3

sudo aptitude -y install cppreference-doc-en-html
sudo aptitude -y install cgroup-lite
sudo apt -y install libcap-dev
sudo aptitude -y install zip

sudo aptitude -y install python3.10-dev
sudo aptitude -y install libpq-dev
sudo aptitude -y install libcups2-dev
sudo aptitude -y install libyaml-dev
sudo aptitude -y install libffi-dev
sudo aptitude -y install python3-pip

sudo aptitude -y install nginx-full
sudo aptitude -y install python2.7
sudo aptitude -y install php7.4-cli
sudo aptitude -y install php7.4-fpm
sudo aptitude -y install phppgadmin
sudo aptitude -y install texlive-latex-base
sudo aptitude -y install a2ps
#sudo apt -y install gcj-jdk
sudo aptitude -y install haskell-platform
sudo aptitude -y install rustc
sudo aptitude -y install mono-mcs

sudo aptitude -y install fp-units-base
sudo aptitude -y install fp-units-fcl
sudo aptitude -y install fp-units-misc
sudo aptitude -y install fp-units-math
sudo aptitude -y install fp-units-rtl

sudo aptitude install -y python3-setuptools
sudo aptitude install -y python3-tornado
sudo aptitude install -y python3-psycopg2
sudo aptitude install -y python3-crypto
sudo aptitude install -y python3-sqlalchemy
sudo aptitude install -y python3-psutil
sudo aptitude install -y python3-netifaces
sudo aptitude install -y python3-pycryptodome
sudo aptitude install -y python3-bs4
sudo aptitude install -y python3-coverage
sudo aptitude install -y python3-requests
sudo aptitude install -y python3-werkzeug
sudo aptitude install -y python3-gevent
sudo aptitude install -y python3-bcrypt
sudo aptitude install -y python3-chardet
sudo aptitude install -y patool
sudo aptitude install -y python3-babel
sudo aptitude install -y python3-xdg
sudo aptitude install -y python3-jinja2
sudo aptitude install -y python3-sphinx
sudo aptitude install -y python3-cups
sudo aptitude install -y python3-pypdf2
sudo aptitude -y install libcap2
sudo aptitude -n install libcap-dev
sudo aptitude -y install libcap-dev

cd ~/
cd olimpiadicms-bash
cd olimpiadicms
#select 'Y' at the end...  
sudo python3 prerequisites.py install

cd

echo ""
echo "Installazione dei prerequisiti completata!" | tee -a cms.txt
echo "Riavvio del sistema richiesto" | tee -a cms.txt
echo ""
echo "Riavvio in 10 secondi..."
echo ""
COUNT=10
while [ $COUNT -ge 0 ]
do
  echo $COUNT
  ((COUNT--))
  sleep 1
done
echo "Riavvio..."
sleep 5
#sudo reboot

