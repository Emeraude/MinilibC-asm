[BITS 64]

	global strchr 		; char *strchr(char const *s, int c)
	global index		; char *index(char const *s, int c)
	section .text

index:
strchr:
	push rbp
	mov rbp, rsp

	push rdi

loop:
	cmp BYTE [rdi], sil
	jz found
	cmp BYTE [rdi], 0
	jz not_found
	inc rdi
	jmp loop

not_found:
	mov rax, 0
	jmp end

found:	mov rax, rdi

end:
	pop rdi

	mov rsp, rbp
	pop rbp
	ret
