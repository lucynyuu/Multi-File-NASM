%include "song.inc"
extern _Beep@8
extern _Sleep@4

play_song:
    xor ecx, ecx
    .1: mov ebx, [tempo+ecx*4]
    cmp ebx, 9999
    je .2
    mov eax, 1000
    xor edx, edx
    div ebx
    push ecx
    push eax
    call _Sleep@4
    pop ecx
    mov ebx, [tempo+ecx*4]
    mov eax, 1000
    xor edx, edx
    div ebx
    mov ebx, [notes+ecx*4]
    push ecx
    push eax
    push ebx
    call _Beep@8
    pop ecx
    inc ecx
    jmp .1
    .2: ret
