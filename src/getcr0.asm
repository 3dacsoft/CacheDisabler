org 100h 
[MAP all bootsect.map]
section .text 

start:
	mov eax, cr0			;read cr0 to eax

	mov si, msg_cd
	call DISPLAY_MSG
	mov edx, eax
	and edx, 0x4000000
	cmp edx, 0x4000000
	je CD_ON
	mov si, msg_off
	call DISPLAY_MSG
	jmp READ_NW
CD_ON:
	mov si, msg_on
	call DISPLAY_MSG
;READ_NW:
	;mov si, msg_nw
	;call DISPLAY_MSG
	
;	mov edx, eax
	;and edx, 0x20000000
	;cmp edx, 0x20000000
	;je NW_ON
	;mov si, msg_off
	;call DISPLAY_MSG
	;jmp DONE
;NW_ON:
	;mov si, msg_on
	;call DISPLAY_MSG

DONE:
	ret
	
DISPLAY_OFF:
	mov si, msg_off
	call DISPLAY_MSG
	ret
DISPLAY_ON:
	mov si, msg_on
	call DISPLAY_MSG
	ret
	
DISPLAY_MSG:
	mov		AH, 0Eh			;teletype output
	mov		BH, 00h			;page
	mov		BL, 06h			;screen attributes
NEXT_CHAR:
	lodsb					;get char of message
	cmp		AL, 00h			;end of message?
	je		DONE
	mov		CX, 1
	int		10h				;to the display
	jmp		NEXT_CHAR		;repeat
	ret
	
section .data 
	msg_cd		db	'Cache Disable: ',0
	msg_nw		db	'Not Write Through: ',0
	msg_off		db	'OFF',10,13,0
	msg_on		db	'ON',10,13,0
	
;section .bss 
        ; put uninitialized data here
		
