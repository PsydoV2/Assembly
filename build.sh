#!/bin/bash

if [ -z "$1" ]; then
    echo "❌ Bitte gib den Dateinamen ohne Endung an, z. B.: ./build.sh hello"
    exit 1
fi

FILENAME="$1"
OUTDIR="out"

if [ ! -f "$FILENAME.asm" ]; then
    echo "❌ Datei '$FILENAME.asm' nicht gefunden."
    exit 1
fi

# Ausgabeverzeichnis erstellen, falls nicht vorhanden
mkdir -p "$OUTDIR"

# Assemblieren
nasm -f elf32 "$FILENAME.asm" -o "$OUTDIR/$FILENAME.o" || exit 1

# Linken
ld -m elf_i386 "$OUTDIR/$FILENAME.o" -o "$OUTDIR/$FILENAME" || exit 1

# Ausführen
echo "🚀 Starte $FILENAME:"
echo "----------------------"
"./$OUTDIR/$FILENAME"
