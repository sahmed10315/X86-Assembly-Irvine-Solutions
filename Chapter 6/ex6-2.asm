TITLE Chapter 6 Exercise 2             

INCLUDE Irvine32.inc

.data
op1 SDWORD 10h
op2 SDWORD 20h
op3 SDWORD 30h
X   SDWORD ?

.code
main PROC

	mov eax,op1
	mov ebx,op2
	mov ecx,op3

	.WHILE eax < ebx
	  inc eax
	  .IF ebx == ecx
	    mov X,2
	  .ELSE
	    mov X,3
	  .ENDIF
	.ENDW

	exit
main ENDP
END main