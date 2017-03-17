TITLE Chapter 6 Exercise 5              

INCLUDE Irvine32.inc

TRUE  = 1
FALSE = 0

.data
gradeAverage  WORD ?
credits       WORD ?
OkToRegister  BYTE ?

str1 BYTE "Error: Credits must be between 1 and 30",0dh,0ah,0

.code
main PROC

	mov gradeAverage,100	; try different values
	mov credits,12	; try different values
	call CheckRegistration

	movzx eax,OkToRegister	; show boolean result
	call DumpRegs	; for debugging only

	exit
main ENDP
 
CheckRegistration PROC 
	push edx
	mov OkToRegister,FALSE

; Check credits for valid range 1-30
	cmp credits,1	; credits < 1?
	jb  E1
	cmp credits,30	; credits > 30?
	ja  E1
	jmp L1	; credits are ok

; Display error message: credits out of range
E1:	mov edx,OFFSET str1
	call WriteString
	jmp  L4

; Evaluate gradeAverage and credits, using the logic
; found in Section 6.7.2.2
L1:	cmp gradeAverage,350	; if gradeAverage > 350
	jna L2
	mov OkToRegister,TRUE	; OkToRegister = TRUE
	jmp L4

L2:	cmp gradeAverage,250	; elseif gradeAverage > 250
	jna L3
	cmp credits,16	;   && credits <= 16
	jnbe L3
	mov OkToRegister,TRUE	; OKToRegister = TRUE
	jmp L4

L3:	cmp credits,12	; elseif credits <= 12
	ja  L4
	mov OkToRegister,TRUE	; OKToRegister = TRUE

L4:	pop edx	; endif
	ret
CheckRegistration ENDP

END main