#!/bin/bash

if [ -z "$1" ]; then
    echo "❌ Bitte gib den Dateinamen ohne Endung an, z. B.: ./build.sh hello"
    exit 1
fi

FILENAME="$1"

if [ ! -f "$FILENAME.asm" ]; then
    echo "❌ Datei '$FILENAME.asm' nicht gefunden."
    exit 1
fi

# Assemblieren
nasm -f elf32 "$FILENAME.asm" -o "$FILENAME.o" || exit 1

# Linken
ld -m elf_i386 "$FILENAME.o" -o "$FILENAME" || exit 1

# Ausführen
echo "🚀 Starte $FILENAME:"
echo "----------------------"
./"$FILENAME"

