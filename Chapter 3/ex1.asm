TITLE Subtract three integers

; This program subtracts 32-bit integers.

INCLUDE Irvine32.inc
.code
main PROC

	mov eax, 0h
	mov ax, 100h		; EAX = 10000h

	sub ax, 50h         ; EAX = 50000h

	sub ax, 20h         ; EAX = 30000h
	call DumpRegs 		; Display registers

	exit
main ENDP
END main