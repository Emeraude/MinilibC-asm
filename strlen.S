[BITS 64]

	global strlen
	section .text

strlen:
	push rbp
	mov rbp, rsp

	;; mov rcx, rcx

loop:
	inc rcx
	inc rdi
	cmp BYTE [rdi], 0
	jnz loop

end:
	mov rsp, rbp
	pop rbp

	mov rax, rcx
	ret
