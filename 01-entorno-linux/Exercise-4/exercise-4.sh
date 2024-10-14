#!/bin/bash

if [[ $# -lt 1 ]]; then
  echo "Error: missing arguments."
  exit 2
fi

#Single-Line if statement
# [ $# -lt 1 ] && { echo "Error: missing arguments."; exit 2; }

FILENAME=result.txt

TOTALMATCHES=$(curl -s https://www.google.es/search?q=$1 -o $FILENAME | grep -io $1 $FILENAME | wc -w)
FIRSTLINE=$(grep -nm 1 $1 $FILENAME | awk -F: '{print $1}')

if [ $TOTALMATCHES -eq 0 ]; then
        echo No se ha encontrado la palabra \"$1\"
else
        echo La palabra \"$1\" aparece $TOTALMATCHES veces
        echo Aparece por primera vez en la linea $FIRSTLINE
fi