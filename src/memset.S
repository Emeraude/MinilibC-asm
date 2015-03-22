[BITS 64]

	global memset 		; void *strchr(void *s, int c, size_t n)
	section .text

memset:
	push rbp
	mov rbp, rsp

	push rdi
	xor rcx, rcx
loop:
	cmp rdx, rcx
	jz end
	mov [rdi], rsi
	inc rcx
	inc rdi
	jmp loop

end:
	pop rdi

	mov rsp, rbp
	pop rbp
	ret
