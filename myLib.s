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
	.file	"myLib.c"
	.text
	.align	2
	.global	loadMap
	.type	loadMap, %function
loadMap:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, fp, lr}
	mov	r4, r1, asl #1
	add	ip, r4, #8
	cmp	r1, #0
	bic	ip, ip, #7
	add	fp, sp, #12
	movne	r2, r2, asl #28
	sub	sp, sp, ip
	mov	r5, sp
	addne	r4, r0, r4
	movne	r2, r2, lsr #16
	subne	lr, sp, #2
	beq	.L4
.L3:
	ldrh	ip, [r0], #2
	mov	ip, ip, asl #20
	orr	ip, r2, ip, lsr #20
	cmp	r0, r4
	strh	ip, [lr, #2]!	@ movhi
	bne	.L3
.L4:
	ldr	r2, .L9
	mov	r3, r3, asl #11
	ldr	r2, [r2]
	add	r3, r3, #100663296
	orr	r1, r1, #-2147483648
	str	r5, [r2, #36]
	str	r3, [r2, #40]
	str	r1, [r2, #44]
	sub	sp, fp, #12
	@ sp needed
	ldmfd	sp!, {r4, r5, fp, lr}
	bx	lr
.L10:
	.align	2
.L9:
	.word	.LANCHOR0
	.size	loadMap, .-loadMap
	.align	2
	.global	setPixel3
	.type	setPixel3, %function
setPixel3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L12
	rsb	r0, r0, r0, lsl #4
	add	r1, r1, r0, lsl #4
	ldr	r3, [r3, #4]
	mov	r1, r1, asl #1
	strh	r2, [r3, r1]	@ movhi
	bx	lr
.L13:
	.align	2
.L12:
	.word	.LANCHOR0
	.size	setPixel3, .-setPixel3
	.align	2
	.global	drawRect3
	.type	drawRect3, %function
drawRect3:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	sub	sp, sp, #8
	ldrh	ip, [sp, #16]
	cmp	r2, #0
	strh	ip, [sp, #6]	@ movhi
	ble	.L14
	ldr	r4, .L20
	add	r2, r0, r2
	rsb	r2, r2, r2, lsl #4
	rsb	r0, r0, r0, lsl #4
	ldr	ip, [r4, #4]
	add	lr, r1, r2, lsl #4
	add	r1, r1, r0, lsl #4
	ldr	r2, [r4]
	orr	r3, r3, #-2130706432
	add	lr, ip, lr, lsl #1
	add	r1, ip, r1, lsl #1
	add	r0, sp, #6
.L16:
	str	r0, [r2, #36]
	str	r1, [r2, #40]
	add	r1, r1, #480
	cmp	lr, r1
	str	r3, [r2, #44]
	bne	.L16
.L14:
	add	sp, sp, #8
	@ sp needed
	ldmfd	sp!, {r4, lr}
	bx	lr
.L21:
	.align	2
.L20:
	.word	.LANCHOR0
	.size	drawRect3, .-drawRect3
	.align	2
	.global	drawImage3
	.type	drawImage3, %function
drawImage3:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	cmp	r3, #0
	ldr	r4, [sp, #12]
	ble	.L22
	ldr	r5, .L28
	add	r3, r1, r3
	ldr	ip, [r5, #4]
	rsb	r3, r3, r3, lsl #4
	rsb	r1, r1, r1, lsl #4
	add	lr, r2, r3, lsl #4
	add	r2, r2, r1, lsl #4
	ldr	r3, [r5]
	add	lr, ip, lr, lsl #1
	add	r2, ip, r2, lsl #1
	mov	r1, r4, asl #1
	orr	ip, r4, #-2147483648
.L24:
	str	r0, [r3, #36]
	str	r2, [r3, #40]
	add	r2, r2, #480
	cmp	lr, r2
	str	ip, [r3, #44]
	add	r0, r0, r1
	bne	.L24
.L22:
	ldmfd	sp!, {r4, r5, lr}
	bx	lr
.L29:
	.align	2
.L28:
	.word	.LANCHOR0
	.size	drawImage3, .-drawImage3
	.align	2
	.global	fillScreen3
	.type	fillScreen3, %function
fillScreen3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L32
	sub	sp, sp, #8
	add	r2, sp, #8
	strh	r0, [r2, #-2]!	@ movhi
	ldr	r3, [r1]
	ldr	r0, [r1, #4]
	ldr	r1, .L32+4
	str	r2, [r3, #36]
	str	r0, [r3, #40]
	str	r1, [r3, #44]
	add	sp, sp, #8
	@ sp needed
	bx	lr
.L33:
	.align	2
.L32:
	.word	.LANCHOR0
	.word	-2130668032
	.size	fillScreen3, .-fillScreen3
	.align	2
	.global	setPixel4
	.type	setPixel4, %function
setPixel4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L37
	rsb	r0, r0, r0, lsl #4
	add	r0, r1, r0, lsl #4
	ldr	ip, [r3, #4]
	add	r0, r0, r0, lsr #31
	bic	r0, r0, #1
	ldrh	r3, [ip, r0]
	tst	r1, #1
	biceq	r3, r3, #255
	andne	r3, r3, #255
	orrne	r2, r3, r2, asl #8
	orreq	r3, r3, r2
	strneh	r2, [ip, r0]	@ movhi
	streqh	r3, [ip, r0]	@ movhi
	bx	lr
.L38:
	.align	2
.L37:
	.word	.LANCHOR0
	.size	setPixel4, .-setPixel4
	.align	2
	.global	drawRect4
	.type	drawRect4, %function
drawRect4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	sub	sp, sp, #36
	ldrb	ip, [sp, #72]	@ zero_extendqisi2
	mov	r8, ip, asl #8
	str	ip, [sp, #16]
	cmp	r2, #0
	orr	ip, ip, r8
	strh	ip, [sp, #30]	@ movhi
	ble	.L39
	add	r7, r3, r3, lsr #31
	add	r6, r1, #1
	mov	r7, r7, asr #1
	add	r5, r1, r3
	sub	r9, r7, #1
	add	r6, r6, r6, lsr #31
	ldr	lr, .L54
	add	fp, r1, r1, lsr #31
	orr	r9, r9, #-2130706432
	bic	r6, r6, #1
	sub	r5, r5, #1
	rsb	r6, r1, r6
	rsb	r0, r0, r0, lsl #4
	bic	fp, fp, #1
	str	r9, [sp, #20]
	and	r5, r5, #1
	and	r9, r3, #1
	sub	r3, r3, #1
	ldr	r4, [lr, #4]
	add	r0, r1, r0, lsl #4
	rsb	fp, r1, fp
	mov	ip, #0
	ldr	lr, [lr]
	orr	r7, r7, #-2130706432
	str	r6, [sp, #4]
	str	r5, [sp, #12]
	and	r1, r1, #1
	str	r3, [sp, #8]
	add	r10, sp, #30
	b	.L46
.L53:
	add	r3, r0, r0, lsr #31
	bic	r3, r3, #1
	ldrb	r5, [r4, r3]	@ zero_extendqisi2
	cmp	r9, #0
	orr	r5, r5, r8
	strh	r5, [r4, r3]	@ movhi
	beq	.L42
	ldr	r3, [sp, #4]
	add	r3, r0, r3
	add	r3, r4, r3
	str	r10, [lr, #36]
	str	r3, [lr, #40]
	str	r7, [lr, #44]
.L43:
	add	ip, ip, #1
	cmp	r2, ip
	add	r0, r0, #240
	beq	.L39
.L46:
	cmp	r1, #0
	bne	.L53
	add	r3, fp, r0
	add	r3, r4, r3
	cmp	r9, #0
	str	r10, [lr, #36]
	str	r3, [lr, #40]
	str	r7, [lr, #44]
	beq	.L43
	ldr	r3, [sp, #8]
	add	r3, r3, r0
	ldr	r5, [sp, #12]
	add	r3, r3, r3, lsr #31
	bic	r3, r3, #1
	cmp	r5, #0
	ldrh	r5, [r4, r3]
	ldreq	r6, [sp, #16]
	andne	r5, r5, #255
	biceq	r5, r5, #255
	add	ip, ip, #1
	orrne	r5, r5, r8
	orreq	r5, r5, r6
	cmp	r2, ip
	strh	r5, [r4, r3]	@ movhi
	add	r0, r0, #240
	bne	.L46
.L39:
	add	sp, sp, #36
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L42:
	ldr	r3, [sp, #8]
	ldr	r5, [sp, #4]
	add	r3, r3, r0
	ldr	r6, [sp, #12]
	add	r3, r3, r3, lsr #31
	add	r5, r0, r5
	bic	r3, r3, #1
	add	r5, r4, r5
	cmp	r6, #0
	str	r10, [lr, #36]
	ldrh	r6, [r4, r3]
	str	r5, [lr, #40]
	ldr	r5, [sp, #20]
	str	r5, [lr, #44]
	ldreq	r5, [sp, #16]
	andne	r6, r6, #255
	biceq	r6, r6, #255
	orrne	r6, r8, r6
	orreq	r6, r6, r5
	strh	r6, [r4, r3]	@ movhi
	b	.L43
.L55:
	.align	2
.L54:
	.word	.LANCHOR0
	.size	drawRect4, .-drawRect4
	.align	2
	.global	fillScreen4
	.type	fillScreen4, %function
fillScreen4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L58
	sub	sp, sp, #8
	add	r2, sp, #8
	orr	r0, r0, r0, asl #8
	strh	r0, [r2, #-2]!	@ movhi
	ldr	r3, [r1]
	ldr	r0, [r1, #4]
	ldr	r1, .L58+4
	str	r2, [r3, #36]
	str	r0, [r3, #40]
	str	r1, [r3, #44]
	add	sp, sp, #8
	@ sp needed
	bx	lr
.L59:
	.align	2
.L58:
	.word	.LANCHOR0
	.word	-2130687232
	.size	fillScreen4, .-fillScreen4
	.align	2
	.global	drawBackgroundImage4
	.type	drawBackgroundImage4, %function
drawBackgroundImage4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L61
	ldr	r1, .L61+4
	ldr	r3, [r2]
	ldr	r2, [r2, #4]
	str	r0, [r3, #36]
	str	r2, [r3, #40]
	str	r1, [r3, #44]
	bx	lr
.L62:
	.align	2
.L61:
	.word	.LANCHOR0
	.word	-2147464448
	.size	drawBackgroundImage4, .-drawBackgroundImage4
	.align	2
	.global	drawImage4
	.type	drawImage4, %function
drawImage4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, lr}
	cmp	r3, #0
	ldr	r6, [sp, #20]
	ble	.L63
	mov	ip, r1
	mov	lr, #0
	ldr	r4, .L69
	add	r5, r1, r3
	add	r1, r6, r6, lsr #31
	rsb	r5, r5, r5, lsl #4
	rsb	ip, ip, ip, lsl #4
	mov	r1, r1, asr #1
	ldmia	r4, {r4, r7}
	add	r5, r2, r5, lsl #4
	orr	r1, r1, #-2147483648
	add	r2, r2, ip, lsl #4
.L65:
	add	ip, lr, lr, lsr #31
	add	r3, r2, r2, lsr #31
	bic	ip, ip, #1
	bic	r3, r3, #1
	add	r2, r2, #240
	add	ip, r0, ip
	add	r3, r7, r3
	cmp	r5, r2
	str	ip, [r4, #36]
	add	lr, lr, r6
	str	r3, [r4, #40]
	str	r1, [r4, #44]
	bne	.L65
.L63:
	ldmfd	sp!, {r4, r5, r6, r7, lr}
	bx	lr
.L70:
	.align	2
.L69:
	.word	.LANCHOR0
	.size	drawImage4, .-drawImage4
	.align	2
	.global	loadPalette
	.type	loadPalette, %function
loadPalette:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #83886080
	ldr	r3, .L72
	ldr	r2, .L72+4
	ldr	r3, [r3]
	str	r0, [r3, #36]
	str	r1, [r3, #40]
	str	r2, [r3, #44]
	bx	lr
.L73:
	.align	2
.L72:
	.word	.LANCHOR0
	.word	-2147483392
	.size	loadPalette, .-loadPalette
	.align	2
	.global	DMANow
	.type	DMANow, %function
DMANow:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L76
	str	lr, [sp, #-4]!
	add	r0, r0, r0, lsl #1
	ldr	lr, [ip]
	mov	r0, r0, asl #2
	add	ip, lr, r0
	orr	r3, r3, #-2147483648
	str	r1, [lr, r0]
	str	r2, [ip, #4]
	ldr	lr, [sp], #4
	str	r3, [ip, #8]
	bx	lr
.L77:
	.align	2
.L76:
	.word	.LANCHOR0
	.size	DMANow, .-DMANow
	.align	2
	.global	waitForVblank
	.type	waitForVblank, %function
waitForVblank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
.L79:
	ldrh	r3, [r2, #6]
	cmp	r3, #160
	bhi	.L79
	mov	r2, #67108864
.L81:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L81
	bx	lr
	.size	waitForVblank, .-waitForVblank
	.align	2
	.global	flipPage
	.type	flipPage, %function
flipPage:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
	ldrh	r3, [r2]
	ldr	r1, .L87
	tst	r3, #16
	ldrne	r0, [r1, #8]
	ldreq	r0, [r1, #12]
	bicne	r3, r3, #16
	orreq	r3, r3, #16
	strh	r3, [r2]	@ movhi
	str	r0, [r1, #4]
	bx	lr
.L88:
	.align	2
.L87:
	.word	.LANCHOR0
	.size	flipPage, .-flipPage
	.global	dma
	.global	backBuffer
	.global	frontBuffer
	.global	videoBuffer
	.comm	shadowOAM,1024,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	dma, %object
	.size	dma, 4
dma:
	.word	67109040
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.type	backBuffer, %object
	.size	backBuffer, 4
backBuffer:
	.word	100704256
	.type	frontBuffer, %object
	.size	frontBuffer, 4
frontBuffer:
	.word	100663296
	.ident	"GCC: (devkitARM release 45) 5.3.0"
