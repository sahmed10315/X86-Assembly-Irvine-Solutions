TITLE Chapter 5 ex 1

INCLUDE Irvine32.inc

.data
str1 BYTE "This is a string",0

.code
main PROC

	mov eax, green + (blue * 16)
	
	mov  ecx,4
	
	L1:
		call SetTextColor
		mov edx,OFFSET str1
		call WriteString
		call Crlf
		add  eax,2
	loop L1
	
	exit
main ENDP
END main