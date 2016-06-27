Title Exercise 4 from Irvine x86 books

; Author : Saad Ahmed

Include Irvine32.inc

example EQU <"This is an example", 0>
secondexample TEXTEQU <"This is second example", 0>

.data 
string BYTE example
string2 BYTE secondexample

.code
main PROC

	exit
main ENDP

END MAIN