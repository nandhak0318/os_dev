org 0x7C00
bits 16


start:
  jmp main

puts:
  push si

.loop:
  lodsb
  cmp al,0
  je .done

  mov ah,0x0E
  mov bh,0
  int 0x10

  jmp .loop

.done:
  pop si
  ret


main:
  ;data segments
  mov ax,0
  mov ds,ax
  mov es,ax

  ;stack segment grows downward
  mov ss,ax
  mov sp, 0x7C00


  mov si, msg_hello
  call puts
  hlt

.halt:
  jmp .halt


msg_hello: db 'vanakam nanbam chennai_la irunthu',0


times 510-($-$$) db 0
dw 0AA55h
