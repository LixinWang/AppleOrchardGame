	.cpu arm7tdmi
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.arm
	.syntax divided
	.file	"game.c"
	.text
	.align	2
	.global	displayScore
	.type	displayScore, %function
displayScore:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L3
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	ldr	r8, [r3]
	ldr	r3, .L3+4
	ldr	r1, .L3+8
	smull	r2, r3, r8, r3
	smull	r0, r1, r8, r1
	ldr	r2, .L3+12
	smull	r6, r0, r2, r8
	mov	r5, #27
	mov	r4, #35
	mov	lr, #43
	mov	ip, #51
	mov	r2, r8, asr #31
	rsb	r3, r2, r3, asr #6
	rsb	r6, r3, r3, lsl #29
	rsb	r1, r2, r1, asr #5
	rsb	r6, r3, r6, lsl #2
	rsb	r7, r3, r3, lsl #25
	add	r6, r1, r6, lsl #1
	add	r7, r3, r7, lsl #2
	rsb	r7, r3, r7, lsl #3
	rsb	r2, r2, r0, asr #2
	rsb	r0, r6, r6, lsl #29
	add	r2, r2, r7, lsl #2
	rsb	r1, r3, r3, lsl #22
	rsb	r7, r6, r0, lsl #2
	add	r7, r2, r7, lsl #1
	add	r1, r3, r1, lsl #6
	rsb	r2, r6, r6, lsl #25
	add	r1, r3, r1, lsl #1
	add	r2, r6, r2, lsl #2
	add	r0, r8, r1, lsl #3
	rsb	r2, r6, r2, lsl #3
	rsb	r8, r7, r7, lsl #29
	add	r1, r0, r2, lsl #2
	rsb	r2, r7, r8, lsl #2
	add	r2, r1, r2, lsl #1
	add	r2, r2, #288
	ldr	r1, .L3+16
	add	r7, r7, #288
	add	r2, r2, #1
	add	r0, r1, #436
	orr	r2, r2, #24576
	add	r6, r6, #288
	add	r7, r7, #1
	strh	r2, [r0]	@ movhi
	orr	r7, r7, #24576
	add	r2, r1, #428
	add	r3, r3, #288
	add	r6, r6, #1
	strh	r7, [r2]	@ movhi
	orr	r6, r6, #24576
	add	r2, r1, #420
	add	r3, r3, #1
	strh	r6, [r2]	@ movhi
	orr	r3, r3, #24576
	add	r2, r1, #412
	ldr	r0, .L3+20
	strh	r3, [r2]	@ movhi
	add	r3, r1, #400
	ldr	r2, .L3+24
	strh	r0, [r3]	@ movhi
	ldr	r0, .L3+28
	strh	r2, [r3, #2]	@ movhi
	ldr	r3, .L3+32
	add	r2, r1, #404
	add	r6, r1, #408
	strh	r0, [r2]	@ movhi
	add	r0, r1, #416
	add	r2, r1, #424
	add	r1, r1, #432
	strh	r5, [r6, #2]	@ movhi
	strh	r3, [r6]	@ movhi
	strh	r4, [r0, #2]	@ movhi
	strh	lr, [r2, #2]	@ movhi
	strh	r3, [r0]	@ movhi
	strh	r3, [r2]	@ movhi
	strh	r3, [r1]	@ movhi
	strh	ip, [r1, #2]	@ movhi
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bx	lr
.L4:
	.align	2
.L3:
	.word	score
	.word	274877907
	.word	1374389535
	.word	1717986919
	.word	shadowOAM
	.word	16386
	.word	16385
	.word	24932
	.word	-32766
	.size	displayScore, .-displayScore
	.align	2
	.global	displayFinalScore
	.type	displayFinalScore, %function
displayFinalScore:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L7
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	ldr	r8, [r3]
	ldr	r3, .L7+4
	ldr	r1, .L7+8
	smull	r2, r3, r8, r3
	smull	r0, r1, r8, r1
	ldr	r2, .L7+12
	smull	r6, r0, r2, r8
	mov	r5, #112
	mov	r4, #120
	mov	lr, #128
	mov	ip, #136
	mov	r2, r8, asr #31
	rsb	r3, r2, r3, asr #6
	rsb	r6, r3, r3, lsl #29
	rsb	r1, r2, r1, asr #5
	rsb	r6, r3, r6, lsl #2
	rsb	r7, r3, r3, lsl #25
	add	r6, r1, r6, lsl #1
	add	r7, r3, r7, lsl #2
	rsb	r7, r3, r7, lsl #3
	rsb	r2, r2, r0, asr #2
	rsb	r0, r6, r6, lsl #29
	add	r2, r2, r7, lsl #2
	rsb	r1, r3, r3, lsl #22
	rsb	r7, r6, r0, lsl #2
	add	r7, r2, r7, lsl #1
	add	r1, r3, r1, lsl #6
	rsb	r2, r6, r6, lsl #25
	add	r1, r3, r1, lsl #1
	add	r2, r6, r2, lsl #2
	add	r0, r8, r1, lsl #3
	rsb	r2, r6, r2, lsl #3
	rsb	r8, r7, r7, lsl #29
	add	r1, r0, r2, lsl #2
	rsb	r2, r7, r8, lsl #2
	add	r2, r1, r2, lsl #1
	add	r2, r2, #416
	ldr	r1, .L7+16
	add	r7, r7, #416
	add	r2, r2, #1
	add	r0, r1, #436
	orr	r2, r2, #24576
	add	r6, r6, #416
	add	r7, r7, #1
	strh	r2, [r0]	@ movhi
	orr	r7, r7, #24576
	add	r2, r1, #428
	add	r3, r3, #416
	add	r6, r6, #1
	strh	r7, [r2]	@ movhi
	orr	r6, r6, #24576
	add	r2, r1, #420
	add	r3, r3, #1
	strh	r6, [r2]	@ movhi
	orr	r3, r3, #24576
	add	r2, r1, #412
	ldr	r0, .L7+20
	strh	r3, [r2]	@ movhi
	add	r3, r1, #400
	ldr	r2, .L7+24
	strh	r0, [r3]	@ movhi
	ldr	r0, .L7+28
	strh	r2, [r3, #2]	@ movhi
	ldr	r3, .L7+32
	add	r2, r1, #404
	add	r6, r1, #408
	strh	r0, [r2]	@ movhi
	add	r0, r1, #416
	add	r2, r1, #424
	add	r1, r1, #432
	strh	r5, [r6, #2]	@ movhi
	strh	r3, [r6]	@ movhi
	strh	r4, [r0, #2]	@ movhi
	strh	lr, [r2, #2]	@ movhi
	strh	r3, [r0]	@ movhi
	strh	r3, [r2]	@ movhi
	strh	r3, [r1]	@ movhi
	strh	ip, [r1, #2]	@ movhi
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bx	lr
.L8:
	.align	2
.L7:
	.word	score
	.word	274877907
	.word	1374389535
	.word	1717986919
	.word	shadowOAM
	.word	16410
	.word	16470
	.word	25004
	.word	-32742
	.size	displayFinalScore, .-displayFinalScore
	.align	2
	.global	drawLives
	.type	drawLives, %function
drawLives:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	mov	ip, #228
	mov	r4, #220
	ldr	r3, .L11
	ldr	r3, [r3, #24]
	ldr	r2, .L11+4
	add	r3, r3, #288
	add	r3, r3, #1
	add	r5, r2, #652
	ldr	r1, .L11+8
	ldr	lr, .L11+12
	orr	r3, r3, #24576
	add	r0, r2, #640
	strh	r3, [r5]	@ movhi
	add	r3, r2, #648
	add	r2, r2, #644
	strh	r4, [r0, #2]	@ movhi
	strh	lr, [r2]	@ movhi
	strh	r1, [r0]	@ movhi
	strh	r1, [r3]	@ movhi
	strh	ip, [r3, #2]	@ movhi
	ldmfd	sp!, {r4, r5, lr}
	bx	lr
.L12:
	.align	2
.L11:
	.word	basket
	.word	shadowOAM
	.word	-32764
	.word	24864
	.size	drawLives, .-drawLives
	.align	2
	.global	drawWarning
	.type	drawWarning, %function
drawWarning:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L17
	ldr	r3, [r3, #28]
	cmp	r3, #5
	moveq	r0, #49152
	movne	r2, #512
	ldreq	r3, .L17+4
	ldreq	r1, .L17+8
	ldreq	r2, .L17+12
	ldrne	r3, .L17+4
	streqh	r0, [r3, #2]	@ movhi
	streqh	r1, [r3]	@ movhi
	streqh	r2, [r3, #4]	@ movhi
	strneh	r2, [r3]	@ movhi
	bx	lr
.L18:
	.align	2
.L17:
	.word	basket
	.word	shadowOAM+480
	.word	16392
	.word	24720
	.size	drawWarning, .-drawWarning
	.align	2
	.global	drawPauseText
	.type	drawPauseText, %function
drawPauseText:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L20
	ldr	ip, .L20+4
	ldr	r0, .L20+8
	ldr	r1, .L20+12
	add	r2, r3, #488
	add	r3, r3, #492
	strh	ip, [r2]	@ movhi
	strh	r0, [r2, #2]	@ movhi
	strh	r1, [r3]	@ movhi
	bx	lr
.L21:
	.align	2
.L20:
	.word	shadowOAM
	.word	16392
	.word	-16200
	.word	24792
	.size	drawPauseText, .-drawPauseText
	.align	2
	.global	drawNumApples
	.type	drawNumApples, %function
drawNumApples:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #1
	stmfd	sp!, {r4, r5, lr}
	mov	lr, #12
	mov	r1, #13
	mov	ip, #11
	ldr	r3, .L24
	ldr	r2, [r3, #28]
	ldr	r3, .L24+4
	add	r2, r2, #288
	add	r2, r2, r0
	add	r4, r3, #516
	orr	r2, r2, #24576
	ldr	r5, .L24+8
	strh	r2, [r4]	@ movhi
	add	r2, r3, #496
	strh	lr, [r2]	@ movhi
	strh	r0, [r2, #2]	@ movhi
	ldr	r4, .L24+12
	add	r2, r3, #500
	ldr	lr, .L24+16
	add	r0, r3, #504
	strh	r5, [r2]	@ movhi
	add	r2, r3, #512
	add	r3, r3, #508
	strh	r4, [r0, #2]	@ movhi
	strh	lr, [r3]	@ movhi
	strh	r1, [r0]	@ movhi
	strh	r1, [r2]	@ movhi
	strh	ip, [r2, #2]	@ movhi
	ldmfd	sp!, {r4, r5, lr}
	bx	lr
.L25:
	.align	2
.L24:
	.word	basket
	.word	shadowOAM
	.word	24928
	.word	16402
	.word	24930
	.size	drawNumApples, .-drawNumApples
	.align	2
	.global	setupSounds
	.type	setupSounds, %function
setupSounds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	mov	r0, #128
	mov	r1, #0
	ldr	r2, .L27
	strh	r0, [r3, #132]	@ movhi
	strh	r1, [r3, #128]	@ movhi
	strh	r2, [r3, #130]	@ movhi
	bx	lr
.L28:
	.align	2
.L27:
	.word	-1266
	.size	setupSounds, .-setupSounds
	.global	__aeabi_idiv
	.global	__aeabi_i2d
	.global	__aeabi_dmul
	.global	__aeabi_ddiv
	.global	__aeabi_d2iz
	.align	2
	.global	playSoundA
	.type	playSoundA, %function
playSoundA:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r6, #0
	mov	r5, r2
	ldr	r2, .L31+8
	ldr	r2, [r2]
	ldr	r7, .L31+12
	mov	r9, r1
	mov	r8, r0
	mov	r10, r3
	str	r6, [r2, #20]
	mov	r1, r0
	ldr	r2, .L31+16
	mov	r3, #910163968
	mov	r0, #1
	ldr	r4, .L31+20
	mov	lr, pc
	bx	r4
	strh	r6, [r7, #2]	@ movhi
	mov	r1, r5
	ldr	r3, .L31+24
	mov	r0, #16777216
	mov	lr, pc
	bx	r3
	mov	r2, #128
	mov	r3, #1
	rsb	r0, r0, #0
	ldr	r4, .L31+28
	mov	r0, r0, asl #16
	mov	r0, r0, lsr #16
	strh	r0, [r7]	@ movhi
	strh	r2, [r7, #2]	@ movhi
	mov	r0, r9
	ldr	r7, .L31+32
	str	r9, [r4, #4]
	str	r5, [r4, #8]
	str	r6, [r4, #28]
	str	r8, [r4]
	str	r3, [r4, #12]
	str	r10, [r4, #16]
	mov	lr, pc
	bx	r7
	ldr	r6, .L31+36
	adr	r3, .L31
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	r6
	mov	r8, r0
	mov	r0, r5
	mov	r9, r1
	mov	lr, pc
	bx	r7
	ldr	r5, .L31+40
	mov	r2, r0
	mov	r3, r1
	mov	r0, r8
	mov	r1, r9
	mov	lr, pc
	bx	r5
	ldr	r3, .L31+44
	mov	lr, pc
	bx	r3
	str	r0, [r4, #20]
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L32:
	.align	3
.L31:
	.word	1443109011
	.word	1078844686
	.word	dma
	.word	67109120
	.word	67109024
	.word	DMANow
	.word	__aeabi_idiv
	.word	soundA
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	__aeabi_ddiv
	.word	__aeabi_d2iz
	.size	playSoundA, .-playSoundA
	.align	2
	.global	playSoundB
	.type	playSoundB, %function
playSoundB:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r6, #0
	mov	r5, r2
	ldr	r2, .L35+8
	ldr	r2, [r2]
	ldr	r7, .L35+12
	mov	r9, r1
	mov	r8, r0
	mov	r10, r3
	str	r6, [r2, #32]
	mov	r1, r0
	ldr	r2, .L35+16
	mov	r3, #910163968
	mov	r0, #2
	ldr	r4, .L35+20
	mov	lr, pc
	bx	r4
	strh	r6, [r7, #6]	@ movhi
	mov	r1, r5
	ldr	r3, .L35+24
	mov	r0, #16777216
	mov	lr, pc
	bx	r3
	mov	r2, #128
	mov	r3, #1
	rsb	r0, r0, #0
	ldr	r4, .L35+28
	mov	r0, r0, asl #16
	mov	r0, r0, lsr #16
	strh	r0, [r7, #4]	@ movhi
	strh	r2, [r7, #6]	@ movhi
	mov	r0, r9
	ldr	r7, .L35+32
	str	r9, [r4, #4]
	str	r5, [r4, #8]
	str	r6, [r4, #28]
	str	r8, [r4]
	str	r3, [r4, #12]
	str	r10, [r4, #16]
	mov	lr, pc
	bx	r7
	ldr	r6, .L35+36
	adr	r3, .L35
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	r6
	mov	r8, r0
	mov	r0, r5
	mov	r9, r1
	mov	lr, pc
	bx	r7
	ldr	r5, .L35+40
	mov	r2, r0
	mov	r3, r1
	mov	r0, r8
	mov	r1, r9
	mov	lr, pc
	bx	r5
	ldr	r3, .L35+44
	mov	lr, pc
	bx	r3
	str	r0, [r4, #20]
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L36:
	.align	3
.L35:
	.word	1443109011
	.word	1078844686
	.word	dma
	.word	67109120
	.word	67109028
	.word	DMANow
	.word	__aeabi_idiv
	.word	soundB
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	__aeabi_ddiv
	.word	__aeabi_d2iz
	.size	playSoundB, .-playSoundB
	.align	2
	.global	collisionCheck
	.type	collisionCheck, %function
collisionCheck:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	mov	r4, r0
	mov	r5, r1
	ldr	r3, [r0, #4]
	ldr	r2, [r0, #12]
	ldr	ip, [r1, #4]
	add	r2, r3, r2
	ldr	r1, [r1, #12]
	sub	r2, r2, #10
	cmp	ip, r2
	add	r3, r3, #10
	add	r1, ip, r1
	ldr	r6, [r0, #28]
	movgt	r2, #0
	ldr	r0, [r0]
	movle	r2, #1
	ldr	ip, [r4, #8]
	cmp	r3, r1
	ldr	r1, [r5]
	movgt	r3, #0
	movle	r3, #1
	cmp	r6, #0
	add	r0, r0, ip
	add	r1, r1, #16
	bne	.L38
	cmp	r0, r1
	movlt	r3, #0
	andge	r3, r3, #1
	tst	r2, r3
	bne	.L60
.L37:
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L38:
	cmp	r6, #2
	beq	.L61
	cmp	r6, #1
	beq	.L62
	cmp	r6, #3
	bne	.L37
	and	r3, r3, r2
	cmp	r0, r1
	movlt	r3, #0
	andge	r3, r3, #1
	cmp	r3, #0
	beq	.L37
	mov	r3, #0
	ldr	r2, .L63
	ldr	r1, .L63+4
	ldr	r0, .L63+8
	bl	playSoundB
	mov	r1, #0
	ldr	r2, [r5, #20]
	ldr	r3, [r4, #8]
	cmp	r2, r1
	rsb	r3, r3, #0
	str	r3, [r4]
	str	r1, [r4, #24]
	bne	.L44
	mov	r2, #1
	mov	r3, #24
	str	r2, [r5, #20]
	str	r3, [r5, #12]
	b	.L45
.L60:
	mov	r3, r6
	ldr	r2, .L63
	ldr	r1, .L63+12
	ldr	r0, .L63+16
	bl	playSoundB
	ldr	r3, [r5, #28]
	ldr	r2, [r4, #8]
	add	r3, r3, #1
	rsb	r2, r2, #0
	str	r6, [r4, #24]
	str	r2, [r4]
	str	r3, [r5, #28]
	b	.L37
.L61:
	cmp	r0, r1
	movlt	r3, #0
	andge	r3, r3, #1
	tst	r2, r3
	beq	.L37
	mov	r3, #0
	ldr	r2, .L63
	ldr	r1, .L63+20
	ldr	r0, .L63+24
	bl	playSoundB
	mov	r1, #0
	ldr	r2, [r5, #24]
	ldr	r3, [r4, #8]
	sub	r2, r2, #1
	rsb	r3, r3, #0
	str	r2, [r5, #24]
	str	r3, [r4]
	str	r1, [r4, #24]
	str	r1, [r5, #28]
	b	.L37
.L62:
	cmp	r0, r1
	movlt	r3, #0
	andge	r3, r3, #1
	tst	r2, r3
	beq	.L37
	mov	r3, #0
	ldr	r2, .L63
	ldr	r1, .L63+28
	ldr	r0, .L63+32
	bl	playSoundB
	mov	r1, #0
	ldr	r2, [r5, #20]
	ldr	r3, [r4, #8]
	cmp	r2, r1
	rsb	r3, r3, #0
	str	r3, [r4]
	str	r1, [r4, #24]
	bne	.L42
	mov	r2, #2
	mov	r3, #40
	str	r2, [r5, #20]
	str	r3, [r5, #12]
.L45:
	ldr	r3, [r5, #28]
	add	r3, r3, #1
	str	r3, [r5, #28]
	b	.L37
.L42:
	cmp	r2, #1
	bne	.L45
.L59:
	mov	r3, #32
	str	r1, [r5, #20]
	str	r3, [r5, #12]
	b	.L45
.L44:
	cmp	r2, #2
	bne	.L45
	b	.L59
.L64:
	.align	2
.L63:
	.word	11025
	.word	6095
	.word	shrink
	.word	1848
	.word	collectApple
	.word	8958
	.word	badApple
	.word	4410
	.word	grow
	.size	collisionCheck, .-collisionCheck
	.align	2
	.global	updateApple
	.type	updateApple, %function
updateApple:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, [r0, #4]
	cmp	r2, #0
	movle	r3, #1
	movle	r2, r3
	strle	r3, [r0, #4]
	ldr	r3, [r0, #12]
	rsb	r3, r3, #239
	cmp	r3, r2
	strlt	r3, [r0, #4]
	ldr	r3, [r0, #24]
	cmp	r3, #1
	bxne	lr
	ldr	r3, [r0]
	ldr	r2, [r0, #8]
	ldr	r1, [r0, #16]
	add	r3, r3, r1
	rsb	r1, r2, #160
	cmp	r3, r1
	str	r3, [r0]
	movgt	r3, #0
	ldr	r1, .L72
	strgt	r3, [r0, #24]
	ldr	r3, [r1, #28]
	rsbgt	r2, r2, #0
	strgt	r2, [r0]
	cmp	r3, #4
	bxgt	lr
	b	collisionCheck
.L73:
	.align	2
.L72:
	.word	basket
	.size	updateApple, .-updateApple
	.align	2
	.global	updateBasket
	.type	updateBasket, %function
updateBasket:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #32
	bne	.L75
	ldr	r3, [r0, #4]
	cmp	r3, #1
	movle	r3, #1
	ldrgt	r1, .L108
	ldrgt	ip, [r0, #8]
	ldrgt	r2, [r1]
	rsbgt	r3, ip, r3
	subgt	r2, r2, #1
	strgt	r2, [r1]
	str	r3, [r0, #4]
.L75:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #16
	bne	.L77
	ldr	r3, [r0, #12]
	ldr	r2, [r0, #4]
	rsb	r3, r3, #239
	cmp	r2, r3
	ldrlt	ip, .L108
	ldrlt	r3, [r0, #8]
	ldrlt	r1, [ip]
	addlt	r2, r3, r2
	addlt	r3, r1, #1
	strge	r3, [r0, #4]
	strlt	r3, [ip]
	strlt	r2, [r0, #4]
.L77:
	ldr	r3, .L108+4
	ldr	r3, [r3]
	tst	r3, #1
	bxeq	lr
	ldr	r3, .L108+8
	ldr	r3, [r3]
	tst	r3, #1
	bne	.L103
	ldr	r3, [r0, #28]
	cmp	r3, #5
	stmfd	sp!, {r4, lr}
	beq	.L104
	cmp	r3, #0
	beq	.L81
	cmp	r3, #1
	beq	.L105
	cmp	r3, #2
	beq	.L106
	cmp	r3, #3
	beq	.L107
	cmp	r3, #4
	ldreq	r2, .L108+12
	ldreq	r3, [r2]
	addeq	r3, r3, #16
	streq	r3, [r2]
.L81:
	mov	r4, r0
	mov	r3, #0
	ldr	r2, .L108+16
	ldr	r1, .L108+20
	ldr	r0, .L108+24
	bl	playSoundB
	mov	r3, #0
	str	r3, [r4, #28]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L103:
	bx	lr
.L104:
	ldr	r2, .L108+12
	ldr	r3, [r2]
	add	r3, r3, #50
	str	r3, [r2]
	b	.L81
.L105:
	ldr	r2, .L108+12
	ldr	r3, [r2]
	add	r3, r3, #2
	str	r3, [r2]
	b	.L81
.L106:
	ldr	r2, .L108+12
	ldr	r3, [r2]
	add	r3, r3, #4
	str	r3, [r2]
	b	.L81
.L107:
	ldr	r2, .L108+12
	ldr	r3, [r2]
	add	r3, r3, #8
	str	r3, [r2]
	b	.L81
.L109:
	.align	2
.L108:
	.word	hOff
	.word	oldButtons
	.word	buttons
	.word	score
	.word	11025
	.word	12173
	.word	makePie
	.size	updateBasket, .-updateBasket
	.global	__aeabi_idivmod
	.align	2
	.global	update
	.type	update, %function
update:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r5, .L135
	ldr	r3, [r5]
	ldr	r4, .L135+4
	add	r3, r3, #1
	mov	r0, r3
	ldr	r1, [r4]
	ldr	r2, .L135+8
	str	r3, [r5]
	mov	lr, pc
	bx	r2
	cmp	r1, #0
	ldr	r6, .L135+12
	bne	.L111
	ldr	r0, [r6]
	cmp	r0, #0
	ble	.L111
	ldr	r7, .L135+16
	ldr	r3, [r7, #24]
	cmp	r3, #0
	movne	r3, r7
	bne	.L114
	b	.L133
.L121:
	ldr	r2, [r3, #24]
	cmp	r2, #0
	beq	.L112
.L114:
	add	r1, r1, #1
	cmp	r1, r0
	add	r3, r3, #32
	bne	.L121
.L111:
	ldr	r0, .L135+20
	bl	updateBasket
	ldr	r3, [r6]
	cmp	r3, #0
	ble	.L110
	mov	r5, #0
	ldr	r4, .L135+16
.L123:
	mov	r0, r4
	bl	updateApple
	ldr	r3, [r6]
	add	r5, r5, #1
	cmp	r3, r5
	add	r4, r4, #32
	bgt	.L123
.L110:
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L133:
	mov	r1, r3
.L112:
	mov	r2, #1
	mov	r8, r1, asl #5
	add	r10, r7, r8
	ldr	r3, [r10, #8]
	rsb	r3, r3, #0
	str	r2, [r10, #24]
	str	r3, [r7, r1, asl #5]
	ldr	r9, .L135+24
	mov	lr, pc
	bx	r9
	ldr	r3, .L135+28
	smull	r2, r3, r0, r3
	add	r2, r3, r0
	mov	r3, r0, asr #31
	ldr	r1, [r5]
	rsb	r3, r3, r2, asr #7
	rsb	r3, r3, r3, lsl #4
	sub	r0, r0, r3, asl #4
	cmp	r1, #500
	str	r0, [r10, #4]
	bgt	.L134
	mov	lr, pc
	bx	r9
	and	r0, r0, #1
	add	r3, r0, #1
	str	r3, [r10, #16]
	b	.L116
.L134:
	mov	lr, pc
	bx	r9
	and	r0, r0, #1
	add	r3, r0, #2
	str	r3, [r10, #16]
.L116:
	mov	lr, pc
	bx	r9
	ldr	r3, .L135+32
	smull	r1, r2, r3, r0
	mov	r3, r0, asr #31
	rsb	r3, r3, r2, asr #2
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3, asl #1
	cmp	r3, #4
	bgt	.L117
	mov	r3, #0
	add	r7, r7, r8
	str	r3, [r7, #28]
.L118:
	mov	lr, pc
	bx	r9
	ldr	r3, .L135+36
	smull	r2, r3, r0, r3
	mov	r2, r0, asr #31
	rsb	r3, r2, r3, asr #3
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	rsb	r3, r3, r0
	add	r3, r3, #50
	str	r3, [r4]
	b	.L111
.L117:
	cmp	r3, #5
	moveq	r3, #1
	addeq	r7, r7, r8
	streq	r3, [r7, #28]
	beq	.L118
	cmp	r3, #6
	moveq	r3, #3
	movne	r3, #2
	add	r7, r7, r8
	str	r3, [r7, #28]
	b	.L118
.L136:
	.align	2
.L135:
	.word	time
	.word	timeToNextApple
	.word	__aeabi_idivmod
	.word	appleCount
	.word	apples
	.word	basket
	.word	rand
	.word	-2004318071
	.word	1717986919
	.word	1374389535
	.size	update, .-update
	.align	2
	.global	interruptHandler
	.type	interruptHandler, %function
interruptHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	ldr	r3, .L154
	ldrh	r1, [r3, #2]
	tst	r1, #1
	strh	r2, [r3, #8]	@ movhi
	beq	.L151
	ldr	r0, .L154+4
	ldr	r3, [r0, #12]
	cmp	r3, r2
	stmfd	sp!, {r4, lr}
	beq	.L140
	ldr	r3, [r0, #28]
	ldr	r2, [r0, #20]
	add	r3, r3, #1
	cmp	r3, r2
	str	r3, [r0, #28]
	blt	.L140
	ldr	r3, [r0, #16]
	cmp	r3, #0
	bne	.L152
	ldr	r1, .L154+8
	ldr	r2, .L154+12
	ldr	r1, [r1]
	str	r3, [r0, #12]
	str	r3, [r1, #20]
	strh	r3, [r2, #2]	@ movhi
.L140:
	ldr	r0, .L154+16
	ldr	r3, [r0, #12]
	cmp	r3, #0
	beq	.L144
	ldr	r3, [r0, #28]
	ldr	r2, [r0, #20]
	add	r3, r3, #1
	cmp	r3, r2
	str	r3, [r0, #28]
	blt	.L144
	ldr	r3, [r0, #16]
	cmp	r3, #0
	bne	.L153
	ldr	r1, .L154+8
	ldr	r2, .L154+12
	ldr	r1, [r1]
	str	r3, [r0, #12]
	str	r3, [r1, #32]
	strh	r3, [r2, #6]	@ movhi
.L144:
	mov	r2, #1
	ldr	r3, .L154
	strh	r2, [r3, #2]	@ movhi
	mov	r2, #1
	ldr	r3, .L154
	ldmfd	sp!, {r4, lr}
	strh	r2, [r3, #8]	@ movhi
	bx	lr
.L151:
	mov	r2, #1
	ldr	r3, .L154
	strh	r2, [r3, #8]	@ movhi
	bx	lr
.L152:
	ldmia	r0, {r0, r1, r2}
	bl	playSoundA
	b	.L140
.L153:
	ldmia	r0, {r0, r1, r2}
	bl	playSoundB
	b	.L144
.L155:
	.align	2
.L154:
	.word	67109376
	.word	soundA
	.word	dma
	.word	67109120
	.word	soundB
	.size	interruptHandler, .-interruptHandler
	.align	2
	.global	pauseSound
	.type	pauseSound, %function
pauseSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	ldr	r2, .L157
	ldr	r0, .L157+4
	ldr	r1, .L157+8
	str	r3, [r0, #12]
	str	r3, [r1, #12]
	strh	r3, [r2, #2]	@ movhi
	strh	r3, [r2, #6]	@ movhi
	bx	lr
.L158:
	.align	2
.L157:
	.word	67109120
	.word	soundA
	.word	soundB
	.size	pauseSound, .-pauseSound
	.align	2
	.global	unpauseSound
	.type	unpauseSound, %function
unpauseSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #128
	mov	r3, #1
	ldr	r2, .L160
	ldr	ip, .L160+4
	ldr	r0, .L160+8
	strh	r1, [r2, #2]	@ movhi
	str	r3, [ip, #12]
	strh	r1, [r2, #6]	@ movhi
	str	r3, [r0, #12]
	bx	lr
.L161:
	.align	2
.L160:
	.word	67109120
	.word	soundA
	.word	soundB
	.size	unpauseSound, .-unpauseSound
	.align	2
	.global	stopSound
	.type	stopSound, %function
stopSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	ldr	r2, .L163
	ldr	ip, .L163+4
	ldr	r1, [r2]
	ldr	r0, .L163+8
	ldr	r2, .L163+12
	str	r3, [r1, #20]
	str	r3, [ip, #12]
	str	r3, [r1, #32]
	str	r3, [r0, #12]
	strh	r3, [r2, #2]	@ movhi
	strh	r3, [r2, #6]	@ movhi
	bx	lr
.L164:
	.align	2
.L163:
	.word	dma
	.word	soundA
	.word	soundB
	.word	67109120
	.size	stopSound, .-stopSound
	.align	2
	.global	setupInterrupts
	.type	setupInterrupts, %function
setupInterrupts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #67108864
	stmfd	sp!, {r4, lr}
	mov	r4, #1
	ldr	r3, .L167
	ldrh	r1, [r0, #4]
	ldrh	r2, [r3]
	ldr	lr, .L167+4
	ldr	ip, .L167+8
	orr	r2, r2, r4
	orr	r1, r1, #8
	strh	r1, [r0, #4]	@ movhi
	strh	r4, [r3, #8]	@ movhi
	strh	r2, [r3]	@ movhi
	str	lr, [ip, #4092]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L168:
	.align	2
.L167:
	.word	67109376
	.word	interruptHandler
	.word	50360320
	.size	setupInterrupts, .-setupInterrupts
	.comm	shadowOAM,1024,4
	.comm	score,4,4
	.comm	oldhOff,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	time,4,4
	.comm	timeToNextApple,4,4
	.comm	appleCount,4,4
	.comm	apples,160,4
	.comm	basket,32,4
	.comm	oldButtons,4,4
	.comm	buttons,4,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.ident	"GCC: (devkitARM release 45) 5.3.0"
