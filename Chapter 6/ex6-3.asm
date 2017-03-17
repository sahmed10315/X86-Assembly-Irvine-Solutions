TITLE Chapter 6 Exercise 3              (ch06_03.asm)
 
INCLUDE Irvine32.inc

.data
str1 BYTE "Enter a score: ",0
str2 BYTE "The letter grade is: ",0

.code
main PROC 
	mov  edx,OFFSET str1	; input score from user
	call WriteString
	call ReadInt
	call Crlf

	.IF eax >= 90	 
	  mov al,'A'	 
	.ELSEIF eax >= 80
	  mov al,'B'
	.ELSEIF eax >= 70
	  mov al,'C'
	.ELSEIF eax >= 60
	  mov al,'D'
	.ELSE
	  mov al,'F'
	.ENDIF

	mov edx,OFFSET str2
	call WriteString
	call WriteChar	

	exit
main ENDP
END main