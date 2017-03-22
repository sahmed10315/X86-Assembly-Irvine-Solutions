TITLE Chapter 10 Exercise 2           

INCLUDE Irvine32.inc

mWritestringAttr MACRO aString,color
	push eax
	push edx
	mov  eax,color
	call SetTextColor
	mov  edx,OFFSET aString
	call WriteString
	pop  edx
	pop  eax
ENDM

.data
myString BYTE "This string is in color",0

.code
main PROC
 
	mWritestringAttr myString, (white * 16) + blue
	call Crlf
     
	mWritestringAttr myString, (blue * 16) + white
	call Crlf

	mov eax,lightGray		; normal screen color
	call SetTextColor

	exit
main ENDP
END main