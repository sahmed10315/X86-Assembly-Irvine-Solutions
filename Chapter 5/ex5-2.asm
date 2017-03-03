INCLUDE Irvine32.inc

.data
fileHandle DWORD ?
fileName BYTE "fibonacci.txt", 0
arrSize = 47
myArray DWORD arrSize DUP(?)

.code
main PROC
    call Clrscr

    ;Create the file
    mov edx, OFFSET fileName
    call CreateOutputFile
    mov fileHandle, eax

    ;Call array process
    mov esi, OFFSET myArray
    mov ecx, arrSize
    call FibSeries

    ;Write array
    mov eax, fileHandle
    mov edx, OFFSET myArray
    mov ecx, SIZEOF myArray
    call WriteToFile

    ;close
    mov eax, fileHandle
    call CloseFile

    exit
main ENDP

FibSeries PROC USES eax ebx ecx
;--------------------------------
;Generates fibonnaci sequence and stores in array
;Recieves: ESI points to the array, ECX is the number of values
;Returns: Nothing
;--------------------------------

    ;Set starting values
    mov eax, 1
    mov ebx, 0
L1:
    ;Add the second number to the first
    add eax, ebx
    call WriteDec
    call CrlF

    ;Move value to array, increment esi, exchange values
    mov [esi], eax
    add esi, TYPE myArray
    xchg eax, ebx
loop L1

ret
FibSeries ENDP
END main