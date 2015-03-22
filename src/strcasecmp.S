[BITS 64]
	global strcasecmp
	section .text

strcasecmp:
	push rbp
	mov rbp, rsp

	jmp start1
t_lower1:
	add r8b, 32
	jmp start2

t_lower2:
	add r9b, 32
	jmp compare

start1:
	mov r8b, [rdi]
	cmp r8b, 65
	jl start2
	cmp r8b, 90
	jl t_lower1

start2:
	mov r9b, [rsi]
	cmp r9b, 65
	jl compare
	cmp r9b, 90
	jl t_lower2

compare:
	cmp r8b, r9b
	jne end
	cmp r8b, 0
	je end
	cmp r9b, 0
	je end
	inc rsi
	inc rdi
	jmp start1

end:
	sub r8b, r9b
	movsx rax, r8b

	mov rsp, rbp
	pop rbp

	ret
