; monolitico.asm - Soma de 1 até n (versão monolítica)
default rel
extern printf
extern ExitProcess

section .data
    n dq 4
    msg db "Soma monolitica: %d", 0xD, 0xA, 0

section .text
global main

main:
    sub rsp, 40         ; Shadow space (32) + alinhamento (8)

    xor rax, rax        ; soma = 0
    mov rcx, [rel n]    ; rcx = n
    mov rdx, 1          ; i = 1

.loop:
    cmp rdx, rcx
    ja .fim
    add rax, rdx
    inc rdx
    jmp .loop

.fim:
    ; Preparar argumentos para printf
    lea rcx, [rel msg]  ; 1º argumento: format string
    mov rdx, rax        ; 2º argumento: resultado da soma
    xor eax, eax        ; nenhum XMM usado
    call printf

    xor ecx, ecx
    call ExitProcess

    add rsp, 40
    ret
