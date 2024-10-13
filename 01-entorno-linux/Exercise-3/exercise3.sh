#!/bin/bash

rm -r foo/ 2> /dev/null

mkdir -p foo/dummy
mkdir -p foo/empty

echo ${1:-'Que te gusta la bash!!'} > foo/dummy/file1.txt | touch foo/dummy/file2.txt
cat foo/dummy/file1.txt > foo/dummy/file2.txt

mv foo/dummy/file2.txt foo/empty/

echo "Contenido de file1.txt"
cat foo/dummy/file1.txt
echo "Contenido de file2.txt"
cat foo/empty/file2.txt
echo "Estructura:"
find foo/