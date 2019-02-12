#!/bin/sh
rm -rf dist/ejemplos
rm -rf dist/desafios
mkdir -p dist/ejemplos
mkdir -p dist/desafios
cd src
cd ejemplos
for i in `ls`; do
	echo "Zipping $i..."
	rm -rf $i/export
	zip "../../dist/ejemplos/$i.zip" $i -r -q
	
done;
cd ..
cd desafios
for i in `ls`; do
	echo "Zipping $i..."
	rm -rf $i/export
	zip "../../dist/desafios/$i.zip" $i -r -q
done;
cd ../..
