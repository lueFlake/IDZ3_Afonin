	.intel_syntax noprefix
	.text
	.globl	genFloat
	.type	genFloat, @function
genFloat:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	
	movsd	QWORD PTR -24[rbp], xmm0 	# fMin соответствует QWORD PTR -24[rbp] (передача параметров)
	movsd	QWORD PTR -32[rbp], xmm1 	# fMax соответствует QWORD PTR -32[rbp] (передача параметров)
	call	rand@PLT
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, eax
	movsd	xmm1, QWORD PTR .LC0[rip] 
	divsd	xmm0, xmm1
	movsd	QWORD PTR -8[rbp], xmm0 	# f соответствует QWORD PTR -8[rbp] (f = rand() / RAND_MAX)
	movsd	xmm0, QWORD PTR -32[rbp]
	subsd	xmm0, QWORD PTR -24[rbp]
	mulsd	xmm0, QWORD PTR -8[rbp]
	addsd	xmm0, QWORD PTR -24[rbp]
	movq	rax, xmm0
	movq	xmm0, rax
	
	leave
	ret
	
	.section	.rodata
	.align 8
.LC0: 									# RAND_MAX
	.long	-4194304
	.long	1105199103
