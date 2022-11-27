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
	push	rbp
	mov	rbp, rsp
	sub	rsp, 96

	mov	DWORD PTR -84[rbp], edi		# argc соответствует DWORD PTR -84[rbp] (передача параметров)
	mov	QWORD PTR -96[rbp], rsi		# argv соответствует QWORD PTR -96[rbp] (передача параметров)

	mov	edi, 0
	call	time@PLT
	mov	edi, eax
	call	srand@PLT

	mov	QWORD PTR -8[rbp], 0 		# total соответствует QWORD PTR -8[rbp]
	mov	rax, QWORD PTR stdin[rip]
	mov	QWORD PTR -16[rbp], rax 	# ifs соответствует QWORD PTR -16[rbp]
	mov	rax, QWORD PTR stdout[rip]
	mov	QWORD PTR -40[rbp], rax 	# ofs соответствует QWORD PTR -40[rbp]
	mov	BYTE PTR -17[rbp], 0 		# isRandom соответствует BYTE PTR -17[rbp]

	
	cmp	DWORD PTR -84[rbp], 3
	jne	.L2
	mov	rax, QWORD PTR -96[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	movzx	eax, BYTE PTR [rax]
	
	# fopen(rdi = argv[1], rsi = "r")
	cmp	al, 37
	je	.L3
	mov	rax, QWORD PTR -96[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC0[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT

	mov	QWORD PTR -16[rbp], rax 	# ifs = fopen
	jmp	.L4
.L3:
	mov	BYTE PTR -17[rbp], 1
.L4:

	# fopen(rdi = argv[2], rsi = "w")
	mov	rax, QWORD PTR -96[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC1[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	
	mov	QWORD PTR -40[rbp], rax 	# ofs = fopen
	
	cmp	QWORD PTR -16[rbp], 0
	jne	.L7
	jmp	.L15
.L2:
	#printf(rdi = "Wrong no. of arguments")
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

	# fscanf(rdi = ifs, rsi = "%lf", rcx = &x)
	lea	rdx, -80[rbp] 				 # x соответствует QWORD PTR -80[rbp]
	mov	rax, QWORD PTR -16[rbp]
	lea	rcx, .LC4[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	mov	DWORD PTR -68[rbp], eax 	# success соответствует DWORD PTR -68[rbp] (success = fscanf)

	cmp	DWORD PTR -68[rbp], 0
	jne	.L9
	
	# printf(rdi = "Failed to read file %s\n", rsi = argv[1])
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
	mov	QWORD PTR -48[rbp], rax 	# start соответствует QWORD PTR -48[rbp] (start = clock())

	# compute(xmm0 = x)
	mov	rax, QWORD PTR -80[rbp]	
	movq	xmm0, rax
	call	compute@PLT
	movq	rax, xmm0
	mov	QWORD PTR -56[rbp], rax 	# res соответствует QWORD PTR -56[rbp]

	call	clock@PLT
	mov	QWORD PTR -64[rbp], rax 	# end соответствует QWORD PTR -48[rbp] (x = clock())

	# printf("%.10e\n", res)
	mov	rax, QWORD PTR -56[rbp]
	movq	xmm0, rax
	lea	rax, .LC6[rip]
	mov	rdi, rax
	mov	eax, 1
	call	printf@PLT

	# fprintf(ofs, "%.10e\n", res)
	mov	rdx, QWORD PTR -56[rbp]
	mov	rax, QWORD PTR -40[rbp]
	movq	xmm0, rdx
	lea	rdx, .LC6[rip]
	mov	rsi, rdx
	mov	rdi, rax
	mov	eax, 1
	call	fprintf@PLT
	
	# fprintf(ofs, "time: %ld ms\n", finish - start)
	mov	rax, QWORD PTR -64[rbp]
	sub	rax, QWORD PTR -48[rbp]
	mov	rdx, rax
	mov	rax, QWORD PTR -40[rbp]
	lea	rcx, .LC7[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
	
	jmp	.L10
.L8:
	mov	DWORD PTR -24[rbp], 0 		# i соответствует DWORD PTR -24[rbp]
	jmp	.L11
.L13:
	movsd	xmm0, QWORD PTR .LC8[rip]
	mov	rax, QWORD PTR .LC9[rip]
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	genFloat@PLT
	movq	rax, xmm0
	mov	QWORD PTR -80[rbp], rax

	call	clock@PLT
	mov	QWORD PTR -48[rbp], rax 	# start соответствует QWORD PTR -48[rbp] (start = clock())

	# compute(xmm0 = x)
	mov	rax, QWORD PTR -80[rbp]	
	movq	xmm0, rax
	call	compute@PLT
	movq	rax, xmm0
	mov	QWORD PTR -56[rbp], rax 	# res соответствует QWORD PTR -56[rbp]

	call	clock@PLT
	mov	QWORD PTR -64[rbp], rax 	# end соответствует QWORD PTR -48[rbp] (x = clock())

	cmp	DWORD PTR -24[rbp], 99
	jg	.L12

	# fprintf(ofs, "test no.%d:\n\n in: %f\n\n ", i, x)
	mov	rcx, QWORD PTR -80[rbp]
	mov	edx, DWORD PTR -24[rbp]
	mov	rax, QWORD PTR -40[rbp]
	movq	xmm0, rcx
	lea	rcx, .LC10[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 1
	call	fprintf@PLT
	
	# printf(ofs, "out: %.10e\n\n", res)
	mov	rdx, QWORD PTR -56[rbp]
	mov	rax, QWORD PTR -40[rbp]
	movq	xmm0, rdx
	lea	rdx, .LC11[rip]
	mov	rsi, rdx
	mov	rdi, rax
	mov	eax, 1
	call	fprintf@PLT

.L12:
	mov	rax, QWORD PTR -64[rbp]
	sub	rax, QWORD PTR -48[rbp]
	add	QWORD PTR -8[rbp], rax
	add	DWORD PTR -24[rbp], 1
.L11:

	# fprintf(ofs, "total random testing time: %ld ms", total)
	cmp	DWORD PTR -24[rbp], 999999
	jle	.L13
	mov	rdx, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR -40[rbp]
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
	
	.section	.rodata
	
	.align 8
.LC8:
	.long	0
	.long	1080623104

	.align 8
.LC9:
	.long	0
	.long	-1066860544
