	org 000

	ljmp MAIN

	org 080h
MAIN:

;init time
	
	mov TMOD,#0x01;using mode 
      	
LOOP:

	mov a,#0x00
	mov P1,a

	lcall DELAY

	mov a,#0xff
	mov P1,a

	lcall DELAY
	sjmp LOOP


DELAY:;30*10ms
	mov r2,#50
INNER_LOOP:
	clr TR0
	clr TF0
	mov TL0,#0x00
	mov TH0,#0xDC
	setb TR0;start
	jnb TF0,$	
	clr TF0
	djnz r2,INNER_LOOP
	ret
	

	end
