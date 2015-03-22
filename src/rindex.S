[BITS 64]

	global rindex 		; char *rindex(char const *s, int c)
	global strrchr		; char *strrchr(char const *s, int c)
	section .text

rindex:
strrchr:
	push rbp
	mov rbp, rsp

	xor rcx, rcx
count:
	cmp BYTE [rdi + rcx], 0
	jz loop
	inc rcx
	jmp count

loop:
	cmp [rdi + rcx], sil
	jz found
	cmp rcx, 0
	jz not_found
	dec rcx
	jmp loop

not_found:
	mov rax, 0
	jmp end

found:
	mov rax, rdi
	add rax, rcx

end:
	mov rsp, rbp
	pop rbp
	ret
