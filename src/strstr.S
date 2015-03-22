[BITS 64]

	global strstr 		; char *strchr(char const *haystack, char const *needle)
	section .text

strstr:
	push rbp
	mov rbp, rsp

	mov rdx, rsi

	jmp loop
start:
	inc rdi
	mov rax, rdi
	mov rsi, rdx

loop:
	mov r8b, [rdi]
	mov r9b, [rsi]
	cmp r9b, 0
	je end
	cmp r8b, 0
	je fail
	cmp r8b, [rsi]
	jne start
	inc rdi
	inc rsi
	jmp loop

fail:
	xor rax, rax
	jmp end

end:
	mov rsp, rbp
	pop rbp
	ret
