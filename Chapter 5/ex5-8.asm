TITLE Chapter 5 Exercise 8             

INCLUDE Irvine32.inc

CHAR_VALUE = 'A'
.data

.code
main PROC
	call Clrscr
	mov  eax,0

	mov  ecx,16
L1:	
	push ecx	; vary the background colors

	mov  ecx,16
	
	L2:	
		call SetTextColor	; vary the foreground colors
		push eax
		mov  al,CHAR_VALUE
		call WriteChar
		pop  eax

		inc  al	; next foreground color
		loop L2

	sub  al,16	; reset foreground color to zero
	add  al,16	; select next background color
	call Crlf

	pop  ecx
	loop L1

	mov  eax,7
	call SetTextColor

	exit
main ENDP
END main