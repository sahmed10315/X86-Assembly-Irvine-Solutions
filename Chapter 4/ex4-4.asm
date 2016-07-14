TITLE Exercise 4 from chapter 4

; Author : Saad Ahmed

INCLUDE Irvine32.inc

.code
main PROC

	mov eax, 0
	mov al, 255
	add al, 1
	call DumpRegs 		; Display registers

	mov al, 127
	add al, 1
	call DumpRegs 		; Display registers

	exit
main ENDP
END main