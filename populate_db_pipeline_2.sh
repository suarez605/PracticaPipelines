#!/bin/bash

echo "Poblando Segundo Pipeline"
mysql --local-infile=1 -u root < ./createdb_pipeline_2.sql

while IFS='$\n' read -r line; do
    # mysql --local-infile=1 -u root all_bar_db -e
    # Escapamos los ' para no tener problemas
    scape=${line//"'"/"\'"}
    # reemplazamos los ; para formar bien la query
    replace="', '"
    # TESTING PURPOSES
    # echo "INSERT INTO bars (id,lon,lat,name,opening_hours) VALUES ('${scape//\;/$replace}');"
    mysql --local-infile=1 -u root filtered_bar_db -e "INSERT INTO filtered_bars (id,lon,lat,name,website,phone,opening_hours) VALUES ('${scape//\;/"', '"}');"
done
echo "Poblando Segundo Pipeline"