[BITS 64]

	global strcspn
	section .text

strcspn:
	push rbp
	mov rbp, rsp

	xor rcx, rcx
	mov rdx, rdi
	jmp loop

second_loop:
	cmp BYTE [r8], 0
	je continue
	mov al, [rdx]
	cmp [r8], al
	je end
	inc r8
	jmp second_loop

loop:
	cmp BYTE [rdx], 0
	je end
	mov r8, rsi
	jmp second_loop
continue:
	inc rcx
	inc rdx
	jmp loop

end:
	mov rax, rcx

	mov rsp, rbp
	pop rbp
	ret
