%include "play_song.inc"
extern _MessageBoxA@16
extern _ExitProcess@4
extern _GetConsoleWindow@0
extern _ShowWindow@8
extern _printf
;extern _scanf

section .data
    title db 'Sound', 0
    message db 'Play', 0
    console db 'Playing the sound...', 0xa, 0
    done db 'Complete!', 0xa, 0

section .text
     global _main

_main:
    call _GetConsoleWindow@0
    push 0
    push eax
    call _ShowWindow@8

    push 4
    push title
    push message
    push 0
    call _MessageBoxA@16
    cmp eax, 6
    jne .1
    push console
    call _printf
    call play_song
    push done
    call _printf
    .1:
    call _ExitProcess@4