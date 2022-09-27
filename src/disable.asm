org 100h 

section .text 

start:
	mov eax, cr0
	or eax, 0x40000000
	and eax, 0xDFFFFFFF
	mov cr0, eax
	
	and eax, 0
	mov eax, cr0
	and eax, 60000000h
	cmp eax, 40000000h
	
	jne FAILED	;setting CD flag failed
	
	wbinvd		;setting CD flag worked so write back and flush cache
	mov si, msg_success
	jmp DISPLAY_MSG
	
FAILED:
	mov si, msg_failure

DISPLAY_MSG:
	mov		AH, 0Eh			;teletype output
	mov		BH, 00h			;page
	mov		BL, 06h			;screen attributes
NEXT_CHAR:
	lodsb					;get char of message
	cmp		AL, 00h			;end of message?
	je		MSGDONE
	mov		CX, 1
	int		10h				;to the display
	jmp		NEXT_CHAR		;repeat

MSGDONE:
	ret

section .data 

	msg_success db 'Cache disabled successfully',0
	msg_failure db 'Cache did NOT disable',0

;section .bss 

        ; put uninitialized data here