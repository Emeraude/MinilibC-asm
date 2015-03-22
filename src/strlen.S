[BITS 64]

	global strlen 		; size_t strlen(char const *s)
	section .text

strlen:
	push rbp
	mov rbp, rsp

	xor rcx, rcx
loop:
	cmp BYTE [rdi + rcx], 0
	jz end
	inc rcx
	jmp loop

end:
	mov rax, rcx

	mov rsp, rbp
	pop rbp
	ret
