	.file	"main.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"r"
.LC1:
	.string	"w"
.LC2:
	.string	"Wrong no. of arguments"
.LC3:
	.string	"Failed to open file %s\n"
.LC4:
	.string	"%lf"
.LC5:
	.string	"Failed to read file %s\n"
.LC6:
	.string	"%.10e\n"
.LC7:
	.string	"time: %ld ms\n"
.LC10:
	.string	"test no.%d:\n\n in: %f\n\n "
.LC11:
	.string	"out: %.10e\n\n"
	.align 8
.LC12:
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
	mov	rax, QWORD PTR stdin[rip]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR stdout[rip]
	mov	QWORD PTR -32[rbp], rax
	mov	BYTE PTR -17[rbp], 0
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
	mov	BYTE PTR -17[rbp], 1
.L4:
	mov	rax, QWORD PTR -96[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC1[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -32[rbp], rax
	cmp	QWORD PTR -16[rbp], 0
	jne	.L7
	jmp	.L15
.L2:
	lea	rax, .LC2[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	eax, 0
	jmp	.L14
.L15:
	mov	rax, QWORD PTR -96[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	rsi, rax
	lea	rax, .LC3[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, 0
	jmp	.L14
.L7:
	cmp	BYTE PTR -17[rbp], 0
	jne	.L8
	lea	rdx, -72[rbp]
	mov	rax, QWORD PTR -16[rbp]
	lea	rcx, .LC4[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	mov	DWORD PTR -60[rbp], eax
	cmp	DWORD PTR -60[rbp], 0
	jne	.L9
	mov	rax, QWORD PTR -96[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	rsi, rax
	lea	rax, .LC5[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, 0
	jmp	.L14
.L9:
	call	clock@PLT
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -72[rbp]
	movq	xmm0, rax
	call	compute@PLT
	movq	rax, xmm0
	mov	QWORD PTR -48[rbp], rax
	call	clock@PLT
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR -48[rbp]
	movq	xmm0, rax
	lea	rax, .LC6[rip]
	mov	rdi, rax
	mov	eax, 1
	call	printf@PLT
	mov	rdx, QWORD PTR -48[rbp]
	mov	rax, QWORD PTR -32[rbp]
	movq	xmm0, rdx
	lea	rdx, .LC6[rip]
	mov	rsi, rdx
	mov	rdi, rax
	mov	eax, 1
	call	fprintf@PLT
	mov	rax, QWORD PTR -56[rbp]
	sub	rax, QWORD PTR -40[rbp]
	mov	rdx, rax
	mov	rax, QWORD PTR -32[rbp]
	lea	rcx, .LC7[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
	jmp	.L10
.L8:
	mov	DWORD PTR -24[rbp], 0
	jmp	.L11
.L13:
	movsd	xmm0, QWORD PTR .LC8[rip]
	mov	rax, QWORD PTR .LC9[rip]
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	genFloat@PLT
	movq	rax, xmm0
	mov	QWORD PTR -72[rbp], rax
	call	clock@PLT
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -72[rbp]
	movq	xmm0, rax
	call	compute@PLT
	movq	rax, xmm0
	mov	QWORD PTR -48[rbp], rax
	call	clock@PLT
	mov	QWORD PTR -56[rbp], rax
	cmp	DWORD PTR -24[rbp], 99
	jg	.L12
	mov	rcx, QWORD PTR -72[rbp]
	mov	edx, DWORD PTR -24[rbp]
	mov	rax, QWORD PTR -32[rbp]
	movq	xmm0, rcx
	lea	rcx, .LC10[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 1
	call	fprintf@PLT
	mov	rdx, QWORD PTR -48[rbp]
	mov	rax, QWORD PTR -32[rbp]
	movq	xmm0, rdx
	lea	rdx, .LC11[rip]
	mov	rsi, rdx
	mov	rdi, rax
	mov	eax, 1
	call	fprintf@PLT
.L12:
	mov	rax, QWORD PTR -56[rbp]
	sub	rax, QWORD PTR -40[rbp]
	add	QWORD PTR -8[rbp], rax
	add	DWORD PTR -24[rbp], 1
.L11:
	cmp	DWORD PTR -24[rbp], 999999
	jle	.L13
	mov	rdx, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR -32[rbp]
	lea	rcx, .LC12[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
.L10:
	mov	eax, 0
.L14:
	leave
	ret
	.size	main, .-main
	.section	.rodata
	.align 8
.LC8:
	.long	0
	.long	1080623104
	.align 8
.LC9:
	.long	0
	.long	-1066860544
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
