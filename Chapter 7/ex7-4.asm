TITLE Chapter 7 Exercise 4               
INCLUDE Irvine32.inc

COUNT = 4	; shift count

.data
array DWORD 648B2165h,8C943A29h,6DFA4B86h,91F76C04h,8BAF9857h

.code
main PROC

	mov  bl,COUNT
	call ShiftDoublewords

; Display the results
	mov  esi,OFFSET array
	mov  ecx,LENGTHOF array
	mov  ebx,TYPE array
	call DumpMem

	exit
main ENDP
 
ShiftDoublewords PROC 
	mov  esi,OFFSET array
	mov  ecx,(LENGTHOF array) - 1

L1:	push ecx		; save loop counter
	mov  eax,[esi + TYPE DWORD]
	mov  cl,bl		; shift count
	shrd [esi],eax,cl		; shift EAX into high bits of [esi]
	add  esi,TYPE DWORD		; point to next doubleword pair
	pop  ecx		; restore loop counter
	loop L1

; Right-shift the last doubleword
	shr DWORD PTR [esi],COUNT

	ret
ShiftDoublewords ENDP

END main