	.file	"genFloat.c"
	.intel_syntax noprefix
	.text
	.globl	genFloat
	.type	genFloat, @function
genFloat:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	movsd	QWORD PTR -24[rbp], xmm0
	movsd	QWORD PTR -32[rbp], xmm1
	call	rand@PLT
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, eax
	movsd	xmm1, QWORD PTR .LC0[rip]
	divsd	xmm0, xmm1
	movsd	QWORD PTR -8[rbp], xmm0
	movsd	xmm0, QWORD PTR -32[rbp]
	subsd	xmm0, QWORD PTR -24[rbp]
	mulsd	xmm0, QWORD PTR -8[rbp]
	addsd	xmm0, QWORD PTR -24[rbp]
	movq	rax, xmm0
	movq	xmm0, rax
	leave
	ret
	.size	genFloat, .-genFloat
	.section	.rodata
	.align 8
.LC0:
	.long	-4194304
	.long	1105199103
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
