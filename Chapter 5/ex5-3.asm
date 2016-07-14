TITLE Chapter 5 ex 3

INCLUDE Irvine32.inc

.data
str1 BYTE "Enter first integer:  ",0
str2 BYTE "Enter second integer: ",0
str3 BYTE "The sum is:           ",0
val1 SDWORD ?
val2 SDWORD ?

.code
main PROC

	call ClrScr
	
	mov  dh,30
	mov  dl,40
	
	call Gotoxy
	
	mov  edx,OFFSET str1
	call WriteString
	call ReadInt
	mov  val1,eax
	mov  dh,35
	mov  dl,40
	
	call Gotoxy
	mov  edx,OFFSET str2
	call WriteString
	call ReadInt

	add  eax,val1
	mov  dh,40
	mov  dl,40
	
	call Gotoxy
	mov  edx,OFFSET str3
	call WriteString
	call WriteInt
	call Crlf
	
	exit
main ENDP
END main