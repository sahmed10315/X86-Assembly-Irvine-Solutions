TITLE Chapter 6 Exercise 1

INCLUDE Irvine32.inc

.data
intArray SWORD 0, 0, 0, 0, 7, 20, 35, -12
noneMsg BYTE "A non zero value was not found", 0

.code
main PROC
    mov ebx, OFFSET intArray - 2
    mov ecx, LENGTHOF intArray

    L1:
	   add ebx, 2
	   cmp WORD PTR [ebx], 0	   
	loopz L1

     jz notfound

    movsx eax, WORD PTR[ebx]
    call WriteInt
    jmp quit

    notFound: ; display "not found" message
    mov edx, OFFSET noneMsg
    call WriteString

    quit:
    call crlf
    exit
main ENDP
END main