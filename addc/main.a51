	org 0000
	ljmp MAIN

	org 0x200
MAIN:
	;0x1067 + 0x10a0

	mov r0,#067h
	mov r1,#0a0h
	mov a,r0
	add a,r1
	mov r2,a

	clr a
	mov r1,#010h
	mov a,r1
	add a,r1


	jmp _SUBB

_SUBB:
	mov r1,#081h
	mov r0,#080H
	mov a,r0
	subb a,r1

	mov r1,#01h
	mov a,#02h
	subb a,r1

	mov r2,a
	sjmp $

	end

