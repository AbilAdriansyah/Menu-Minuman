                       INCLUDE 'emu8086.inc' ;memanggil file headeer emu 8086 ke dalam program

.org 100h

JMP MULAI:
           msg_simbol1 DB 0Dh,0Ah,'+-----------------------------+',0Dh,0Ah,'$'
           msg_nama    DB 0Dh,0Ah,'|   NAMA : ABIL ADRIANSYAH     |',0Dh,0Ah,'$' 
           msg_nim     DB 0Dh,0Ah,'|   NIM  : 2300018022          |',0Dh,0Ah,'$'
           msg_simbol2 DB 0Dh,0Ah,'+-----------------------------+',0Dh,0Ah,'$' 
           msg_menu    DB 0Dh,0Ah,'|        MENU MINUMAN         |',0Dh,0Ah,'$' 
           msg_simbol3 DB 0Dh,0Ah,'+-----------------------------+',0Dh,0Ah,'$'
           msg_mnman1  DB 0Dh,0Ah,' 1. TEH HANGAT -> Rp. 5000     ',0Dh,0Ah,'$' 
           msg_mnman2  DB 0Dh,0Ah,' 2. KOPI HITAM -> Rp. 7000     ',0Dh,0Ah,'$' 
           msg_mnman3  DB 0Dh,0Ah,' 3. JUS JERUK  -> Rp. 6000     ',0Dh,0Ah,'$'
           msg_keluar  DB 0Dh,0Ah,' 4. KELUAR                     ',0Dh,0Ah,'$' 
           msg_invalid DB 0Dh,0Ah,' MOHON MASUKAN PILIHAN BENARNYA',0Dh,0Ah,'$'
           msg_pilih   DB 0Dh,0Ah,' PILIH MINUMAN (1-3) : $'
           harga       DB 0dh,0ah,' MASUKKAN HARGA DULU : $'  
           msg_beli    DB 0Dh,0Ah,' BELINYA BERAPA KAK  : $'  
           msg_total   DB 0Dh,0Ah,' JADINYA HARGANYA SEGINI YA KAK : $'  
           hrg DW ?;untuk menyimpan data atau hasil inputan dari harga yang di masukkan
           jml DW ?;unntuk menyimppan data atau hasil inputan dari jumlah yang di beli
           are DW ?;untuk menampung hasil dari jumlah masukkan dan harga masukkann

MULAI:
    
    
    MOV AH, 09h
    LEA DX, msg_simbol1
    INT 21h
      
    MOV AH, 09h
    LEA DX, msg_nama
    INT 21h
    
    MOV AH, 09h
    LEA DX, msg_nim
    INT 21h 
    
    MOV AH, 09h
    LEA DX, msg_simbol2
    INT 21h  
    
    MOV AH, 09h
    LEA DX, msg_menu 
    INT 21h   
    
    MOV AH, 09h
    LEA DX, msg_simbol3
    INT 21h
    MOV AH, 09h
    LEA DX, msg_mnman1
    INT 21h
    
    MOV AH, 09h
    LEA DX, msg_mnman2
    INT 21h
    MOV AH, 09h
    LEA DX, msg_mnman3
    INT 21h
    
    MOV AH, 09h
    LEA DX, msg_keluar
    INT 21h  
    
MENU:
    MOV AH, 09h
    LEA DX, msg_pilih
    INT 21h
    MOV AH, 01h
    INT 21h  
    
    CMP AL, '1'
    JE MINUMAN1
    CMP AL, '2'
    JE MINUMAN2
    CMP AL, '3'
    JE MINUMAN3
    CMP AL, '4'
    JE KELUAR
    
    JMP INVALID
MINUMAN1:
    MOV AH, 9h
    LEA DX, msg_mnman1
    INT 21h 
    
    LEA DX,harga
    MOV AH,9h
    int 21h
    call scan_num ;untuk memanggil inputan berasal dari header 'emu8086.inc'
    mov hrg,cx
  
    LEA DX, msg_beli
    MOV AH, 09h
    INT 21h    
    
    call scan_num ;untuk memanggil inputan berasal dari header 'emu8086.inc'
    mov jml,cx
    
     
     mov ax,jml
     mov bx,hrg
     imul bx
     push ax 
     
    LEA DX, msg_total
    MOV AH, 09h
    INT 21h
    pop ax
    mov are,ax
    call print_num ;untuk mempritn atau mencetak hasil dari harga dan jumllah berasal dari header 'emu8086.inc'
    
    
jmp menu

MINUMAN2:
    MOV AH, 09h
    LEA DX, msg_mnman2
    INT 21h
    LEA DX,harga
    MOV AH,09h
    int 21h
    call scan_num ;untuk memanggil inputan
    mov hrg,cx
    
    LEA DX, msg_beli
    MOV AH, 09h
    INT 21h    
    
    call scan_num ;untuk memanggil inputan 
    mov jml,cx
    
     
     mov ax,jml
     mov bx,hrg
     imul bx
     push ax  
     
     LEA DX, msg_total
    MOV AH, 09h
    INT 21h
    pop ax
    mov are,ax
    call print_num ;untuk mempritn atau mencetak hasil dari harga dan jumllah berasal dari header 'emu8086.inc'
     
     
   jmp menu

MINUMAN3:
    MOV AH, 09h
    LEA DX, msg_mnman3
    INT 21h
   LEA DX,harga
    MOV AH,09h
    int 21h
    call scan_num ;untuk memanggil inputan
    mov hrg,cx
    
    LEA DX, msg_beli
    MOV AH, 09h
    INT 21h    
    
    call scan_num ;untuk memanggil inputan 
    mov jml,cx
    
     
     mov ax,jml
     mov bx,hrg
     imul bx
     push ax
     
      LEA DX, msg_total
    MOV AH, 09h
    INT 21h
    pop ax
    mov are,ax
    call print_num ;untuk mempritn atau mencetak hasil dari harga dan jumllah berasal dari header 'emu8086.inc'
    
    ret ;intruksi untuk mengembalikkan kendali program ke alamat pemanggil
    define_scan_num ;untuk membaca hasil inputan angka dari masukkan pengguna 
    define_print_num ;untuk membaca hasil pencetakkan dari call print_num
    define_print_num_uns ;untuk mencetak angkka tak bertanda di layar
    
jmp menu
    


KELUAR:  
    LEA DX, msg_keluar
    MOV AH, 09h
    INT 21h
    MOV AH, 4Ch
    INT 21h
INVALID:
    LEA DX, msg_invalid
    MOV AH, 09h
    INT 21h
    JMP MENU

    
END main