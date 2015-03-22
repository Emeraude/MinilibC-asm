[BITS 64]

	global memset 		; void *memset(void *s, int c, size_t n)
	section .text

memset:
	push rbp
	mov rbp, rsp

	push rdi
	push rdx
	xor rcx, rcx
loop:
	cmp rdx, rcx
	jz end
	mov [rdi], sil
	inc rcx
	inc rdi
	jmp loop

end:
	push rdx
	pop rdi
	mov rax, rdi

	mov rsp, rbp
	pop rbp
	ret
