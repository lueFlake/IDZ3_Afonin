	.intel_syntax noprefix
	.text
	.p2align 4
	.globl	compute
	.type	compute, @function
compute:
	movapd	xmm7, xmm0 					# xmm7 сооответствует параметру x
	movq	xmm5, QWORD PTR .LC2[rip]
	pxor	xmm8, xmm8
	movsd	xmm6, QWORD PTR .LC3[rip]
	mov	eax, 1 							# eax соответствует i
	movapd	xmm2, xmm8 					# xmm2 соответствует res
	andpd	xmm7, xmm5
	movq	xmm1, QWORD PTR .LC0[rip] 	# xmm1 соответсвут a
	.p2align 4,,10
	.p2align 3
.L2:
	pxor	xmm4, xmm4
	movapd	xmm3, xmm7
	addsd	xmm2, xmm1
	cvtsi2sd	xmm4, eax
	add	eax, 1
	divsd	xmm3, xmm4
	mulsd	xmm1, xmm3
	movapd	xmm3, xmm1
	andpd	xmm3, xmm5
	comisd	xmm3, xmm6
	ja	.L2
	comisd	xmm0, xmm8
	jbe	.L1
	movsd	xmm0, QWORD PTR .LC0[rip]
	divsd	xmm0, xmm2
	movapd	xmm2, xmm0
.L1:
	movapd	xmm0, xmm2
	ret
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	1072693248
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC2:
	.long	-1
	.long	2147483647
	.long	0
	.long	0
	.section	.rodata.cst8
	.align 8
.LC3:
	.long	-2036257893
	.long	1023837339
	