TITLE Ch 4 Ex 8

INCLUDE Irvine32.inc
 
.code
main PROC
	call Clrscr
	mov  eax,0

	mov  ecx,16
L1:	
	push ecx	

	mov  ecx,16
	
	L2:	
		call SetTextColor	
		push eax
		mov  al,'S'
		call WriteChar
		pop  eax

		inc  al	
		loop L2

	sub  al,16	
	add  al,16	
	call Crlf

	pop  ecx
	
	loop L1

	mov  eax,7
	call SetTextColor

	exit
main ENDP
END main