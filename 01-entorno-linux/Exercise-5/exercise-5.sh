#!/bin/bash

if [[ $# -ne 2 ]]; then
  echo "Se necesitan dos parametros para ejecutar el script"
  exit 1
fi

FILENAME=result.txt

TOTALMATCHES=$(curl -s $1 -o $FILENAME | grep -io $2 $FILENAME | wc -w)
FIRSTLINE=$(grep -nm 1 $2 $FILENAME | awk -F: '{print $1}')

if [ $TOTALMATCHES -eq 0 ]; then
        echo No se ha encontrado la palabra \"$2\"
elif [ $TOTALMATCHES -eq 1 ]; then
        echo La palabra \"$2\" aparece $TOTALMATCHES vez
        echo Aparece unicamente en la linea $FIRSTLINE
else
        echo La palabra \"$2\" aparece $TOTALMATCHES veces
        echo Aparece por primera vez en la linea $FIRSTLINE
fi