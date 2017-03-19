TITLE Chapter 8 Exercise 1               

INCLUDE Irvine32.inc

Swap PROTO,	; procedure prototype
	pValX:PTR DWORD,
	pValY:PTR DWORD

DumpMemory PROTO, 
	address:DWORD, 
	units:DWORD, 
	unitType:DWORD

.data
array DWORD 16 DUP(?)
msgBefore BYTE "Array before the swap: ",0
msgAfter  BYTE "Array after the swap: ",0

.code
main PROC

	call Randomize	; seed the random number generator
	mov  esi, OFFSET array
	mov  ecx, LENGTHOF array 	; counter
L1:
	call Random32	; EAX = random number
	mov  [esi], eax	; save random number in array
	add  esi, TYPE array	; next entry in array
	loop L1

	; Display the array before the exchange:
	mov  edx, OFFSET msgBefore	; message to display
	call WriteString
	call Crlf
	INVOKE DumpMemory,OFFSET array,LENGTHOF array,TYPE array

	mov  esi, OFFSET array
	mov  ecx, LENGTHOF array 	; number of elements in the array
	shr  ecx, 1	; divide counter by 2. (pair of elements)
L2:
	INVOKE Swap, esi, ADDR [esi + 4]	;swap the pair
	add esi, TYPE array * 2	;next pair
	loop L2

	; Display the array after the exchange:
	mov  edx, OFFSET msgAfter	; message to display
	call WriteString 
	call Crlf
	INVOKE DumpMemory,OFFSET array,LENGTHOF array,TYPE array

	exit

main ENDP
 
Swap PROC USES eax esi edi,
	pValX:PTR DWORD,	; pointer to first integer
	pValY:PTR DWORD	; pointer to second integer 

	mov esi,pValX	; get pointers
	mov edi,pValY
	mov eax,[esi]	; get first integer
	xchg eax,[edi]	; exchange with second
	mov [esi],eax	; replace first integer
	ret

Swap ENDP
 
DumpMemory PROC USES esi ebx ecx, 
	address:DWORD,	; starting address
	units:DWORD,	; number of units
	unitType:DWORD	; unit size
	
	mov esi, address
	mov ecx, units
	mov ebx, unitType
	call DumpMem

	ret

DumpMemory ENDP

END main