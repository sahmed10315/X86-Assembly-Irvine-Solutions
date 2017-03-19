TITLE Chapter 7 Exercise 2                  

INCLUDE Irvine32.inc

.data
op1 QWORD 0A2B2A40674981234h
op2 QWORD 08010870000234502h
result QWORD 1 DUP(0)	 
msg BYTE "The difference equals ",0

; Count the number of doublewords in each operand.
DoubleWords = SIZEOF op1 / TYPE DWORD	; 2

.code
main PROC

	mov  esi, OFFSET op1	; first operand
	mov  edi, OFFSET op2	; second operand
	mov  ebx, OFFSET result	; result
	mov  ecx, DoubleWords	; number of doublewords
	call Extended_Sub

	mov edx, OFFSET msg	; message to display
	call WriteString

	mov esi, OFFSET result	; starting address of result
	add esi, DoubleWords * 4	; move to end of last dword in result
	mov ecx, DoubleWords	; number of doublewords

L1:	sub esi, TYPE DWORD	; previous dword (little endian order)
	mov eax, [esi]	; get 32 bits of result
	call WriteHex	; display on the screen
	loop L1

	call Crlf
	exit
main ENDP
 
Extended_Sub PROC 
	pushad
	clc	; clear the Carry flag

L1:	mov eax,[esi]	; get the first integer
	sbb eax,[edi]	; subtract the second integer
	pushfd	; save the Carry flag
	mov [ebx],eax	; store partial result
	add esi,4	; advance all 3 pointers
	add edi,4
	add ebx,4
	popfd	; restore the Carry flag
	loop L1	; repeat the loop

	sbb word ptr [ebx],0	; subtract any leftover carry
	popad
	ret
Extended_Sub ENDP

END main