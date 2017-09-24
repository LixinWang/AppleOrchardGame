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
	.file	"main.c"
	.text
	.align	2
	.global	initialize
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r1, #4352
	mov	r2, #56064
	stmfd	sp!, {r4, lr}
	ldr	r0, .L6
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ldr	r3, .L6+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L6+8
	ldr	r3, .L6+12
	mov	r2, #100663296
	ldr	r1, .L6+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L6+20
	ldr	r1, .L6+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #0
	mov	r1, #512
	ldr	r2, .L6+28
.L2:
	strh	r1, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L2
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L6+28
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #0
	mov	r2, #67108864
	ldr	r1, .L6+32
	ldr	ip, .L6+36
	str	r3, [r1]
	ldr	r0, .L6+40
	ldr	r1, .L6+44
	str	r3, [r0]
	str	r3, [ip]
	ldr	lr, .L6+48
	ldr	ip, [r1]
	ldr	r0, .L6+52
	str	r3, [lr]
	strh	r3, [r2, #16]	@ movhi
	strh	r3, [r2, #20]	@ movhi
	str	ip, [r0]
	ldr	r0, .L6+56
	ldr	ip, [r2, #304]
	ldr	r2, .L6+60
	str	ip, [r1]
	str	r3, [r0]
	str	r3, [r2]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L7:
	.align	2
.L6:
	.word	menubgPal
	.word	loadPalette
	.word	DMANow
	.word	7472
	.word	menubgTiles
	.word	100718592
	.word	menubgMap
	.word	shadowOAM
	.word	oldhOff
	.word	time
	.word	hOff
	.word	buttons
	.word	score
	.word	oldButtons
	.word	state
	.word	oldState
	.size	initialize, .-initialize
	.align	2
	.global	initGame
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	mov	r4, #2
	mov	r3, #32
	mov	r8, #128
	mov	r7, #104
	mov	r6, #3
	mov	r5, #5
	mov	ip, #0
	mov	lr, #1
	ldr	r0, .L12
	str	r4, [r0, #8]
	ldr	r4, .L12+4
	mov	r1, r3
	str	r3, [r0, #12]
	str	r3, [r0, #16]
	ldr	r3, .L12+8
	str	r8, [r0]
	str	r7, [r0, #4]
	str	r6, [r0, #24]
	str	r5, [r4]
	mov	r2, ip
	str	ip, [r0, #20]
	str	ip, [r0, #28]
	add	ip, r3, #160
.L9:
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	str	lr, [r3, #16]
	str	r2, [r3, #20]
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	add	r3, r3, #32
	cmp	r3, ip
	mov	r0, #0
	bne	.L9
	mov	r3, #67108864
	ldr	lr, .L12+12
	ldr	ip, .L12+16
	ldr	r1, .L12+20
	ldr	r2, .L12+24
	str	r0, [lr]
	str	r0, [ip]
	str	r0, [r1]
	str	r0, [r2]
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	strh	r0, [r3, #16]	@ movhi
	bx	lr
.L13:
	.align	2
.L12:
	.word	basket
	.word	appleCount
	.word	apples
	.word	score
	.word	.LANCHOR0
	.word	oldhOff
	.word	hOff
	.size	initGame, .-initGame
	.align	2
	.global	hideSprites
	.type	hideSprites, %function
hideSprites:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	mov	r1, #512
	ldr	r2, .L17
.L15:
	strh	r1, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L15
	bx	lr
.L18:
	.align	2
.L17:
	.word	shadowOAM
	.size	hideSprites, .-hideSprites
	.align	2
	.global	updateOAM
	.type	updateOAM, %function
updateOAM:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L38
	ldr	r2, [r3, #20]
	cmp	r2, #0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	bne	.L20
	ldr	r2, [r3, #4]
	mov	r2, r2, asl #23
	mvn	r2, r2, lsr #6
	mov	r1, #160
.L35:
	mvn	r2, r2, lsr #17
	ldrb	r0, [r3]	@ zero_extendqisi2
	ldr	r3, .L38+4
	strh	r2, [r3, #2]	@ movhi
	strh	r0, [r3]	@ movhi
	strh	r1, [r3, #4]	@ movhi
.L23:
	ldr	r3, .L38+8
	ldr	r4, [r3]
	cmp	r4, #0
	ble	.L31
	mov	r1, #1
	mov	r5, #512
	ldr	r3, .L38+12
	ldr	lr, .L38+16
	ldr	r0, [r3]
	smull	r2, r3, lr, r0
	mov	lr, r0, asr #31
	rsb	lr, lr, r3, asr r1
	add	lr, lr, lr, lsl #2
	ldr	r3, .L38+20
	ldr	r2, .L38+4
	ldr	r9, .L38+24
	ldr	r8, .L38+28
	ldr	r7, .L38+32
	ldr	r6, .L38+36
	rsb	lr, lr, r0
.L30:
	ldr	r0, [r3]
	cmp	r0, #0
	moveq	r0, r1
	streqh	r5, [r2, #8]	@ movhi
	beq	.L27
	ldr	r0, [r3, #4]
	cmp	r0, #1
	beq	.L36
	cmp	r0, #3
	beq	.L37
	ldr	ip, [r3, #-20]
	mov	ip, ip, asl #23
	mvn	ip, ip, lsr #6
	add	r10, r0, #1
	mvn	ip, ip, lsr #17
	mov	r0, r0, asl #2
	orr	r0, r0, r10, asl #12
	strh	r0, [r2, #12]	@ movhi
	mov	r0, r1
	ldrb	r10, [r3, #-24]	@ zero_extendqisi2
	strh	ip, [r2, #10]	@ movhi
	strh	r10, [r2, #8]	@ movhi
.L27:
	cmp	r0, r4
	add	r3, r3, #32
	add	r1, r1, #1
	add	r2, r2, #8
	blt	.L30
.L31:
	ldr	r3, .L38+40
	mov	lr, pc
	bx	r3
	ldr	r3, .L38+44
	mov	lr, pc
	bx	r3
	ldr	r3, .L38+48
	mov	lr, pc
	bx	r3
	ldr	r3, .L38+52
	mov	lr, pc
	bx	r3
	ldr	r3, .L38+56
	mov	lr, pc
	bx	r3
	ldr	r4, .L38+60
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L38+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L36:
	ldr	r0, [r3, #-20]
	mov	r0, r0, asl #23
	mvn	r0, r0, lsr #6
	mvn	r0, r0, lsr #17
	ldrb	ip, [r3, #-24]	@ zero_extendqisi2
	cmp	lr, #0
	strh	r0, [r2, #10]	@ movhi
	streqh	r6, [r2, #12]	@ movhi
	strneh	r7, [r2, #12]	@ movhi
	strh	ip, [r2, #8]	@ movhi
	mov	r0, r1
	b	.L27
.L37:
	ldr	r0, [r3, #-20]
	mov	r0, r0, asl #23
	mvn	r0, r0, lsr #6
	mvn	r0, r0, lsr #17
	ldrb	ip, [r3, #-24]	@ zero_extendqisi2
	cmp	lr, #0
	strh	r0, [r2, #10]	@ movhi
	streqh	r8, [r2, #12]	@ movhi
	strneh	r9, [r2, #12]	@ movhi
	strh	ip, [r2, #8]	@ movhi
	mov	r0, r1
	b	.L27
.L20:
	cmp	r2, #1
	ldr	r2, [r3, #4]
	mov	r2, r2, asl #23
	mvneq	r2, r2, lsr #6
	moveq	r1, #164
	beq	.L35
	mvn	r2, r2, lsr #5
	mov	r0, #168
	mvn	r2, r2, lsr #18
	ldrb	r1, [r3]	@ zero_extendqisi2
	ldr	r3, .L38+4
	orr	r1, r1, #16384
	strh	r2, [r3, #2]	@ movhi
	strh	r1, [r3]	@ movhi
	strh	r0, [r3, #4]	@ movhi
	b	.L23
.L39:
	.align	2
.L38:
	.word	basket
	.word	shadowOAM
	.word	appleCount
	.word	time
	.word	1717986919
	.word	apples+24
	.word	16396
	.word	16404
	.word	8196
	.word	8208
	.word	displayScore
	.word	drawLives
	.word	drawWarning
	.word	drawPauseText
	.word	drawNumApples
	.word	DMANow
	.size	updateOAM, .-updateOAM
	.align	2
	.global	goToMenu
	.type	goToMenu, %function
goToMenu:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r1, #4352
	mov	r2, #56064
	stmfd	sp!, {r4, lr}
	ldr	r0, .L44
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ldr	r3, .L44+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L44+8
	ldr	r3, .L44+12
	mov	r2, #100663296
	ldr	r1, .L44+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L44+20
	ldr	r1, .L44+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #0
	mov	r1, #512
	ldr	r2, .L44+28
.L41:
	strh	r1, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L41
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L44+28
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #0
	mov	r1, #67108864
	ldr	r0, .L44+32
	ldr	r2, .L44+36
	str	r3, [r0]
	strh	r3, [r1, #16]	@ movhi
	ldr	r0, [r2]
	ldr	r1, .L44+40
	str	r3, [r2]
	str	r0, [r1]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L45:
	.align	2
.L44:
	.word	menubgPal
	.word	loadPalette
	.word	DMANow
	.word	7472
	.word	menubgTiles
	.word	100718592
	.word	menubgMap
	.word	shadowOAM
	.word	hOff
	.word	state
	.word	oldState
	.size	goToMenu, .-goToMenu
	.align	2
	.type	end.part.3, %function
end.part.3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	mov	r3, #1
	ldr	r4, .L48
	ldr	r2, .L48+4
	ldr	r1, .L48+8
	ldr	r0, .L48+12
	mov	lr, pc
	bx	r4
	ldmfd	sp!, {r4, lr}
	b	goToMenu
.L49:
	.align	2
.L48:
	.word	playSoundA
	.word	11025
	.word	1289088
	.word	menuSong
	.size	end.part.3, .-end.part.3
	.set	instructions.part.1,end.part.3
	.set	pause.part.2,end.part.3
	.align	2
	.global	goToInstruct
	.type	goToInstruct, %function
goToInstruct:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r1, #4352
	mov	r2, #56064
	stmfd	sp!, {r4, lr}
	ldr	r0, .L54
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ldr	r3, .L54+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L54+8
	ldr	r3, .L54+12
	mov	r2, #100663296
	ldr	r1, .L54+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L54+20
	ldr	r1, .L54+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #0
	mov	r1, #512
	ldr	r2, .L54+28
.L51:
	strh	r1, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L51
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L54+28
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #0
	mov	r1, #67108864
	mov	r0, #1
	ldr	r3, .L54+32
	ldr	ip, .L54+36
	str	r2, [ip]
	strh	r2, [r1, #16]	@ movhi
	ldr	r1, [r3]
	ldr	r2, .L54+40
	str	r0, [r3]
	str	r1, [r2]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L55:
	.align	2
.L54:
	.word	instructbgPal
	.word	loadPalette
	.word	DMANow
	.word	9248
	.word	instructbgTiles
	.word	100718592
	.word	instructbgMap
	.word	shadowOAM
	.word	state
	.word	hOff
	.word	oldState
	.size	goToInstruct, .-goToInstruct
	.align	2
	.global	goToGame
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r1, #4864
	mov	r0, #23808
	ldr	r2, .L60
	stmfd	sp!, {r4, r5, r6, lr}
	strh	r0, [r3, #8]	@ movhi
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #10]	@ movhi
	ldr	r0, .L60+4
	ldr	r3, .L60+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L60+12
	ldr	r3, .L60+16
	mov	r2, #100663296
	ldr	r1, .L60+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	ldr	r2, .L60+24
	ldr	r1, .L60+28
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L60+32
	ldr	r2, .L60+36
	ldr	r1, .L60+40
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r5, .L60+44
	mov	r3, #26
	mov	r2, #2
	mov	r1, #2048
	ldr	r0, .L60+48
	mov	lr, pc
	bx	r5
	mov	r3, #16384
	ldr	r2, .L60+52
	ldr	r1, .L60+56
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #256
	ldr	r2, .L60+60
	ldr	r1, .L60+64
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #0
	mov	r1, #512
	ldr	r2, .L60+68
.L57:
	strh	r1, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L57
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L60+68
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r1, #67108864
	mov	r0, #2
	ldr	r3, .L60+72
	ldr	ip, .L60+76
	ldr	r2, [r3]
	mov	r3, r2, asl #16
	str	r2, [ip]
	ldr	r2, .L60+80
	mov	r3, r3, lsr #16
	strh	r3, [r1, #16]	@ movhi
	ldr	r1, [r2]
	ldr	r3, .L60+84
	str	r0, [r2]
	str	r1, [r3]
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L61:
	.align	2
.L60:
	.word	6660
	.word	frontTrees1Pal
	.word	loadPalette
	.word	DMANow
	.word	6992
	.word	frontTrees1Tiles
	.word	100722688
	.word	frontTrees1Map
	.word	6768
	.word	100679680
	.word	farmTiles
	.word	loadMap
	.word	farmMap
	.word	100728832
	.word	appleSprites2Tiles
	.word	83886592
	.word	appleSprites2Pal
	.word	shadowOAM
	.word	oldhOff
	.word	hOff
	.word	state
	.word	oldState
	.size	goToGame, .-goToGame
	.align	2
	.global	goToPause
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r1, #4352
	mov	r2, #56064
	stmfd	sp!, {r4, lr}
	ldr	r0, .L66
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ldr	r3, .L66+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L66+8
	mov	r3, #7872
	mov	r2, #100663296
	ldr	r1, .L66+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L66+16
	ldr	r1, .L66+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #0
	mov	r1, #512
	ldr	r2, .L66+24
.L63:
	strh	r1, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L63
	ldr	r3, .L66+28
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L66+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #0
	mov	ip, #67108864
	mov	r0, #3
	ldr	r1, .L66+32
	ldr	lr, .L66+36
	ldr	r4, [r1]
	ldr	r3, .L66+40
	str	r2, [r1]
	str	r4, [lr]
	ldr	r1, [r3]
	strh	r2, [ip, #16]	@ movhi
	ldr	r2, .L66+44
	str	r0, [r3]
	str	r1, [r2]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L67:
	.align	2
.L66:
	.word	pausebgPal
	.word	loadPalette
	.word	DMANow
	.word	pausebgTiles
	.word	100718592
	.word	pausebgMap
	.word	shadowOAM
	.word	displayFinalScore
	.word	hOff
	.word	oldhOff
	.word	state
	.word	oldState
	.size	goToPause, .-goToPause
	.align	2
	.global	goToEnd
	.type	goToEnd, %function
goToEnd:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r1, #4352
	mov	r2, #56064
	stmfd	sp!, {r4, lr}
	ldr	r0, .L72
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ldr	r3, .L72+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L72+8
	ldr	r3, .L72+12
	mov	r2, #100663296
	ldr	r1, .L72+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L72+20
	ldr	r1, .L72+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #0
	mov	r1, #512
	ldr	r2, .L72+28
.L69:
	strh	r1, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L69
	ldr	r3, .L72+32
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L72+28
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1
	ldr	r2, .L72+36
	ldr	r1, .L72+40
	ldr	r0, .L72+44
	ldr	r4, .L72+48
	mov	lr, pc
	bx	r4
	mov	r2, #0
	mov	r1, #67108864
	mov	r0, #4
	ldr	r3, .L72+52
	ldr	ip, .L72+56
	str	r2, [ip]
	strh	r2, [r1, #16]	@ movhi
	ldr	r1, [r3]
	ldr	r2, .L72+60
	str	r0, [r3]
	str	r1, [r2]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L73:
	.align	2
.L72:
	.word	endbgPal
	.word	loadPalette
	.word	DMANow
	.word	8400
	.word	endbgTiles
	.word	100718592
	.word	endbgMap
	.word	shadowOAM
	.word	displayFinalScore
	.word	11025
	.word	190080
	.word	endSong
	.word	playSoundA
	.word	state
	.word	hOff
	.word	oldState
	.size	goToEnd, .-goToEnd
	.align	2
	.global	menu
	.type	menu, %function
menu:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r4, .L86
	ldr	r3, [r4]
	tst	r3, #8
	beq	.L75
	ldr	r2, .L86+4
	ldr	r2, [r2]
	tst	r2, #8
	beq	.L84
.L75:
	tst	r3, #4
	beq	.L74
	ldr	r3, .L86+4
	ldr	r3, [r3]
	tst	r3, #4
	beq	.L85
.L74:
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L85:
	ldr	r4, .L86+8
	mov	r3, #1
	ldr	r2, .L86+12
	ldr	r1, .L86+16
	ldr	r0, .L86+20
	mov	lr, pc
	bx	r4
	ldmfd	sp!, {r4, r5, r6, lr}
	b	goToInstruct
.L84:
	mov	r3, #1
	ldr	r2, .L86+12
	ldr	r1, .L86+24
	ldr	r0, .L86+28
	ldr	r5, .L86+8
	mov	lr, pc
	bx	r5
	bl	initGame
	bl	goToGame
	ldr	r3, [r4]
	b	.L75
.L87:
	.align	2
.L86:
	.word	oldButtons
	.word	buttons
	.word	playSoundA
	.word	11025
	.word	555552
	.word	instructSong
	.word	841536
	.word	gameSong
	.size	menu, .-menu
	.align	2
	.global	instructions
	.type	instructions, %function
instructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r4, .L102
	ldr	r3, [r4]
	tst	r3, #8
	beq	.L89
	ldr	r2, .L102+4
	ldr	r2, [r2]
	tst	r2, #8
	beq	.L99
.L89:
	tst	r3, #4
	beq	.L88
	ldr	r3, .L102+4
	ldr	r3, [r3]
	tst	r3, #4
	beq	.L100
.L88:
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L99:
	ldr	r3, .L102+8
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L101
.L90:
	mov	r3, #1
	ldr	r2, .L102+12
	ldr	r1, .L102+16
	ldr	r0, .L102+20
	ldr	r5, .L102+24
	mov	lr, pc
	bx	r5
	bl	goToGame
	ldr	r3, [r4]
	b	.L89
.L100:
	ldmfd	sp!, {r4, r5, r6, lr}
	b	instructions.part.1
.L101:
	bl	initGame
	b	.L90
.L103:
	.align	2
.L102:
	.word	oldButtons
	.word	buttons
	.word	oldState
	.word	11025
	.word	841536
	.word	gameSong
	.word	playSoundA
	.size	instructions, .-instructions
	.align	2
	.global	game
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r4, .L119
	ldr	r3, [r4, #24]
	cmp	r3, #0
	beq	.L105
	mov	r3, #0
	mov	r1, #512
	ldr	r2, .L119+4
.L106:
	strh	r1, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L106
	ldr	r3, .L119+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L119+12
	mov	lr, pc
	bx	r3
	bl	updateOAM
.L107:
	ldr	r5, .L119+16
	ldr	r3, [r5]
	tst	r3, #8
	beq	.L108
	ldr	r2, .L119+20
	ldr	r2, [r2]
	tst	r2, #8
	beq	.L117
.L108:
	tst	r3, #64
	beq	.L110
	ldr	r3, .L119+20
	ldr	r3, [r3]
	ands	r3, r3, #64
	bne	.L110
	ldr	r1, .L119+24
	ldr	r2, [r1]
	add	r2, r2, #1
	cmp	r2, #4
	str	r2, [r1]
	beq	.L118
.L110:
	mov	r1, #67108864
	ldr	r3, .L119+28
	ldr	r3, [r3]
	add	r2, r3, r3, lsr #31
	mov	r2, r2, asl #15
	mov	r3, r3, asl #16
	mov	r2, r2, lsr #16
	mov	r3, r3, lsr #16
	strh	r3, [r1, #16]	@ movhi
	ldmfd	sp!, {r4, r5, r6, lr}
	strh	r2, [r1, #20]	@ movhi
	bx	lr
.L105:
	bl	goToEnd
	b	.L107
.L117:
	ldr	r3, .L119+32
	mov	lr, pc
	bx	r3
	bl	goToPause
	ldr	r3, [r5]
	b	.L108
.L118:
	ldr	r2, .L119+36
	ldr	r1, .L119+40
	ldr	r0, .L119+44
	ldr	r5, .L119+48
	mov	lr, pc
	bx	r5
	ldr	r3, [r4, #24]
	add	r3, r3, #1
	str	r3, [r4, #24]
	b	.L110
.L120:
	.align	2
.L119:
	.word	basket
	.word	shadowOAM
	.word	update
	.word	waitForVblank
	.word	oldButtons
	.word	buttons
	.word	.LANCHOR0
	.word	hOff
	.word	pauseSound
	.word	11025
	.word	2940
	.word	gainLifeSFX
	.word	playSoundB
	.size	game, .-game
	.align	2
	.global	pause
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r4, .L138
	ldr	r3, [r4]
	tst	r3, #8
	beq	.L122
	ldr	r2, .L138+4
	ldr	r2, [r2]
	tst	r2, #8
	beq	.L136
.L122:
	tst	r3, #4
	beq	.L123
	ldr	r2, .L138+4
	ldr	r2, [r2]
	tst	r2, #4
	beq	.L137
.L123:
	tst	r3, #1
	beq	.L121
	ldr	r3, .L138+4
	ldr	r3, [r3]
	tst	r3, #1
	ldmeqfd	sp!, {r4, r5, r6, lr}
	beq	pause.part.2
.L121:
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L137:
	mov	r3, #1
	ldr	r2, .L138+8
	ldr	r1, .L138+12
	ldr	r0, .L138+16
	ldr	r5, .L138+20
	mov	lr, pc
	bx	r5
	bl	goToInstruct
	ldr	r3, [r4]
	b	.L123
.L136:
	ldr	r3, .L138+24
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldr	r3, [r4]
	b	.L122
.L139:
	.align	2
.L138:
	.word	oldButtons
	.word	buttons
	.word	11025
	.word	555552
	.word	instructSong
	.word	playSoundA
	.word	unpauseSound
	.size	pause, .-pause
	.align	2
	.global	end
	.type	end, %function
end:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L145
	ldr	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L145+4
	ldr	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	end.part.3
.L146:
	.align	2
.L145:
	.word	oldButtons
	.word	buttons
	.size	end, .-end
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r9, #67108864
	stmfd	sp!, {r4, r7, fp, lr}
	ldr	r3, .L157
	mov	lr, pc
	bx	r3
	ldr	r3, .L157+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L157+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L157+12
	mov	r3, #1
	ldr	r2, .L157+16
	ldr	r1, .L157+20
	ldr	r0, .L157+24
	mov	lr, pc
	bx	r4
	ldr	r8, .L157+28
	ldr	r4, .L157+32
	ldr	r7, .L157+36
	ldr	fp, .L157+40
	ldr	r10, .L157+44
	ldr	r6, .L157+48
	ldr	r5, .L157+52
.L155:
	ldr	r3, [r4]
	str	r3, [r8]
	ldr	r3, [r7]
	ldr	r2, [r9, #304]
	str	r2, [r4]
	cmp	r3, #4
	ldrls	pc, [pc, r3, asl #2]
	b	.L148
.L150:
	.word	.L149
	.word	.L151
	.word	.L152
	.word	.L153
	.word	.L154
.L154:
	ldr	r3, .L157+56
	mov	lr, pc
	bx	r3
.L148:
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L157+60
	mov	r0, #3
	mov	lr, pc
	bx	r6
	mov	lr, pc
	bx	r5
	b	.L155
.L153:
	ldr	r3, .L157+64
	mov	lr, pc
	bx	r3
	b	.L148
.L152:
	ldr	r3, .L157+68
	mov	lr, pc
	bx	r3
	b	.L148
.L149:
	mov	lr, pc
	bx	fp
	b	.L148
.L151:
	mov	lr, pc
	bx	r10
	b	.L148
.L158:
	.align	2
.L157:
	.word	initialize
	.word	setupSounds
	.word	setupInterrupts
	.word	playSoundA
	.word	11025
	.word	1289088
	.word	menuSong
	.word	oldButtons
	.word	buttons
	.word	state
	.word	menu
	.word	instructions
	.word	DMANow
	.word	waitForVblank
	.word	end
	.word	shadowOAM
	.word	pause
	.word	game
	.size	main, .-main
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
	.comm	oldState,4,4
	.comm	state,4,4
	.global	cheatCounter
	.comm	shadowOAM,1024,4
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	cheatCounter, %object
	.size	cheatCounter, 4
cheatCounter:
	.space	4
	.ident	"GCC: (devkitARM release 45) 5.3.0"
