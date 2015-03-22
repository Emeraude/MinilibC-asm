[BITS 64]

	global memmove 		; void *memmove(void *dest, void const *src, size_t n)
	section .text

memmove:
	push rbp
	mov rbp, rsp

	dec rdx
	mov rax, rdi
	mov r8, rdi
	sub r8, rsi
	cmp r8, 0
	jge overlap_right

overlap_left:
	xor rcx, rcx
loop_left:

	cmp rcx, rdx
	je end

	mov r8b, [rsi + rcx]
	mov [rdi + rcx], r8b
	inc rcx
	jmp loop_left

overlap_right:
	cmp rdx, 0
	jl end
	mov r8b, [rsi + rdx]
	mov [rdi + rdx], r8b
	dec rdx
	jmp overlap_right

end:
	mov rax, rdi
	mov rsp, rbp
	pop rbp

	ret
