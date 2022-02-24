#!/usr/bin/env bash

FILE_PATH="$1"

DIR="$(dirname "${FILE_PATH}")"
FILE="$(basename "${FILE_PATH}")"
FILE_NO_EXT=${FILE%.*}
LINKED_FILE="$DIR/$FILE_NO_EXT.o"
OUT_FILE="$DIR/$FILE_NO_EXT.out"

echo "Compiling: $FILE_PATH to $LINKED_FILE"
nasm -fmacho64 $FILE_PATH 

echo "Linking $LINKED_FILE to $OUT_FILE"
ld -e start -static $LINKED_FILE -o $OUT_FILE