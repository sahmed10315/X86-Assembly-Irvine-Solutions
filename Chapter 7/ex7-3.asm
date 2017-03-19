TITLE Chapter 7 Exercise 3                             
INCLUDE Irvine32.inc

.data
time WORD 0001001000000111b	; 02:16:07

.code
main PROC
	call Clrscr

	mov  ax, time	; AX = time in MS-DOS format
	call ShowFileTime

	exit
main ENDP
 
ShowFileTime PROC 
	push ebx
	push edx

	and eax,0FFFFh	; clear upper half of EAX
	mov bx,ax	; BX = a copy of the file time
	shr ax,11	; shift hour to the right
	cmp ax,10	; is the hour >= 10?
	jae L1	; yes: display it
	call DisplayZero	; no: display a leading zero

L1:	call WriteDec	; display the hour

	mov al,':'	; display a ":"
	call WriteChar

	mov ax,bx	; AX = file time
	shr ax,5	; shift minutes to the right
	and ax,0000000000111111b	; discard bits other than minutes
	cmp ax,10	; minutes >= 10?
	jae L2	; yes: display them now
	call DisplayZero	; no: display a leading zero

L2:	call WriteDec	; display the minutes

	mov al, ':'	; display a ":"
	call WriteChar

	mov ax,bx	; AX = file time
	and ax,0000000000001111b	; discard bits other than seconds
	cmp ax,10	; seconds >= 10?
	jae L3	; yes: display them now
	call DisplayZero	; no: display a leading zero

L3:	call WriteDec	; display seconds
	call Crlf

	pop edx
	pop ebx
	ret
ShowFileTime ENDP
 
DisplayZero PROC 
	push eax

	mov al,'0'	; char to display
	call WriteChar

	pop eax
	ret
DisplayZero ENDP

END main