TITLE Exercise 3 from chapter 4

; Author : Saad Ahmed

INCLUDE Irvine32.inc

.code
main PROC

	mov eax, 1
	sub eax, 1
	call DumpRegs 		; Display registers
	
	mov eax, 4
	sub eax, 8
	call DumpRegs 		; Display registers
	exit
main ENDP
END main