include 'emu8086.inc'
name "SORT"

org 100h

jmp start

m1:
array db 8, 3, 6, 2, 5, 4, 9, 1, 17, 12  
str1 db 0dh,0ah
A_size = 10 
  db 0Dh,0Ah,'$'                                                   
    
DEFINE_SCAN_NUM
DEFINE_PRINT_STRING
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS  
DEFINE_PTHIS

               
buffer db 0 

start:
    MOV AH, 1
    INT 21h
  
          

             
sort:              
    mov cx,10
    dec cx
    
    outer_loop:
    mov bx,cx
    mov si,0
    
    inner_loop:
        mov ah,array[si]
        mov dl,array[si+1]
                 
        cmp al, 'A'
        jne DDDD
        jmp AAAA
                        
        AAAA:
            cmp ah, dl
            jle noswap
            jg swap   
        DDDD:
            cmp ah, dl
            jge noswap
            jl swap
        swap:
        mov array[si],dl
        mov array[si+1],ah
        
        noswap:
        inc si
        dec bx
        jnz inner_loop
    loop outer_loop
    jmp Exit


             

Exit:   
PrintArr:
        PRINT 'Sorted array: '
        MOV BL, 000h                    
        MOV AH, 000h
        next: 
            MOV AL, array[BX]
            INC BL
            call print_num
            PRINT ', '
        CMP BL, 10
        JL next
RET