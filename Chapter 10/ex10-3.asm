TITLE Chapter 10 Exercise 3         
INCLUDE Irvine32.inc

mMove32 MACRO destination,source
	push eax
	mov eax,source
	mov destination,eax
	pop eax
ENDM

.data
var1 DWORD 12345678h
var2 DWORD 0

.code
main PROC

	mMove32 var2,var1
	mov eax,var2
	call DumpRegs

	exit
main ENDP
END main