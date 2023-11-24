; bunnies.asm
  .assume adl=1
  .org $040000

  jp start

; 
  .align 64
  .db "MOS",0,1

start:
  push af
  push bc
  push de
  push ix
  push iy

  LD	HL, vdu		; Address of text
  LD	BC, 0			; Set to 0, so length ignored...
  LD	A, 0			; Use character in A as delimiter
  RST.LIS	18h		; This calls a RST in the eZ80 address space

  ld b,13
loop0:
  push bc
  ld b,19
loop1:
  LD A,224
  RST.LIL 10h
  LD A,32
  RST.LIL 10h
  djnz loop1
  LD A,13
  RST.LIL 10h
  LD A,10
  RST.LIL 10h
  ld b,19
loop2:
  LD A,225
  RST.LIL 10h
  LD A,32
  RST.LIL 10h
  djnz loop2
  LD A,13
  RST.LIL 10h
  LD A,10
  RST.LIL 10h
  pop bc
  LD A,17
  RST.LIS 10h
  LD A,B
  RST.LIS 10h
  djnz loop0

  pop iy
  pop ix
  pop de
  pop bc
  pop af
  ld hl,0
  ret

vdu:
  .db 22,8,23,224,112,154,159,61,93,117,124,56,23,225,8,62,93,157,21,116,119,7,17,5,0
