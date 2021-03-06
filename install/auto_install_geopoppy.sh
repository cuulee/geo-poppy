#!/bin/sh 
#set -e
# Commande d'installation
### curl -fsSL https://raw.githubusercontent.com/jancelin/geo-poppy/master/install/auto_install_geopoppy.sh | sh

wget --no-check-certificate -P /home/pirate https://raw.githubusercontent.com/jancelin/rpi_wifi_direct/master/raspberry_pi3/install_wifi_direct_rpi3.sh; chmod +x /home/pirate/install_wifi_direct_rpi3.sh; bash -x /home/pirate/install_wifi_direct_rpi3.sh &&
mkdir /home/pi &&
wget --no-check-certificate -P /home/pi https://github.com/jancelin/geo-poppy/raw/master/install/geopoppy_sig.tar &&
wget --no-check-certificate -P /home/pi https://github.com/jancelin/geo-poppy/raw/master/install/geopoppy_base.tar &&
tar xvfz /home/pi/geopoppy_sig.tar -p --same-owner -C /  &&
tar xvfz /home/pi/geopoppy_base.tar -p --same-owner -C /  &&
mkdir /home/GeoPoppy/pgadmin4 && mkdir /home/GeoPoppy/pgadmin4/pgadmin_data &&
chown -R 1000:50 -R /home/GeoPoppy/pgadmin4 &&
wget --no-check-certificate -P /home/pirate/ https://raw.githubusercontent.com/jancelin/geo-poppy/master/docker-compose.yml &&
docker-compose up -d &&
sleep 300
echo " "
echo "* Redémarrer le raspberry pour l'activation du wifi : sudo reboot"
echo " "
echo "* Connectez-vous ensuite au réseau wifi GeoPoppy_Pi3"
echo "Mot de passe: geopoppy"
echo "Puis tapper l'adresse https://172.24.1.1 dans votre navigateur web pour accéder à la démo"
echo " "
echo "* Connection Data Base avec PgAdminIII ou Qgis 172.24.1.1:5432, login et mot de passe: docker"
echo "* Connection Data Base avec PgAdmin4 interne: activer le container dans 172.24.1.1:9000 et acceder à pgadmin4 172.24.1.1:5050"
echo "* Construire ses projets Qgis dans le répertoire /home/GeoPoppy/lizmap/project pour les rendre accessibles"
echo " "
echo " en wifi direct: "
echo " 172.24.1.1                       >> lizmap / qgiserver "
echo " 172.24.1.1:5432                  >> postgresql "
echo " http://black-pearl.local:9000    >> portainerio : renseigner un mot de passe a la premiere connection"
echo " http://black-pearl.local:5050    >> PgAdmin4: connect to postgres: 172.24.1.1 port: 5432 db: postgres user: docker psw: docker "
echo " "
echo "Julien ANCELIN "
echo "https://github.com/jancelin/geo-poppy"

###_____________________________________________________________________________
 ## Commande de sauvegarde du dossier data
## tar zcvf /home/pi/geopoppy.tar /home/GeoPoppy

### Commande de restauration du dossier data
## tar xvfz /home/pi/geopoppy.tar ---no-check-certificate -p --same-owner -C /
#___________________________________________________________________
