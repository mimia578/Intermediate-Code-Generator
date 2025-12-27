#!/bin/bash

# Compiler build script for Lab 4
yacc -d -y --debug --verbose 22101088_22101357.y
echo 'Generated the parser C file and header file'
g++ -w -c -o y.o y.tab.c
echo 'Generated the parser object file'
flex 22101088_22101357.l
echo 'Generated the scanner C file'
g++ -fpermissive -w -c -o l.o lex.yy.c
echo 'Generated the scanner object file'
g++ y.o l.o -o compiler
echo 'All ready, running the compiler...'

# Run the compiler on the input file
./compiler input.c
echo 'Compilation completed.'

# Display output files
echo '------------ Log output ------------'
cat log.txt
echo '------------ Error output ------------'
cat error.txt
echo '------------ Three Address Code ------------'
cat code.txt