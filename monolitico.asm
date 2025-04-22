default rel
extern printf
extern ExitProcess

section .data
    n dq 4
    msg db "Soma monolitica: %d", 0xD, 0xA, 0

section .text
global main

main:
    sub rsp, 40         

    xor rax, rax        
    mov rcx, [rel n]   
    mov rdx, 1         

.loop:
    cmp rdx, rcx
    ja .fim
    add rax, rdx
    inc rdx
    jmp .loop

.fim:
    lea rcx, [rel msg]  
    mov rdx, rax        
    xor eax, eax       
    call printf

    xor ecx, ecx
    call ExitProcess

    add rsp, 40
    ret
