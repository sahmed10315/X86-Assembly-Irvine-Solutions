TITLE Exercise 5 from chapter 4

; Author : Saad Ahmed

INCLUDE Irvine32.inc

.data
Uarray WORD 1000h, 2000h, 3000h, 4000h
Sarray SWORD -1,-2,-3,-4

.code
main PROC

	movzx EAX, Uarray
	movzx EBX, [Uarray + TYPE Uarray]
	movzx ECX, [Uarray + 2 * TYPE Uarray]
	movzx EDX, [Uarray + 3 * TYPE Uarray]
	call DumpRegs 		; Display registers
	
	
	movsx EAX, Sarray
	movsx EBX, [Sarray + TYPE Sarray]
	movsx ECX, [Sarray + 2 * TYPE Sarray]
	movsx EDX, [Sarray + 3 * TYPE Sarray]
	call DumpRegs 		; Display registers

	exit
main ENDP
END main