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
	.file	"hw04.c"
	.text
	.align	2
	.type	drawApple.part.2, %function
drawApple.part.2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	mov	r4, r0
	ldr	r3, [r0, #36]
	cmp	r3, #0
	ldrneh	ip, [r4, #44]
	ldreqh	ip, [r4, #40]
	sub	sp, sp, #12
	add	r2, r0, #16
	ldmia	r2, {r2, r3}
	ldr	r5, .L7
	ldmia	r0, {r0, r1}
	str	ip, [sp]
	mov	lr, pc
	bx	r5
	add	r2, r4, #16
	ldmia	r4, {r0, r1}
	ldmia	r2, {r2, r3}
	ldrh	ip, [r4, #42]
	sub	r3, r3, #8
	str	ip, [sp]
	sub	r2, r2, #5
	add	r1, r1, #5
	sub	r0, r0, #5
	mov	lr, pc
	bx	r5
	add	r2, r4, #16
	ldmia	r4, {r0, r1}
	ldmia	r2, {r2, r3}
	ldrh	ip, [r4, #46]
	sub	r3, r3, #6
	sub	r2, r2, #7
	add	r1, r1, #1
	sub	r0, r0, #2
	str	ip, [sp]
	mov	lr, pc
	bx	r5
	add	sp, sp, #12
	@ sp needed
	ldmfd	sp!, {r4, r5, lr}
	bx	lr
.L8:
	.align	2
.L7:
	.word	drawRect
	.size	drawApple.part.2, .-drawApple.part.2
	.align	2
	.type	eraseApple.part.3, %function
eraseApple.part.3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	mov	r4, r0
	ldr	r6, .L11
	sub	sp, sp, #8
	add	r0, r0, #8
	ldmia	r0, {r0, r1, r2, r3}
	ldr	r5, .L11+4
	str	r6, [sp]
	mov	lr, pc
	bx	r5
	add	r0, r4, #8
	ldmia	r0, {r0, r1, r2, r3}
	str	r6, [sp]
	sub	r3, r3, #8
	sub	r2, r2, #5
	add	r1, r1, #5
	sub	r0, r0, #5
	mov	lr, pc
	bx	r5
	add	r0, r4, #8
	ldmia	r0, {r0, r1, r2, r3}
	str	r6, [sp]
	sub	r3, r3, #6
	sub	r2, r2, #7
	add	r1, r1, #1
	sub	r0, r0, #2
	mov	lr, pc
	bx	r5
	add	sp, sp, #8
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L12:
	.align	2
.L11:
	.word	32736
	.word	drawRect
	.size	eraseApple.part.3, .-eraseApple.part.3
	.align	2
	.global	initialize
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	fp, #25
	mov	r10, #15
	mov	r9, #145
	mov	r8, #108
	mov	r7, #5
	mov	r1, #10
	mov	r5, #1
	mov	r4, #31
	mov	lr, #640
	ldr	r3, .L17
	str	r0, [r3]
	ldr	r3, .L17+4
	str	r0, [r3]
	ldr	r3, .L17+8
	ldr	ip, .L17+12
	str	r0, [r3, #8]
	str	r0, [r3, #12]
	strb	r0, [r3, #26]
	mov	r2, r0
	ldr	r0, .L17+16
	strh	ip, [r3, #24]	@ movhi
	str	fp, [r3, #16]
	str	r10, [r3, #20]
	str	r9, [r3]
	str	r8, [r3, #4]
	ldr	r3, .L17+20
	str	r7, [r0]
	mov	r6, ip
	add	ip, r3, #240
.L14:
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r5, [r3, #24]
	str	r2, [r3, #28]
	str	r2, [r3, #32]
	str	r2, [r3, #36]
	strh	r4, [r3, #40]	@ movhi
	strh	r6, [r3, #42]	@ movhi
	strh	r2, [r3, #44]	@ movhi
	strh	lr, [r3, #46]	@ movhi
	add	r3, r3, #48
	cmp	r3, ip
	mov	r0, #0
	bne	.L14
	ldr	r3, .L17+24
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	str	r0, [r3]
	bx	lr
.L18:
	.align	2
.L17:
	.word	state
	.word	score
	.word	basket
	.word	270
	.word	appleCount
	.word	apples
	.word	time
	.size	initialize, .-initialize
	.align	2
	.global	goToStart
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	mov	r6, #0
	sub	sp, sp, #48
	mov	r0, #0
	ldr	r3, .L21
	mov	lr, pc
	bx	r3
	bl	initialize
	ldr	r3, .L21+4
	ldmia	r3, {r0, r1, r2, r3}
	add	ip, sp, #4
	stmia	ip!, {r0, r1, r2}
	ldr	r5, .L21+8
	ldr	lr, .L21+12
	strh	r3, [ip]	@ movhi
	add	r2, sp, #4
	mov	r3, r5
	ldr	r4, .L21+16
	mov	r1, #80
	mov	r0, #60
	str	r6, [lr]
	mov	lr, pc
	bx	r4
	ldr	lr, .L21+20
	ldmia	lr!, {r0, r1, r2, r3}
	add	ip, sp, #4
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr, {r0, r1}
	str	r0, [ip], #4
	mov	r3, r5
	strh	r1, [ip]	@ movhi
	add	r2, sp, #4
	mov	r0, #80
	mov	r1, #60
	mov	lr, pc
	bx	r4
	add	sp, sp, #48
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L22:
	.align	2
.L21:
	.word	fillScreen
	.word	.LC0
	.word	32767
	.word	state
	.word	drawString
	.word	.LC1
	.size	goToStart, .-goToStart
	.align	2
	.global	goToGame
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r3, .L25
	ldr	r0, .L25+4
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L25+8
	ldmfd	sp!, {r4, lr}
	str	r2, [r3]
	bx	lr
.L26:
	.align	2
.L25:
	.word	fillScreen
	.word	32736
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	goToEnd
	.type	goToEnd, %function
goToEnd:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	mov	r6, #2
	sub	sp, sp, #48
	mov	r0, #0
	ldr	r3, .L29
	mov	lr, pc
	bx	r3
	ldr	r3, .L29+4
	ldmia	r3, {r0, r1, r2}
	add	ip, sp, #4
	stmia	ip!, {r0, r1}
	ldr	r5, .L29+8
	strh	r2, [ip], #2	@ movhi
	ldr	lr, .L29+12
	mov	r4, r2, lsr #16
	strb	r4, [ip]
	mov	r3, r5
	ldr	r4, .L29+16
	add	r2, sp, #4
	mov	r1, #90
	mov	r0, #40
	str	r6, [lr]
	mov	lr, pc
	bx	r4
	ldr	r3, .L29+20
	add	r0, sp, #4
	ldr	r2, [r3]
	ldr	r1, .L29+24
	ldr	r3, .L29+28
	mov	lr, pc
	bx	r3
	mov	r3, r5
	add	r2, sp, #4
	mov	r1, #70
	mov	r0, #60
	mov	lr, pc
	bx	r4
	ldr	lr, .L29+32
	ldmia	lr!, {r0, r1, r2, r3}
	add	ip, sp, #4
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr, {r0, r1}
	str	r0, [ip], #4
	strh	r1, [ip], #2	@ movhi
	mov	lr, r1, lsr #16
	mov	r3, r5
	add	r2, sp, #4
	mov	r0, #100
	mov	r1, #6
	strb	lr, [ip]
	mov	lr, pc
	bx	r4
	add	sp, sp, #48
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L30:
	.align	2
.L29:
	.word	fillScreen
	.word	.LC2
	.word	32767
	.word	state
	.word	drawString
	.word	score
	.word	.LC3
	.word	sprintf
	.word	.LC4
	.size	goToEnd, .-goToEnd
	.align	2
	.global	start
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L38
	ldr	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L38+4
	ldr	r3, [r3]
	tst	r3, #8
	bxne	lr
	stmfd	sp!, {r4, lr}
	ldr	r3, .L38+8
	ldr	r0, .L38+12
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L38+16
	ldmfd	sp!, {r4, lr}
	str	r2, [r3]
	bx	lr
.L39:
	.align	2
.L38:
	.word	oldButtons
	.word	buttons
	.word	fillScreen
	.word	32736
	.word	state
	.size	start, .-start
	.align	2
	.global	end
	.type	end, %function
end:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L45
	ldr	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L45+4
	ldr	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToStart
.L46:
	.align	2
.L45:
	.word	oldButtons
	.word	buttons
	.size	end, .-end
	.align	2
	.global	drawApple
	.type	drawApple, %function
drawApple:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #32]
	cmp	r3, #0
	bxeq	lr
	b	drawApple.part.2
	.size	drawApple, .-drawApple
	.align	2
	.global	eraseApple
	.type	eraseApple, %function
eraseApple:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #32]
	cmp	r3, #0
	bxeq	lr
	b	eraseApple.part.3
	.size	eraseApple, .-eraseApple
	.align	2
	.global	drawBasket
	.type	drawBasket, %function
drawBasket:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, lr}
	mov	r4, r0
	mov	r7, #0
	ldrh	ip, [r4, #24]
	sub	sp, sp, #12
	ldr	r3, [r0, #16]
	ldr	r2, [r0, #20]
	ldr	r6, .L53
	ldmia	r0, {r0, r1}
	str	ip, [sp]
	mov	lr, pc
	bx	r6
	ldr	r5, .L53+4
	ldr	ip, [r4, #20]
	smull	r3, r2, r5, ip
	ldr	r0, [r4]
	sub	r2, r2, ip, asr #31
	ldr	r3, [r4, #16]
	ldr	r1, [r4, #4]
	add	r0, r2, r0
	str	r7, [sp]
	mov	r2, #1
	mov	lr, pc
	bx	r6
	ldr	r2, [r4, #20]
	smull	r3, r5, r2, r5
	ldr	r0, [r4]
	sub	r5, r5, r2, asr #31
	ldr	r3, [r4, #16]
	ldr	r1, [r4, #4]
	add	r0, r0, r5, lsl #1
	str	r7, [sp]
	mov	r2, #1
	mov	lr, pc
	bx	r6
	add	sp, sp, #12
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, lr}
	bx	lr
.L54:
	.align	2
.L53:
	.word	drawRect
	.word	1431655766
	.size	drawBasket, .-drawBasket
	.align	2
	.global	eraseBasket
	.type	eraseBasket, %function
eraseBasket:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, lr}
	mov	r4, r0
	ldr	r7, .L57
	sub	sp, sp, #12
	ldr	r3, [r0, #16]
	ldr	r2, [r0, #20]
	add	r0, r0, #8
	ldmia	r0, {r0, r1}
	ldr	r6, .L57+4
	str	r7, [sp]
	mov	lr, pc
	bx	r6
	ldr	r5, .L57+8
	ldr	ip, [r4, #20]
	smull	r3, r2, r5, ip
	ldr	r0, [r4]
	sub	r2, r2, ip, asr #31
	ldr	r3, [r4, #16]
	ldr	r1, [r4, #4]
	add	r0, r2, r0
	str	r7, [sp]
	mov	r2, #1
	mov	lr, pc
	bx	r6
	ldr	r2, [r4, #20]
	smull	r3, r5, r2, r5
	ldr	r0, [r4]
	sub	r5, r5, r2, asr #31
	ldr	r3, [r4, #16]
	ldr	r1, [r4, #4]
	add	r0, r0, r5, lsl #1
	str	r7, [sp]
	mov	r2, #1
	mov	lr, pc
	bx	r6
	add	sp, sp, #12
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, lr}
	bx	lr
.L58:
	.align	2
.L57:
	.word	32736
	.word	drawRect
	.word	1431655766
	.size	eraseBasket, .-eraseBasket
	.align	2
	.global	draw
	.type	draw, %function
draw:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r6, .L77
	ldr	r0, .L77+4
	bl	eraseBasket
	ldr	r3, [r6]
	cmp	r3, #0
	ble	.L65
	mov	r5, #0
	ldr	r4, .L77+8
	b	.L64
.L63:
	ldr	r3, [r6]
	cmp	r3, r5
	add	r4, r4, #48
	ble	.L65
.L64:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	add	r5, r5, #1
	beq	.L63
	mov	r0, r4
	bl	eraseApple.part.3
	ldr	r3, [r6]
	cmp	r3, r5
	add	r4, r4, #48
	bgt	.L64
.L65:
	ldr	r0, .L77+4
	bl	drawBasket
	ldr	r3, [r6]
	cmp	r3, #0
	ble	.L59
	mov	r5, #0
	ldr	r4, .L77+8
	b	.L67
.L66:
	ldr	r3, [r6]
	cmp	r3, r5
	add	r4, r4, #48
	ble	.L59
.L67:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	add	r5, r5, #1
	beq	.L66
	mov	r0, r4
	bl	drawApple.part.2
	ldr	r3, [r6]
	cmp	r3, r5
	add	r4, r4, #48
	bgt	.L67
.L59:
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L78:
	.align	2
.L77:
	.word	appleCount
	.word	basket
	.word	apples
	.size	draw, .-draw
	.align	2
	.global	collisionCheck
	.type	collisionCheck, %function
collisionCheck:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, [r0, #36]
	cmp	r2, #0
	stmfd	sp!, {r4, lr}
	mov	r3, r0
	bne	.L80
	ldr	lr, [r1, #4]
	ldr	r2, [r1, #16]
	ldr	ip, [r0, #4]
	add	r2, lr, r2
	cmp	ip, r2
	bgt	.L79
	ldr	r2, [r0, #20]
	add	ip, ip, r2
	cmp	lr, ip
	bgt	.L79
	ldr	r2, [r0, #16]
	ldr	ip, [r0]
	ldr	lr, [r1]
	add	r1, r2, ip
	cmp	r1, lr
	blt	.L79
	ldr	r1, .L87
	ldr	ip, [r0, #32]
	ldr	r3, [r1]
	cmp	ip, #0
	add	r3, r3, #1
	mov	r4, r0
	str	r3, [r1]
	beq	.L82
	bl	eraseApple.part.3
	ldr	r2, [r4, #16]
.L82:
	mov	r3, #0
	rsb	r2, r2, #0
	str	r2, [r4]
	str	r3, [r4, #32]
.L79:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L80:
	cmp	r2, #1
	bne	.L79
	ldr	lr, [r1, #4]
	ldr	r0, [r1, #16]
	ldr	ip, [r3, #4]
	add	r0, lr, r0
	cmp	ip, r0
	bgt	.L79
	ldr	r0, [r3, #20]
	add	ip, ip, r0
	cmp	lr, ip
	bgt	.L79
	ldr	r0, [r3]
	ldr	r3, [r3, #16]
	ldr	ip, [r1]
	add	r3, r0, r3
	cmp	r3, ip
	strgeb	r2, [r1, #26]
	b	.L79
.L88:
	.align	2
.L87:
	.word	score
	.size	collisionCheck, .-collisionCheck
	.align	2
	.global	updateApple
	.type	updateApple, %function
updateApple:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldmia	r0, {r1, r2}
	cmp	r2, #0
	movle	r3, #1
	str	r2, [r0, #12]
	movle	r2, r3
	strle	r3, [r0, #4]
	ldr	r3, [r0, #20]
	rsb	r3, r3, #239
	cmp	r3, r2
	strlt	r3, [r0, #4]
	ldr	r3, [r0, #32]
	cmp	r3, #1
	str	r1, [r0, #8]
	bxne	lr
	ldr	r3, [r0, #24]
	add	r1, r1, r3
	cmp	r1, #166
	movgt	r2, #0
	ldrgt	r3, [r0, #16]
	rsbgt	r3, r3, #0
	str	r1, [r0]
	strgt	r2, [r0, #32]
	strgt	r3, [r0]
	ldr	r1, .L94
	b	collisionCheck
.L95:
	.align	2
.L94:
	.word	basket
	.size	updateApple, .-updateApple
	.align	2
	.global	updateBasket
	.type	updateBasket, %function
updateBasket:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
	ldmia	r0, {r1, r3}
	str	r1, [r0, #8]
	str	r3, [r0, #12]
	ldr	r2, [r2, #304]
	tst	r2, #32
	bne	.L97
	cmp	r3, #0
	movle	r3, #0
	subgt	r3, r3, #1
	str	r3, [r0, #4]
.L97:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #16
	bxne	lr
	ldr	r2, [r0, #16]
	ldr	r1, [r0, #4]
	rsb	r3, r2, #239
	cmp	r3, r1
	movge	r3, r1
	add	r3, r3, #1
	str	r3, [r0, #4]
	bx	lr
	.size	updateBasket, .-updateBasket
	.global	__aeabi_idivmod
	.align	2
	.global	update
	.type	update, %function
update:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L125
	ldr	r3, [r2]
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	ldr	r4, .L125+4
	add	r3, r3, #1
	mov	r0, r3
	ldr	r1, [r4]
	ldr	r5, .L125+8
	str	r3, [r2]
	mov	lr, pc
	bx	r5
	cmp	r1, #0
	ldr	r6, .L125+12
	bne	.L108
	ldr	r0, [r6]
	cmp	r0, #0
	ble	.L108
	ldr	ip, .L125+16
	ldr	r3, [ip, #32]
	cmp	r3, #0
	movne	r3, ip
	bne	.L111
	b	.L124
.L112:
	ldr	r2, [r3, #32]
	cmp	r2, #0
	beq	.L109
.L111:
	add	r1, r1, #1
	cmp	r1, r0
	add	r3, r3, #48
	bne	.L112
.L108:
	ldr	r0, .L125+20
	bl	updateBasket
	ldr	r3, [r6]
	cmp	r3, #0
	ble	.L107
	mov	r5, #0
	ldr	r4, .L125+16
.L114:
	mov	r0, r4
	bl	updateApple
	ldr	r3, [r6]
	add	r5, r5, #1
	cmp	r3, r5
	add	r4, r4, #48
	bgt	.L114
.L107:
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bx	lr
.L124:
	mov	r1, r3
.L109:
	mov	r2, #1
	add	r1, r1, r1, lsl #1
	mov	r1, r1, asl #4
	add	r7, ip, r1
	ldr	r3, [r7, #16]
	rsb	r3, r3, #0
	str	r3, [ip, r1]
	ldr	r5, .L125+24
	str	r2, [r7, #32]
	mov	lr, pc
	bx	r5
	ldr	r3, .L125+28
	smull	r2, r3, r0, r3
	mov	r2, r0, asr #31
	add	r3, r3, r0
	rsb	r3, r2, r3, asr #7
	rsb	r3, r3, r3, lsl #4
	sub	r0, r0, r3, asl #4
	str	r0, [r7, #4]
	mov	lr, pc
	bx	r5
	and	r0, r0, #1
	add	r0, r0, #1
	str	r0, [r7, #24]
	mov	lr, pc
	bx	r5
	add	r3, r0, r0, lsr #31
	and	r3, r3, #1
	sub	r0, r3, r0, lsr #31
	str	r0, [r7, #36]
	mov	lr, pc
	bx	r5
	ldr	r3, .L125+32
	smull	r2, r3, r0, r3
	mov	r2, r0, asr #31
	rsb	r3, r2, r3, asr #3
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	rsb	r3, r3, r0
	add	r3, r3, #50
	str	r3, [r4]
	b	.L108
.L126:
	.align	2
.L125:
	.word	time
	.word	timeToNextApple
	.word	__aeabi_idivmod
	.word	appleCount
	.word	apples
	.word	basket
	.word	rand
	.word	-2004318071
	.word	1374389535
	.size	update, .-update
	.align	2
	.global	game
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L131
	ldrb	r3, [r4, #26]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L128
.L129:
	ldmfd	sp!, {r4, lr}
	b	goToEnd
.L128:
	bl	update
	ldr	r3, .L131+4
	mov	lr, pc
	bx	r3
	bl	draw
	ldrb	r3, [r4, #26]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L129
	ldmfd	sp!, {r4, lr}
	bx	lr
.L132:
	.align	2
.L131:
	.word	basket
	.word	waitForVBlank
	.size	game, .-game
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r4, #67108864
	ldr	r2, .L143
	stmfd	sp!, {r7, lr}
	ldr	r3, .L143+4
	strh	r2, [r4]	@ movhi
	ldr	r9, .L143+8
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	r9
	ldr	r10, .L143+12
	ldr	r6, .L143+16
	ldr	r5, .L143+20
	ldr	r8, .L143+24
	ldr	r7, .L143+28
.L134:
	ldr	r2, [r10]
	str	r2, [r6]
	ldr	r3, [r5]
	ldr	r1, [r4, #304]
	cmp	r3, #1
	str	r1, [r10]
	beq	.L136
	cmp	r3, #2
	beq	.L137
	cmp	r3, #0
	bne	.L134
	mov	lr, pc
	bx	r8
	b	.L134
.L137:
	tst	r2, #8
	beq	.L134
	tst	r1, #8
	bne	.L134
	mov	lr, pc
	bx	r9
	b	.L134
.L136:
	mov	lr, pc
	bx	r7
	b	.L134
.L144:
	.align	2
.L143:
	.word	1027
	.word	initialize
	.word	goToStart
	.word	buttons
	.word	oldButtons
	.word	state
	.word	start
	.word	game
	.size	main, .-main
	.comm	score,4,4
	.comm	state,4,4
	.comm	time,4,4
	.comm	timeToNextApple,4,4
	.comm	appleCount,4,4
	.comm	apples,240,4
	.comm	basket,28,4
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"APPLE ORCHARD\000"
	.space	2
.LC1:
	.ascii	"Press [START] to play\000"
	.space	2
.LC2:
	.ascii	"GAME OVER!\000"
	.space	1
.LC3:
	.ascii	"Your Score is: %d\000"
	.space	2
.LC4:
	.ascii	"Press [START] to return to home screen\000"
	.ident	"GCC: (devkitARM release 45) 5.3.0"
