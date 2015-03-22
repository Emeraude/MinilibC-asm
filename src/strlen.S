[BITS 64]

	global strlen
	section .text

strlen:
	push rbp
	mov rbp, rsp

	xor rcx, rcx
loop:
	cmp BYTE [rdi], 0
	jz end
	inc rcx
	inc rdi
	jmp loop

end:
	mov rax, rcx

	mov rsp, rbp
	pop rbp
	ret
