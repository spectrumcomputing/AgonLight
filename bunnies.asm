

; bunnies.asm
  .assume adl=1
  .org $040000

  jp start

; 
  .align 64
  .db "MOS",0,1

start:
  push af         ; Push all registers to the stack
  push bc
  push de
  push ix
  push iy

  LD hl, vdu
  LD bc, 0
  LD a, 0
  RST.LIS 18h

  ld b,13
loop0:
  push bc
  ld b,19
loop1:
  LD a,224
  RST.LIL 10h
  LD a,32
  RST.LIL 10h
  djnz loop1
  LD a,13
  RST.LIL 10h
  LD a,10
  RST.LIL 10h
  ld b,19
loop2:
  LD a,225
  RST.LIL 10h
  LD a,32
  RST.LIL 10h
  djnz loop2
  LD a,13
  RST.LIL 10h
  LD a,10
  RST.LIL 10h
  pop bc
  LD a,17
  RST.LIS 10h
  LD a,b
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

