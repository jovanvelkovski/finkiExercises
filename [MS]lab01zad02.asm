data segment
    
ends
    
code segment
    mov ah, 01h
    int 21h
    
    ;bukva golema 65-90
    ;mala 97-122
    if:
        cmp al, 65d
        jl kraj
        cmp al, 122d
        jg kraj
        cmp al, 90d
        jg proveri_mala_bukva
        
    kod:
        mov ah, al
        add al, 1d ;sledna bukva
        cmp al, 90d
        jg proverka1
        
    ima_sledna:
        mov ah, al
        
    prethodna:
        sub al, 2d
        cmp al, 97d
        jl proverka2
    
    ima_prethodna:
        mov ah, al
        jmp kraj    
              
    proverka1:
        cmp al, 122d
        jg prethodna
        cmp al, 97d
        jl prethodna
        jmp ima_sledna          
        
                  
    proverka2:
        cmp al, 65d
        jl kraj
        cmp al, 90d
        jg kraj
        jmp ima_prethodna    
        
                      
    proveri_mala_bukva:    
        cmp al, 97d
        jge kod        
        jmp prethodna
        
    kraj:
        
        mov ah, 01h
        int 21h
             
          

ends

