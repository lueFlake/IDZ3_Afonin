	.file	"main.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"r"
.LC1:
	.string	"w"
.LC2:
	.string	"Failed to open file %s\n"
.LC3:
	.string	"%lf"
.LC4:
	.string	"Failed to read file %s\n"
.LC5:
	.string	"%.10e\n"
.LC6:
	.string	"time: %ld ms\n"
.LC9:
	.string	"test no.%d:\n\n in: %f\n\n "
.LC10:
	.string	"out: %f\n\n"
	.align 8
.LC11:
	.string	"total random testing time: %ld ms"
	.text
	.globl	main
	.type	main, @function
main:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 96
	mov	DWORD PTR -84[rbp], edi
	mov	QWORD PTR -96[rbp], rsi
	mov	edi, 0
	call	time@PLT
	mov	edi, eax
	call	srand@PLT
	mov	QWORD PTR -8[rbp], 0
	mov	DWORD PTR -32[rbp], 0
	mov	rax, QWORD PTR stdin[rip]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR stdout[rip]
	mov	QWORD PTR -24[rbp], rax
	mov	BYTE PTR -33[rbp], 0
	cmp	DWORD PTR -84[rbp], 3
	jne	.L2
	mov	rax, QWORD PTR -96[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	movzx	eax, BYTE PTR [rax]
	cmp	al, 37
	je	.L3
	mov	rax, QWORD PTR -96[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC0[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -16[rbp], rax
	jmp	.L4
.L3:
	mov	BYTE PTR -33[rbp], 1
.L4:
	mov	rax, QWORD PTR -96[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC1[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -24[rbp], rax
.L2:
	cmp	QWORD PTR -16[rbp], 0
	jne	.L5
	mov	rax, QWORD PTR -96[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	rsi, rax
	lea	rax, .LC2[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, 0
	jmp	.L12
.L5:
	cmp	QWORD PTR -16[rbp], 0
	je	.L7
	lea	rdx, -80[rbp]
	mov	rax, QWORD PTR -16[rbp]
	lea	rcx, .LC3[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	mov	DWORD PTR -68[rbp], eax
	cmp	DWORD PTR -68[rbp], 0
	jne	.L8
	mov	rax, QWORD PTR -96[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	rsi, rax
	lea	rax, .LC4[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, 0
	jmp	.L12
.L8:
	call	clock@PLT
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR -80[rbp]
	movq	xmm0, rax
	call	compute@PLT
	movq	rax, xmm0
	mov	QWORD PTR -56[rbp], rax
	call	clock@PLT
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR -56[rbp]
	movq	xmm0, rax
	lea	rax, .LC5[rip]
	mov	rdi, rax
	mov	eax, 1
	call	printf@PLT
	mov	rdx, QWORD PTR -56[rbp]
	mov	rax, QWORD PTR -24[rbp]
	movq	xmm0, rdx
	lea	rdx, .LC5[rip]
	mov	rsi, rdx
	mov	rdi, rax
	mov	eax, 1
	call	fprintf@PLT
	mov	rax, QWORD PTR -64[rbp]
	sub	rax, QWORD PTR -48[rbp]
	mov	rdx, rax
	mov	rax, QWORD PTR -24[rbp]
	lea	rcx, .LC6[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
	jmp	.L9
.L7:
	mov	DWORD PTR -28[rbp], 0
	jmp	.L10
.L11:
	movsd	xmm0, QWORD PTR .LC7[rip]
	mov	rax, QWORD PTR .LC8[rip]
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	genFloat@PLT
	movq	rax, xmm0
	mov	QWORD PTR -80[rbp], rax
	mov	rcx, QWORD PTR -80[rbp]
	mov	edx, DWORD PTR -28[rbp]
	mov	rax, QWORD PTR -24[rbp]
	movq	xmm0, rcx
	lea	rcx, .LC9[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 1
	call	fprintf@PLT
	call	clock@PLT
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR -80[rbp]
	movq	xmm0, rax
	call	compute@PLT
	movq	rax, xmm0
	mov	QWORD PTR -56[rbp], rax
	call	clock@PLT
	mov	QWORD PTR -64[rbp], rax
	mov	rdx, QWORD PTR -56[rbp]
	mov	rax, QWORD PTR -24[rbp]
	movq	xmm0, rdx
	lea	rdx, .LC10[rip]
	mov	rsi, rdx
	mov	rdi, rax
	mov	eax, 1
	call	fprintf@PLT
	mov	rax, QWORD PTR -64[rbp]
	sub	rax, QWORD PTR -48[rbp]
	add	QWORD PTR -8[rbp], rax
	add	DWORD PTR -28[rbp], 1
.L10:
	cmp	DWORD PTR -28[rbp], 99999
	jle	.L11
	mov	rdx, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR -24[rbp]
	lea	rcx, .LC11[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
.L9:
	mov	eax, 0
.L12:
	leave
	ret
	.size	main, .-main
	.section	.rodata
	.align 8
.LC7:
	.long	0
	.long	1079574528
	.align 8
.LC8:
	.long	0
	.long	-1067909120
	.ident	"GCC: (Ubuntu 11.2.0-19ubuntu1) 11.2.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
