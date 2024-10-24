section .bss
    num resb 4            ; Speicherplatz für die Eingabe (4 Bytes)

section .data
    prompt db 'Gib eine Zahl ein: ', 0
    result_msg db 'Erhöhte Zahl: ', 0
    newline db 0x0A       ; Neue Zeile

section .text
    global _start

_start:
    ; Ausgabeaufforderung anzeigen
    mov eax, 4             ; sys_write
    mov ebx, 1             ; Ausgabe auf stdout
    mov ecx, prompt        ; Adresse der Eingabeaufforderung
    mov edx, 18            ; Lange der Nachricht
    int 0x80

    ; Eingabe lesen
    mov eax, 3             ; sys_read
    mov ebx, 0             ; stdin
    mov ecx, num           ; Adresse des Speichers für die Eingabe
    mov edx, 4             ; Anzahl der zu lesenden Bytes
    int 0x80

    ; Eingabe (ASCII) in Zahl umwandeln
    mov eax, [num]         ; Die eingegebene Zahl laden
    sub eax, '0'           ; ASCII in Zahl umwandeln

    ; Zahl um 1 erhöhen
    add eax, 1

    ; Zahl wieder in ASCII umwandeln
    add eax, '0'

    ; Ergebnisnachricht ausgeben
    mov [num], eax         ; Das Ergebnis in den Speicher zurückschreiben

    mov eax, 4             ; sys_write
    mov ebx, 1             ; stdout
    mov ecx, result_msg    ; Adresse der Ergebnisnachricht
    mov edx, 16            ; Länge der Nachricht
    int 0x80

    ; Erhöhte Zahl ausgeben
    mov eax, 4             ; sys_write
    mov ebx, 1             ; stdout
    mov ecx, num           ; Adresse der Zahl
    mov edx, 1             ; Länge der Zahl
    int 0x80

    ; Neue Zeile ausgeben
    mov eax, 4             ; sys_write
    mov ebx, 1             ; stdout
    mov ecx, newline       ; Neue Zeile
    mov edx, 1
    int 0x80

    ; Programm beenden
    mov eax, 1             ; sys_exit
    xor ebx, ebx           ; Rückgabewert 0
    int 0x80
