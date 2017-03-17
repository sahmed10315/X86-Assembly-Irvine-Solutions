TITLE Chapter 6 Exercise 6               

TRUE  = 1
FALSE = 0

.data
gradeAverage  SDWORD ?
credits       DWORD ?
OkToRegister  BYTE ?
str0 BYTE "*** College Registration Program ***",
	       0dh,0ah,0dh,0ah,0
str1 BYTE "Error: Credits must be between 1 and 30",0dh,0ah,0
str2 BYTE "Input the grade average (0 to quit): ",0
str3 BYTE "Input credits (0 to quit): ",0
str4 BYTE "Error: Grade average must be between 1 and 400",0dh,0ah,0
str5 BYTE "The student can register",0dh,0ah,0
str6 BYTE "The student cannot register",0dh,0ah,0

.code
main PROC

	call Clrscr
	mov  edx,OFFSET str0
	call WriteString

L1:	call InputAverageAndCredits
	jz   ExitMain		; exit if ZF = 1
	call CheckInputRanges
	jc   L4		; errors: try again
	call CheckRegistration

; Indicate whether or not the student can register
	cmp  OkToRegister,TRUE
	jne  L2
	mov  edx,OFFSET str5	; "Student cannot register"
	jmp  L3

L2:	mov  edx,OFFSET str6	; "Student can register"
L3:	call WriteString

L4:	call Crlf
	jmp  L1	; input more values

ExitMain:
	call Clrscr
	exit
main ENDP

InputAverageAndCredits PROC
	pushad

; input the grade average
	mov  edx,OFFSET str2
	call WriteString
	call ReadInt
	cmp  eax,0		; user wants to quit?
	je   Exit_proc		; if so, exit now
	mov  gradeAverage,eax		; else set grade average
	call Crlf

; input the number of credits
	mov  edx,OFFSET str3
	call WriteString
	call ReadInt
	cmp  eax,0		; user wants to quit?
	je   Exit_proc		; if so, exit now
	mov  credits,eax		; else set credits
	call Crlf

Exit_proc:
	popad
	ret
InputAverageAndCredits ENDP

CheckInputRanges PROC
	push edx

	cmp credits,1	; Credits < 1?
	jl  CreditsErr
	cmp credits,30	; Credits > 30?
	jg  CreditsErr

	cmp gradeAverage,1	; Grade Avg < 1?
	jl  GradeErr
	cmp gradeAverage,400	; Grade Avg > 400?
	jg  GradeErr
	clc	; CF = 0 indicates no error
	jmp quit

CreditsErr:	; Credits out of range
	mov edx,OFFSET str1
	call WriteString
	stc	; CF=1 indicates error
	jmp  quit

GradeErr:
	mov edx,OFFSET str4
	call WriteString
	stc	; CF=1 indicates error
	jmp  quit

quit:
	pop edx
	ret
CheckInputRanges ENDP

CheckRegistration PROC
	push edx
	mov OkToRegister,FALSE

; Evaluate gradeAverage and credits, using the logic
; found in Section 6.7.2.2
L1:	cmp gradeAverage,350	; if gradeAverage > 350
	jng L2
	mov OkToRegister,TRUE	; OkToRegister = TRUE
	jmp L4

L2:	cmp gradeAverage,250	; elseif gradeAverage > 250
	jng L3
	cmp credits,16	;   && credits <= 16
	jnbe L3
	mov OkToRegister,TRUE	; OKToRegister = TRUE
	jmp L4

L3:	cmp credits,12	; elseif credits <= 12
	ja  L4
	mov OkToRegister,TRUE	; OKToRegister = TRUE

L4:	pop edx
	ret
CheckRegistration ENDP

END main