[BITS 64]

	global memmove 		; void *memmove(void *dest, void const *src, size_t n)
	section .text

memmove:
	push rbp
	mov rbp, rsp

	xor rcx, rcx
loop:
	cmp rcx, rdx
	je end
	mov [rdi + rcx], [rsi + rcx]
	inc rcx
	jmp loop

end:
	mov rax, rdi

	mov rsp, rbp
	pop rbp
	ret
