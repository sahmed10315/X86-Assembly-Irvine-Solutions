TITLE Chapter 8 Exercise 2         
Comment !  
	INVOKE DumpMemory,OFFSET array,LENGTHOF array,TYPE array 
!
INCLUDE Irvine32.inc

DumpMemory PROTO, address:DWORD, units:DWORD, unitType:DWORD

.data
array  DWORD 1,2,3,4,5,6,7,8,9,0Ah,0Bh,0Ch,0Dh,0Eh,0Fh
array1 WORD 0,9,8,7,6,5,4,3,2,1
array2 BYTE '1','2','3','4','5'

.code
main PROC

	INVOKE DumpMemory,OFFSET array,LENGTHOF array,TYPE array
	INVOKE DumpMemory,OFFSET array1,LENGTHOF array1,TYPE array1
	INVOKE DumpMemory,OFFSET array2,LENGTHOF array2,TYPE array2

	exit

main ENDP
 
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