TITLE Chapter 10 Exercise 4              (ch10_04.asm)

INCLUDE Irvine32.inc

mMult32 MACRO op1,op2,product
	push eax
	push edx
	mov eax,op1		;; EAX = destination
	mul op2		;; EDX:EAX = product
	mov product,eax		;; discard high 32 bits
	pop edx
	pop eax
ENDM

.data
val1 DWORD 1000h
val2 DWORD 200h
prod DWORD ?

.code
main PROC

	mMult32 val1,val2,prod

; Display results
	mov eax,prod
	call WriteHex
	call Crlf

	exit
main ENDP
END main