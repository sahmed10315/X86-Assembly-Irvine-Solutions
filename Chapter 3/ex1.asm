TITLE Subtract three integers

; This program subtracts 32-bit integers.

INCLUDE Irvine32.inc

.code
main PROC

    mov eax, 0h
    mov ax, 100h
    sub ax, 50h
    sub ax, 20h

    call DumpRegs ; Display registers

	exit
main ENDP
END main