data segment
    broj    db ?    
    ostatok db ?
ends
    
code segment
 
    mov ah, 01h 
    int 21h      
    
    mov dl, al
    sub dl, 48d ;konverzija od ascii vo d
    mov ax, 10
    mul dl
    mov dl, al
    
    mov ah, 01h
    int 21h
    sub dl, 48d
    add dl, al     
    
    mov broj, dl  
    
    xor ax,ax
    mov al, broj
        
    mov bx, 7d    
    
    div bl
    
    mov ostatok, ah
               
              
    mov dl, ah
    cmp dl, 0
    je printDa
    
    printNe:
    mov dl, 'N'
    mov ah, 02h
    int 21h  
    mov dl, 'e'
    mov ah, 02h
    int 21h   
    jmp kraj
    
    printDa:
    mov dl, 'D'
    mov ah, 02h
    int 21h  
    mov dl, 'A'
    mov ah, 02h
    int 21h  
    
    kraj:

ends