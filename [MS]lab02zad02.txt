data segment  
    niza db 10 dup (?)
ends


code segment
    mov bx, OFFSET niza
    mov cx, 0h
        
    vnes:
        mov ah, 01h
        int 21h
        
        mov [bx], al    ;smesti go brojot od tastatura
                        ;na lokacija so vrednost bx
        inc bx          ;zgolemi bx za 1(sledna adresa)
        inc cx          ;zgolemi cx za 1(counter)          
        
        cmp cx, 10d     ;proveri dali sme vnele 10 bukvi
        jne vnes
        
        mov cx, 0h      ;resetiraj brojac
        mov bx, OFFSET niza ;resetiraj bx
    pechati:     
               
        mov dl, [bx]    ;vrednosta na lokacija [bx]
                        ;stavi ja vo dl
        cmp dl, 48d     ; 0
        jl prodolzhi    ; ako ne e cifra prodolzhi   
        cmp dl, 57d     ; 9
        jg prodolzhi
        
        inc bx          ;zgolemi bx za 1(sledna adresa)
        inc cx          ;zgolemi cx za 1(counter)
        mov dl, [bx]    ;vrednosta na lokacija [bx]
                        ;stavi ja vo dl
        proveri_caps:
            cmp dl, 65d ;A
            jl proveri  ;nadvor od ascii rang,
                        ;prodolzhi so ciklus
            cmp dl, 90d ;Z
            jg proveri  ; -||-
            
            mov dl, [bx]
            mov ah, 02h ;pechatenje
            int 21h 
            jmp proveri
        
    prodolzhi:
        inc bx          ;zgolemi bx za 1
        inc cx          ;zgolemi cx za 1
        
    proveri:    
        cmp cx, 10d
        jne pechati           
               
               
              
ends
