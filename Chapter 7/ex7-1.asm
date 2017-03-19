TITLE Chapter 7 Exercise 1                   

INCLUDE Irvine32.inc

.data

op1 QWORD 0A2B2A40674981234h,0B457AFD8BC939321h,06453DC973294BFE2h,0D98709374FDECAA0h
op2 QWORD 0A010870000234502h,0FBC974FDDC97B2A4h,0E6749332BFE253DCh,02974BC9397320002h

sum DWORD 9 dup(0) 

msg BYTE "Sum is: ",0

.code
main PROC

	mov  esi, OFFSET op1	; first operand
	mov  edi, OFFSET op2	; second operand
	mov  ebx, OFFSET sum	; sum
	mov  ecx, 8	; number of doublewords
	call Extended_Add

	mov edx, OFFSET msg	; message to display
	call WriteString

	mov esi, OFFSET sum	; starting address of sum
	add esi, 8 * TYPE sum	; get to the start of last dword in sum
	mov ecx, LENGTH sum	; number of doublewords

L1:	mov eax, [esi]	; get 32 bits of sum
	call WriteHex	; display on the screen
	sub esi, TYPE sum	; previous dword (little endian order)
	loop L1

	call Crlf
	exit

main ENDP
 
Extended_Add PROC 
	pushad
	clc	; clear the Carry flag

L1:	mov eax,[esi]	; get the first integer
	adc eax,[edi]	; add the second integer
	pushfd	; save the Carry flag
	mov [ebx],eax	; store partial sum
	add esi,4	; advance all 3 pointers
	add edi,4
	add ebx,4
	popfd	; restore the Carry flag
	loop L1	; repeat the loop

	adc word ptr [ebx],0	; add any leftover carry
	popad
	ret
Extended_Add ENDP

END main