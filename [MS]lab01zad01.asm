data segment
        x db 5d
ends
    
code segment
    
    mov cx, 1201d
    mov ax, 111b
    and ax, cx
    cmp ax, 111b
    ;CF=1, ZF=0, SF=1, OF=0, PF=1, AF=1, IF=1, DF=0
    
    mov dl, x
    mov al, 5d
    mul dl
    ;al=25d
    
    mov dl, 21d
    sub al, dl
    mov dl, al
    ;dl=4
    add dl, 48d
    ;brojka + 48 = ascii kod za taa brojka
    
    mov ah, 02h
    int 21h
    ;print

ends

