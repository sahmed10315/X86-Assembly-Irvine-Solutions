TITLE Chapter 8 Exercise 3         
INCLUDE Irvine32.inc

.data
msgInput BYTE "Enter the value of n to calculate " 
	BYTE "the factorial (-1 to quit): ",0
msgOutput BYTE "The factorial is: ",0

.code
main PROC

L1:
	mov edx, OFFSET msgInput	; message to display
	call WriteString
	call ReadInt	; get an integer from the user
	call Crlf
	cmp eax, 0	; is n less than 0
	jl quit
	
	mov edx, OFFSET msgOutput
	call WriteString
	call FactorialIterative	; EAX = factorial(n)
	call WriteDec	; display factorial
	call Crlf
	call Crlf

	loop L1

	quit: exit

main ENDP
 
FactorialIterative PROC USES ecx edx 
.data
factorialError  BYTE "Error: Result does not fit "
	BYTE "in 32 bits: Factorial of ",0
.code

	.IF eax == 0 || eax == 1	; special cases
	  mov eax, 1	; factorial == 1
	  jmp end_factorial	; quit procedure
	.ELSEIF eax > 12	; n is too large
	  mov edx, OFFSET factorialError
	  call WriteString
	  jmp end_factorial	; quit procedure
	.ENDIF

	mov ecx, eax	; ecx = counter

Factorial_loop:

	dec ecx	; ecx = n - 1
	mul ecx	; eax = n * (n - 1) 

	cmp ecx, 1	; is counter > 1?
	ja Factorial_loop	; if true, keep looping

	end_factorial:
	ret

FactorialIterative ENDP

END main