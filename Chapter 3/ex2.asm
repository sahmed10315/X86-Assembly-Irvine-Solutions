Title Exercise 2 from Irvine x86 books

; Author : Saad Ahmed

Include Irvine32.inc
.data
val1 BYTE 'A'
val2 SBYTE -128
string BYTE "TESTING",0
val3 WORD 54335
val4 SWORD -4322
val5 DWORD 12345678h
val6 SDWORD -2147483648
val7 QWORD 123456712345678h
val8 TBYTE 1000000000123456789Ah
val9 REAL4 -1.2
.code
main PROC

	exit
main ENDP

END MAIN