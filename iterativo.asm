default rel
extern printf
extern ExitProcess

section .data
    n dq 4
    msg db "Soma Iterativa: %d", 0xD, 0xA, 0

section .text
global main


soma_iterativa:
    xor rax, rax        
    mov rdx, 1         
.loop:
    cmp rdx, rcx
    ja .fim
    add rax, rdx
    inc rdx
    jmp .loop
.fim:
    ret

main:
    sub rsp, 40         

   
    mov rcx, [rel n]
    call soma_iterativa 

    
    lea rcx, [rel msg]  
    mov rdx, rax        
    xor rax, rax       
    call printf

   
    add rsp, 40         
    xor ecx, ecx
    call ExitProcess

