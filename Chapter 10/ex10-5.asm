TITLE Chapter 10 Exercise 5                            (ch10_05.asm)
 
INCLUDE Irvine32.inc

mReadInt MACRO intVal
	push eax
	call ReadInt		;; read 32-bit integer
	IF (TYPE intVal) EQ 2		;; store in 16-bit operand?
	  mov intVal,ax
	ELSEIF (TYPE intVal) EQ 4	;; store in 32-bit operand?
	  mov intVal,eax
	ELSE
	  %OUT ************************************************************************
	  ; (The actual value of intVal is substituted into the following message)
	  %OUT Error: Argument intVal passed to mReadInt must be either 16 or 32 bits.
	  %OUT ************************************************************************
	ENDIF
	pop eax
ENDM

.data
wVal SWORD ?
dVal SDWORD ?
str1 BYTE "Input a 16-bit signed integer: ",0
str2 BYTE "Input a 32-bit signed integer: ",0

.code
main PROC

	mReadInt AL		; test the macro's error message

; Input and display a 16-bit signed integer
	mov edx,OFFSET str1
	call WriteString
	mReadInt wVal
	movsx eax,wVal
	call WriteInt
	call Crlf

; Input and display a 32-bit signed integer
	mov edx,OFFSET str2
	call WriteString
	mReadInt dVal
	mov  eax,dVal
	call WriteInt
	call Crlf

	exit
main ENDP
END main