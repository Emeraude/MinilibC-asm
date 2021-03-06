[BITS 64]

	global memcpy 		; void *memcpy(void *dest, void const *src, size_t n)
	section .text

memcpy:
	push rbp
	mov rbp, rsp

	xor rcx, rcx
loop:
	cmp rdx, rcx
	jz end
	mov r8b, [rsi + rcx]
	mov [rdi + rcx], r8b
	inc rcx
	jmp loop

end:
	mov rax, rdi

	mov rsp, rbp
	pop rbp
	ret
