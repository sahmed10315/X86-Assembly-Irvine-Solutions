TITLE Exercise 1 from chapter 4

; Author : Saad Ahmed

INCLUDE Irvine32.inc

.code
main PROC

	mov eax, 0
	mov al, 0FFh
	add al, 1
	call DumpRegs 		; Display registers

	mov eax, 1
	sub eax, 2
	call DumpRegs 		; Display registers
	
	
	add eax, 1
	call DumpRegs 		; Display registers
	exit
main ENDP
END main