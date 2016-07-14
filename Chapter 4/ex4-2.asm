TITLE Exercise 2 from chapter 4

; Author : Saad Ahmed

INCLUDE Irvine32.inc

.code
main PROC

	mov eax, 0FFFFFFFFh
	inc eax
	call DumpRegs 		; Display registers
	exit
main ENDP
END main