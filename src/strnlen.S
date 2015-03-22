[BITS 64]

	global strnlen 		; size_t strlen(char const *s)
	section .text

strnlen:
	push rbp
	mov rbp, rsp

	xor rcx, rcx
loop:
	cmp BYTE [rdi + rcx], 0
	jz end
	cmp rcx, rsi
	jz end
	inc rcx
	jmp loop

end:
	mov rax, rcx

	mov rsp, rbp
	pop rbp
	ret
