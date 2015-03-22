[BITS 64]
	global strcasecmp
	section .text

strcasecmp:
	push rbp
	mov rbp, rsp

	jmp start1
to_upper1:
	sub r8b, 32
	jmp start2

to_upper2:
	sub r9b, 32
	jmp compare

start1:
	mov r8b, [rdi]
	mov r9b, [rsi]
	cmp BYTE [rdi], 0
	je end
	cmp  BYTE [rsi], 0
	je end
	cmp r8b, 97
	jl start2
	cmp r8b, 123
	jl to_upper1

start2:
	mov r9b, [rsi]
	cmp r9b, 0
	je end
	cmp r9b, 97
	jl compare
	cmp r9b, 123
	jl to_upper2

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
