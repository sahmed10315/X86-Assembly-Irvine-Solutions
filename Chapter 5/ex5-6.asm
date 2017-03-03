TITLE Chapter 5 Exercise 6              (ch05_06.asm)

INCLUDE Irvine32.inc

STR_COUNT = 20
STR_SIZE = 10

.data
aString BYTE STR_SIZE DUP(0),0

.code
main PROC
	mov  ecx,STR_COUNT		; outer loop count

L1:	push ecx		; save outer loop count

	; generate a single string
	mov  ecx,STR_SIZE		; loop counter
	mov  esi,OFFSET aString		; string index

	L2:	mov eax,26		; generate random int (0..25)
		call RandomRange
		add  eax,'A'		; range: 'A'..'Z'
		mov  [esi],al		; store the character
		inc  esi		; next character position
		loop L2

	mov edx,OFFSET aString		; display the string
	call WriteString
	call Crlf

	pop  ecx		; restore outer loop count
	loop L1		; repeat outer loop

	exit
main ENDP
END main