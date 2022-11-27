	.intel_syntax noprefix
	.text
	.globl	compute
	.type	compute, @function
compute:
	push	rbp
	mov	rbp, rsp
	
	movsd	QWORD PTR -40[rbp], xmm0 	# x соответствует QWORD PTR -40[rbp] (передача параметров)
	pxor	xmm0, xmm0
	movsd	QWORD PTR -8[rbp], xmm0 	# res соответствует QWORD PTR -8[rbp]
	movsd	xmm0, QWORD PTR .LC1[rip]
	movsd	QWORD PTR -16[rbp], xmm0 	# a соответствует QWORD PTR -16[rbp]
	mov	DWORD PTR -20[rbp], 1 			# i соответствует DWORD PTR -20[rbp]

	jmp	.L2
.L3:
	movsd	xmm0, QWORD PTR -8[rbp]
	addsd	xmm0, QWORD PTR -16[rbp]
	movsd	QWORD PTR -8[rbp], xmm0
	movsd	xmm0, QWORD PTR -40[rbp]
	movq	xmm1, QWORD PTR .LC2[rip]
	andpd	xmm0, xmm1
	pxor	xmm1, xmm1
	cvtsi2sd	xmm1, DWORD PTR -20[rbp]
	divsd	xmm0, xmm1
	movsd	xmm1, QWORD PTR -16[rbp]
	mulsd	xmm0, xmm1
	movsd	QWORD PTR -16[rbp], xmm0
	add	DWORD PTR -20[rbp], 1
.L2:
	movsd	xmm0, QWORD PTR -16[rbp]
	movq	xmm1, QWORD PTR .LC2[rip]
	andpd	xmm0, xmm1
	comisd	xmm0, QWORD PTR .LC3[rip]
	ja	.L3
	movsd	xmm0, QWORD PTR -40[rbp]
	pxor	xmm1, xmm1
	comisd	xmm0, xmm1
	jbe	.L9
	movsd	xmm0, QWORD PTR .LC1[rip]
	divsd	xmm0, QWORD PTR -8[rbp]
	jmp	.L7
.L9:
	movsd	xmm0, QWORD PTR -8[rbp]
.L7:
	movq	rax, xmm0
	movq	xmm0, rax
	
	pop	rbp
	ret
	
	.section	.rodata
	.align 8
.LC1:
	.long	0
	.long	1072693248
	
	.align 16
.LC2:
	.long	-1
	.long	2147483647
	.long	0
	.long	0

	.align 8
.LC3:
	.long	-2036257893
	.long	1023837339
	