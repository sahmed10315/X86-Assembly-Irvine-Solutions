TITLE Chapter 7 Exercise 7	 
INCLUDE Irvine32.inc

.data
heading BYTE "*** Prime Number Program *** ",
	0dh,0ah,0dh,0ah,0

prompt BYTE "Enter an integer between 2 and 2,147,483,647, ",
	0dh,0ah,
	"or enter 0 to quit: ",0
msgPrime BYTE " is prime.",0dh,0ah,0
msgNotPrime BYTE " is not prime.",0dh,0ah,0

.code
main PROC
	call ClrScr
	mov  edx,OFFSET heading
	call WriteString

L1: call Crlf
	mov  edx,OFFSET prompt
	call WriteString
	call ReadInt		; read value into EAX
	call Crlf
	cmp  eax,0		; does user want to quit?
	jle  Exit_main		; yes

	call IsPrime		; is EAX prime?
	.IF ZERO?		; yes:
	  mov  edx,OFFSET msgPrime	; display "is prime"
	.ELSE		; no:
	  mov  edx,OFFSET msgNotPrime	; display "is not prime"
	.ENDIF

	call WriteDec		; display the number
	call Writestring		; display the message
	jmp  L1

Exit_main:
	call Clrscr
	exit
main ENDP
 
IsPrime PROC 
	pusha
	cmp eax,2		; 1 and 2 are special cases
	jbe L3		; both are prime

	mov ecx,eax	   	; get number for loop count
	shr ecx,1		; divide by 2
	mov ebx,2		; first divisor

L1:	call IsDivisible   		; EAX divisble by EBX?
	jz L4		; yes: quit
	inc ebx		; next divisor
	loop L1

L3:	test eax,0		; prime, so set the Zero flag
	jmp L5

L4:	or eax,0		; not prime, so clear the Zero flag
	jmp L5

L5:	popa
	ret
IsPrime ENDP
 
IsDivisible PROC 
	push  eax
	push  edx
	mov   edx,0
	div   ebx	; divide EAX by EBX
	cmp   edx,0	; remainder = 0?
	pop   edx
	pop   eax
	ret
IsDivisible ENDP

END main