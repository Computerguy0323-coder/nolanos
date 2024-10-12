[org 0x7C00]

mov si, STR_0
call printf

mov si, STR_T
call printf

mov si, STR_TH
call printf

jmp $

printf:
    pusha
    str_loop:
      mov al, [si]
      cmp al, 0
      jne print_char
      popa
      ret

   print_char:
     mov ah, 0x0e
     int 0x10
     add si, 1
     jmp str_loop

STR_0: db "Loaded in 16-bit Real Mode to memory location 0x7c00.", 0x0a, 0x0d, 0
STR_T: db "These messages use the BIOS interrupt 0x10 with the ah register set to 0x0e", 0x0a, 0x0d, 0
STR_TH: db "NolanOS test boot complete. Power off this machine and load this os in the future when it is complete", 0

times 510-($-$$) db 0
dw 0xaa55
