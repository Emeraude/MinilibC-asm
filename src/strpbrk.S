[BITS 64]

	global strpbrk
	section .text

strpbrk:
	push rbp
	mov rbp, rsp
	jmp loop

start:
	cmp rdi, 0
	je fail
	inc rdi

loop:
	cmp rdi, [rsi]
	je win
	cmp rsi, 0
	je start
	inc rsi


win:
	mov rax, rdi
	jmp end

fail:
	mov rax, 0

end:
	mov rsp, rbp
	pop rbp

	ret
