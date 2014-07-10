#!/bin/bash

#sudo apt-get update
#clear

echo "Este es le instalador de Visual Search"
echo
echo "Instalamos CURL"
echo
# Instalamos curl que sera necesario para instalar ciertos componentes
sudo apt-get install curl
clear

# El siguiente codigo que esta comentado era para usar rvm 
#pero da ciertos problemas con algunas distribuciones de linux

#echo
#echo "Intalamos RVM"
#echo
#\curl -sSL https://get.rvm.io | bash
#source ~/.rvm/scripts/rvm
#clear

#echo
#echo "Intalamos Ruby"
#echo
#rvm get stable
#rvm install 2.0.0
#rvm reload
#rvm use 2.0.0
#ruby -v
#clear

echo
echo "Intalamos Ruby"
echo
# Instalamos ruby 2.0.0
sudo apt-get install ruby2.0 ruby2.0-dev build-essential libssl-dev zlib1g-dev ruby-switch
sudo ruby-switch --set ruby2.0
ruby -v
clear

echo
echo "Intalamos MongoDB"
echo
# Descargamos e instalamos MongoDB
curl -O http://downloads.mongodb.org/linux/mongodb-linux-x86_64-2.6.2.tgz
tar -zxvf mongodb-linux-x86_64-2.6.2.tgz
mkdir -p mongodb
cp -R -n mongodb-linux-x86_64-2.6.2/ mongodb
rm -rf mongodb-linux-x86_64-2.6.2
rm -rf mongodb-linux-x86_64-2.6.2.tgz
export PATH=~/mongodb/mongodb-linux-x86_64-2.6.2/bin:$PATH

# Creamos carpeta con permisos donde iran las DBs
sudo mkdir -p /data/db
sudo chmod 774 /data
sudo chmod 774 /data/db

# Arrancamos por primeravez mongoDB que insertara una serie de parametros y DBs necesarias
cd ~/
sudo ./mongodb/mongodb-linux-x86_64-2.6.2/bin/mongod --fork --logpath /var/log/mongodb.log

# Paramos MongoDB para seguir con la instalacion
sudo ./mongodb/mongodb-linux-x86_64-2.6.2/bin/mongod --shutdown
clear

echo
echo "Intalamos Graphviz"
echo
# Instalacion de la libreria que usamos para dibujar los arboles
sudo apt-get install graphviz
clear

echo
echo "Intalamos Git"
echo
# Instalamos ruby 2.0.0
sudo apt-get install git
clear

echo
echo "Descargar codigo fuente de AStar"
echo
# Ponemos el codigo fuente en la carpeta del usuario
cd ~/
git clone https://github.com/rodrimmbdev/a_star.git

# Instalamos la gema Bundle que nos ayuda a gestionar las gemas
sudo gem install bundler

# Instalamos las gemas necesarias
cd ~/a_star
bundle
