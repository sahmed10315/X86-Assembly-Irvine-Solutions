TITLE Chapter 5 ex 4

INCLUDE Irvine32.inc

.data
str1 BYTE "Enter integer:  ",0
str2 BYTE "The sum is:           ",0
val1 SDWORD ?
val2 SDWORD ?
sum SDWORD ?

.code
main PROC

	call ClrScr
	
	mov  ecx,3
	mov  sum,0
	
	L1: 
		mov  dh,30
		mov  dl,40
		
		call Gotoxy
		
		mov  edx,OFFSET str1
		call WriteString
		call ReadInt
		add  sum,eax
	loop L1
	 
		mov  dh,40
		mov  dl,40
		
		call Gotoxy
		mov  edx,OFFSET str2
		mov eax, sum
		call WriteString
		call WriteInt
		call Crlf
	
	exit
main ENDP
END main