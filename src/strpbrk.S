[BITS 64]

	global strpbrk
	section .text

strpbrk:
	push rbp
	mov rbp, rsp

	mov rdx, rdi
	jmp loop

second_loop:
	cmp BYTE [r8], 0
	je continue
	mov al, [rdx]
	cmp [r8], al
	je win
	inc r8
	jmp second_loop

loop:
	cmp BYTE [rdx], 0
	je fail
	mov r8, rsi
	jmp second_loop
continue:
	inc rdx
	jmp loop

win:
	mov rax, rdx
	jmp end

fail:
	mov rax, 0

end:
	mov rsp, rbp
	pop rbp

	ret
