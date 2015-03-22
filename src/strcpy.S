[BITS 64]

	global strcpy
	section .text

strcpy:
	push rbp
	mov rbp, rsp

	xor rcx, rcx
loop:
	cmp BYTE [rsi + rcx], 0
	je end
	mov al, [rsi + rcx]
	mov [rdi + rcx], al
	inc rcx
	jmp loop

end:
	mov BYTE [rdi + rcx], 0
	mov rax, rdi

	mov rsp, rbp
	pop rbp
	ret
