TITLE Chapter 8 Exercise 4              (ch08_04.asm)
 
INCLUDE Irvine32.inc

NumberOfTimes = 00000FFFh	; number of times (squared) to calculate the factorial
TestNumber = 12	; calculate the factorial of this number

.data
msgIterative BYTE "The running time of the iterative factorial is: ",0
msgRecursive BYTE "The running time of the recursive factorial is: ",0
startingTime DWORD 0

.code
main PROC

	mov ecx, NumberOfTimes	; counter
	call GetMseconds	; get miliseconds since midnight
	mov startingTime, eax	; save starting time
L1:	
	push ecx	; save outer loop counter
	mov ecx, NumberOfTimes	; counter inner loop

	L11:
	  mov eax, TestNumber
	  call FactorialIterative	; iterative factorial
	  loop L11	; next inner loop iteration

	pop ecx	; restore outer loop
	loop L1	; inner loop

	call GetMseconds	; get miliseconds since midnight
	sub eax, startingTime	; get running time
	mov edx, OFFSET msgIterative
	call WriteString
	call WriteDec	; display time
	call Crlf

	mov ecx, NumberOfTimes	; counter
	call GetMseconds	; get miliseconds since midnight
	mov startingTime, eax	; save starting time
L2:
	push ecx	; save outer loop counter
	mov ecx, NumberOfTimes	; counter inner loop
	
	L22:
	  push TestNumber
	  call Factorial	; recursive factorial
	  loop L22	; inner loop

	pop ecx	;restore outer loop counter
	loop L2

	call GetMseconds	; get miliseconds since midnight
	sub eax, startingTime	; get running time
	mov edx, OFFSET msgRecursive
	call WriteString
	call WriteDec	; display time
	call Crlf

	exit

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
 
Factorial PROC 

	push ebp	; save stack base pointer
	mov  ebp, esp
	mov  eax, [ebp+8]	; get n
	cmp  eax, 0	; is n < 0?
	ja   L1	; yes: continue
	mov  eax, 1	; no: return 1
	jmp  L2

L1: dec  eax
	push eax	; Factorial(n-1)
	call Factorial

; Instructions from this point on execute when each
; recursive call returns.

ReturnFact:
	mov  ebx, [ebp+8]	; get n
	mul  ebx	; ax = ax * bx

L2: pop  ebp	; return EAX
	ret  4	; clean up stack

Factorial ENDP

END main