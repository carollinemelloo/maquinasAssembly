default rel
extern printf
extern ExitProcess

section .data
    n dq 4
    msg db "Soma Recursiva: %d", 0xA, 0

section .text
global main

soma_recursiva:
    cmp rcx, 0
    jle .base_case

    push rcx             
    dec rcx             
    call soma_recursiva 
    pop rdx              
    add rax, rdx         
    ret

.base_case:
    xor rax, rax         
    ret

main:
    sub rsp, 40          

    mov rcx, [rel n]    
    call soma_recursiva  

    lea rcx, [rel msg]   
    mov rdx, rax         
    xor eax, eax        
    call printf

    xor ecx, ecx
    call ExitProcess
