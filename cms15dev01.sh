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

#for South Korea's timezone
sudo timedatectl set-timezone 'Europe/Rome'

sudo apt update
sudo apt -y upgrade
sudo apt -y autoremove

sudo apt -y install build-essential
sudo apt -y install openjdk-11-jdk-headless
sudo apt -y install fp-compiler
sudo apt -y install postgresql
sudo apt -y install postgresql-contrib
sudo apt -y install postgresql-client

#for python3.10
sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo apt -y update
sudo apt -y install python3.10
#for PyPy3
sudo add-apt-repository ppa:pypy/ppa -y
sudo apt -y update
sudo apt -y install pypy3

sudo apt -y install cppreference-doc-en-html
sudo apt -y install cgroup-lite
sudo apt -y install libcap-dev
sudo apt -y install zip

sudo apt -y install python3.10-dev
sudo apt -y install libpq-dev
sudo apt -y install libcups2-dev
sudo apt -y install libyaml-dev
sudo apt -y install libffi-dev
sudo apt -y install python3-pip

sudo apt -y install nginx-full
sudo apt -y install python2.7
sudo apt -y install php7.4-cli
sudo apt -y install php7.4-fpm
sudo apt -y install phppgadmin
sudo apt -y install texlive-latex-base
sudo apt -y install a2ps
#sudo apt -y install gcj-jdk
sudo apt -y install haskell-platform
sudo apt -y install rustc
sudo apt -y install mono-mcs

sudo apt -y install fp-units-base
sudo apt -y install fp-units-fcl
sudo apt -y install fp-units-misc
sudo apt -y install fp-units-math
sudo apt -y install fp-units-rtl

sudo apt install -y python3-setuptools
sudo apt install -y python3-tornado
sudo apt install -y python3-psycopg2
sudo apt install -y python3-crypto
sudo apt install -y python3-sqlalchemy
sudo apt install -y python3-psutil
sudo apt install -y python3-netifaces
sudo apt install -y python3-pycryptodome
sudo apt install -y python3-bs4
sudo apt install -y python3-coverage
sudo apt install -y python3-requests
sudo apt install -y python3-werkzeug
sudo apt install -y python3-gevent
sudo apt install -y python3-bcrypt
sudo apt install -y python3-chardet
sudo apt install -y patool
sudo apt install -y python3-babel
sudo apt install -y python3-xdg
sudo apt install -y python3-jinja2
sudo apt install -y python3-sphinx
sudo apt install -y python3-cups
sudo apt install -y python3-pypdf2


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
sudo reboot

