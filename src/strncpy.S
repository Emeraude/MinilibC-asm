[BITS 64]

	global strncpy
	section .text

strncpy:
	push rbp
	mov rbp, rsp

	xor rcx, rcx
loop:
	cmp BYTE [rsi + rcx], 0
	je end
	cmp rcx, rdx
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
