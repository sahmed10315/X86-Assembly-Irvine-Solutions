TITLE Exercise 6 from chapter 4

; Author : Saad Ahmed

INCLUDE Irvine32.inc

.data
FIRST DWORD ?
SECOND DWORD ?
RESULT DWORD ?

.code
main PROC

	mov ecx, 12
	
	mov FIRST, 0
	mov SECOND, 1
	
	top:
			mov eax, FIRST
			add eax, SECOND
			call DumpRegs 		; Display registers
			mov RESULT, eax
			mov eax, SECOND
			mov FIRST, eax
			mov eax, RESULT
			mov SECOND, eax
	loop top
		

	exit
main ENDP
END main