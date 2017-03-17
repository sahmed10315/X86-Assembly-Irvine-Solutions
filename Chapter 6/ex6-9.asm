TITLE Chapter 6 Exercise 9              
INCLUDE Irvine32.inc

.data
msg BYTE "Line of text with randomly chosen color",0

.code
main PROC

	call ClrScr
	call Randomize	; seed the random number generator

	mov edx, OFFSET msg	; line of text
	mov ecx, 20	; lines of text

L1:	call ChooseColor
	call SetTextColor
	call WriteString	; display line of text
	call Crlf
	loop L1

	exit

main ENDP
 
ChooseColor PROC 

	mov eax, 10	; range of random numbers (0-9)
	call RandomRange	; EAX = Random number
	.IF eax >= 4	; if number is 4-9 (60%)
	  mov eax, green	; choose green
	.ELSEIF eax == 3	; if number is 3 (10%)
	  mov eax, blue	; choose blue
	.ELSE	; number is 0-2 (30%)
	  mov eax, white	; choose white
	.ENDIF

	ret

ChooseColor ENDP

END main