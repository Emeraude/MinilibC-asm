[BITS 64]

	global strnbrk
	section .text

strpbrk:
	push rbp
	mov rbp, rsp

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
