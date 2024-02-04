#!/bin/bash

# Copyright (C) 2024 Francesco Mancuso - www.francescomancuso.it
# È vietata la copia, la pubblicazione, la riproduzione e la redistribuzione dei contenuti in qualsiasi modo o forma.
# GIT - https://github.com/FrancescooM/olimpiadicms-bash
# Versione originale - https://github.com/melongist/CSL/tree/main/CMS

cd

if [[ $SUDO_USER ]] ; then
  echo "Utilizza solo 'bash cms15dev02.sh', senza SUDO"
  exit 1
fi

cd olimpiadicms

sudo pip3 install -r requirements.txt

wget https://raw.githubusercontent.com/FrancescooM/olimpiadicms-bash/main/db.txt

USERPW="o"
INPUTS="x"
while [ ${USERPW} != ${INPUTS} ]; do
  echo -n "Inserisci password postgresql per l'utente cmsuser : "
  read USERPW
  echo -n "Ripeti password : "
  read INPUTS
done

sudo sed -i "s#login password 'enternewpassword'#login password '$USERPW'#" ./db.txt
sudo su - postgres < db.txt
cd

sudo sed -i "s#your_password_here#$USERPW#" /usr/local/etc/cms.conf
sudo chown cmsuser:cmsuser /usr/local/etc/cms.conf


#for PyPy3
sudo sed -i "s#Python3CPython\",#Python3CPython\",\n            \"Python 3 / PyPy3=cms.grading.languages.python3_pypy3:Python3PyPy3\",#g" ~/cms/setup.py
sudo cp -f ~/cms/cms/grading/languages/python3_cpython.py ~/cms/cms/grading/languages/python3_pypy3.py
sudo sed -i "s#__all__ = \[\"Python3CPython\"\]#__all__ = \[\"Python3PyPy3\"\]#g" ~/cms/cms/grading/languages/python3_pypy3.py
sudo sed -i "s#class Python3CPython(CompiledLanguage):#class Python3PyPy3(CompiledLanguage):#g" ~/cms/cms/grading/languages/python3_pypy3.py
sudo sed -i "s#return \"Python 3 \/ CPython\"#return \"Python 3 \/ PyPy3\"#g" ~/cms/cms/grading/languages/python3_pypy3.py
sudo sed -i "s#commands.append(\[\"\/usr\/bin\/python3\"#commands.append(\[\"\/usr\/bin\/pypy3\"#g" ~/cms/cms/grading/languages/python3_pypy3.py
sudo sed -i "s#return \[\[\"\/usr\/bin\/python3\"#return \[\[\"\/usr\/bin\/pypy3\"#g" ~/cms/cms/grading/languages/python3_pypy3.py


cd
cd olimpiadicms
sudo python3 setup.py install
cd

cmsInitDB

cmsAddAdmin admin -p $USERPW

echo "Installazione del CMS completata!" | tee -a cms.txt
echo "Ultimo aggiornamento : 04/02/2024" | tee -a cms.txt
echo "Versione attuale : v2.2.0.beta" | tee -a cms.txt
echo "" | tee -a cms.txt
echo "" | tee -a cms.txt

#clear
echo ""
echo ""
cat cms.txt
