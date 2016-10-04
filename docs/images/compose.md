version: '2'

services:
  lizmap:
    image: jancelin/geopoppy:qgis-lizmap
    restart: always
    ports:
     - "80:80"
    volumes:
     - "/home/GeoPoppy/lizmap/project:/home"
     - "/home/GeoPoppy/lizmap/project/var:/var/www/websig/lizmap/var"
     - "/home/GeoPoppy/lizmap/project/tmp:/tmp"


  postgis:
    image: jancelin/geopoppy:postgis
    restart: always
    ports:
     - "5432:5432"
    volumes:
     - "/home/GeoPoppy/postgres_data:/var/lib/postgresql"