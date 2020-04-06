data segment
    s       dw 0d   
    brojka  db 0d 
    pom1    db 0d
    pom2    db 0d
ends


code segment
    ;pri sekoj vnes na cifra
    ;se azurira zbirot na parni cifri
                       
    vnes:
        mov ah, 01h
        int 21h
        mov bl, al
        cmp bl, 35  ;sporedi so taraba
        je pechati
                 
        sub bl, 48d ;napravi go brojka, ascii konverzija        
        mov dl, bl  ;vo dl go chuvame brojot
                    ;za ako e paren da se dodade
        xor ax,ax   ;resetiraj ax
        mov al, bl  ;stavi ja vo al za da se deli so 2 (bx)
        
        mov bx, 2d   
        div bl      ;=ax/bx
    
        cmp ah, 0   ;if ostatok = 0
        je soberi
        jmp vnes
            
            
    soberi:    
        add s, dx   ;s+=dx
        jmp vnes 
         
         
    pechati:      
        ;add s, 48d  ;vrati go vo ascii  
        xor bx,bx
         
        mov bx, 10d
        mov ax, s         
        div bl      ;=ax/bx
        
        while:
            cmp al, 0               ;if al = 0 ->jump kraj
            je pechati_ostatok      ;znaci treba da se pecati
                                    ;samo ostatokot  
                   
            cmp al, 10
            jge dvocifren
                        
            mov dl, al    ;spremi go za pecatenje
            add dl, 48d   ;ascii konverzija
            
            mov cl, ah    ;zacuvaj go ostatokot
            
            mov ah, 02h   ;ispecati cel broj    
            int 21h     
                      
            mov al, cl    ;vo al stavi go ostatokot
            xor ah, ah    ;od prethodnoto delenje 
                          ;reset ah 
            div bl        ;=ax/bx  
            cmp al, 0              
            je kraj
            jmp while   
            
            
    dvocifren:
                
            mov pom1, ah    ;zachuvaj go ostatokot vo pom1
            xor ah, ah      ;primer 124/10 => ah=pom1=4, al=12
           
            div bl          ;podeli go novodobieniot broj
                            ;soglasno prethodniot primer,
                            ;pom2=ah=2, al=1
            mov pom2, ah    ;zachuvaj ostatok
            mov dl, al      ;smesti go vo dl
            add dl, 48d     ;ascii konverzija, spremi za pechatenje
            mov ah,02h   
            int 21h

            mov dl, pom2    ;stavi go pom2 ostatokot vo dl
            add dl, 48d     ;ascii konverzija, spremi za pechatenje
            mov ah, 02h
            int 21h
                
            mov al, pom1    ;stavi vo al pom1 t.e. ostatokot od
                            ;prvoto delenje (pom1 = 4)
            xor ah,ah       ;reset ah         
            div bl
                                
            
            jmp while  
                 
          
          
          
    kraj:  
        mov dl, ah         ;pecati go samo ostatokot
        add dl, 48d        ;ascii konverzija
        mov ah, 02h
        int 21h 
        jmp zavrshi 
             
    pechati_ostatok:
        mov dl, ah         ;pecati go samo ostatokot
        add dl, 48d        ;ascii konverzija
        mov ah, 02h
        int 21h      
    zavrshi:
                   
ends
