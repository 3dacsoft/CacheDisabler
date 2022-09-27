global _readCR0

_readCR0:
	mov eax, cr0			;read cr0 to eax
	xor edx, edx
	mov edx, eax
	shr edx, 16
	ret