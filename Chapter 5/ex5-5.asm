TITLE Chapter 5 Exercise 5              (ch05_05.asm)

INCLUDE Irvine32.inc

COUNT = 50

.data
commaStr BYTE ", ",0

.code
main PROC
	call Clrscr		; optional: clear screen
	call Randomize		; optional: reseed random generator
	mov  ecx,COUNT		; loop counter

L1:	mov  eax,41		; generate rand int (0..40)
	call RandomRange
	sub  eax,20		; bias to -20..+20 range
	call WriteInt		; display the integer
	mov  edx,OFFSET commaStr
	call WriteString
	loop L1

	call Crlf

	exit
main ENDP
END main