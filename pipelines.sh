#!/bin/bash

if [ ! -f "solo_madrid.o5m" ]; then
    echo "PRUEBA"
    ./osmconvert spain-latest.osm -B=CiudadMadrid.poly.txt -o=solo_madrid.o5m
fi


# Pipeline 1
# SOLO RESULTADOS CON NOMBRE Y HORARIOS DE APERTURA
./osmconvert spain-latest.osm -B=CiudadMadrid.poly.txt -o=solo_madrid.o5m | ./osmfilter solo_madrid.o5m --ignore-dependencies --keep="amenity=bar or amenity=cafe or amenity=pub or amenity=restaurant amenity=fast_food and name=" | ./osmconvert - --all-to-nodes --csv="@id @lon @lat name opening_hours" --csv-separator=";" | grep .*$';'.*$';'.*$';'..*$';'. | ./populate_db_pipeline_1.sh

# SOLO RESULTADOS CON NOMBRE, HORARIO DE APERTURA PUEDE SER BLANCO ESTE ES EL QUE HAY QUE ENTREGAR
./osmconvert spain-latest.osm -B=CiudadMadrid.poly.txt -o=solo_madrid.o5m | ./osmfilter solo_madrid.o5m --ignore-dependencies --keep="amenity=bar =cafe =pub =restaurant =fast_food" | ./osmconvert - --all-to-nodes --csv="@id @lon @lat name opening_hours" --csv-separator=";" | grep ..*$';'..*$';'..*$';'..*$';'.* | ./populate_db_pipeline_1.sh

# Piepeline 2
./osmconvert spain-latest.osm -B=CiudadMadrid.poly.txt -o=solo_madrid.o5m | ./osmfilter solo_madrid.o5m --ignore-dependencies --keep="cuisine=japanese =mexican =regional and amenity=restaurant" | ./osmconvert - --all-to-nodes --csv="@id @lon @lat name website phone opening_hours " --csv-separator=';' | grep ..*$';'..*$';'..*$';'..*$';'..*$';'..*$';'.* | ./populate_db_pipeline_2.sh


