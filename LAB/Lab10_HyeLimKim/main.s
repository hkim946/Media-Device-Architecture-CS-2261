	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.align	2
	.global	goToStart
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r1, #7296
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L4
	strh	r1, [r2, #8]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L4+4
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L4+8
	ldr	r1, .L4+12
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L4+16
	ldr	r1, .L4+20
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+28
	mov	lr, pc
	bx	r3
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L4+32
	mov	r3, #512
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+40
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L4+44
	ldr	r3, .L4+48
	mov	lr, pc
	bx	r3
	mov	r2, #0
	ldr	r3, .L4+52
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L5:
	.align	2
.L4:
	.word	DMANow
	.word	startPal
	.word	19232
	.word	startTiles
	.word	100720640
	.word	startMap
	.word	hideSprites
	.word	waitForVBlank
	.word	shadowOAM
	.word	stopSound
	.word	startSong_length
	.word	startSong_data
	.word	playSoundA
	.word	state
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r2, #4352
	mov	r0, #7296
	mov	r1, #0
	push	{r4, lr}
	strh	r2, [r3]	@ movhi
	strh	r0, [r3, #8]	@ movhi
	ldr	r2, .L8
	ldr	r0, .L8+4
	ldrh	ip, [r2, #48]
	ldr	r2, .L8+8
	ldr	r3, .L8+12
	strh	ip, [r0]	@ movhi
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToStart
.L9:
	.align	2
.L8:
	.word	67109120
	.word	buttons
	.word	oldButtons
	.word	setupSounds
	.word	setupInterrupts
	.size	initialize, .-initialize
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r1, #7168
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L12
	strh	r1, [r2, #8]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L12+4
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L12+8
	ldr	r1, .L12+12
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L12+16
	mov	r0, #3
	ldr	r1, .L12+20
	mov	lr, pc
	bx	r4
	mov	r2, #1
	ldr	r3, .L12+24
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L13:
	.align	2
.L12:
	.word	DMANow
	.word	gamePal
	.word	7056
	.word	gameTiles
	.word	100720640
	.word	gameMap
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r1, #7296
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L16
	strh	r1, [r2, #8]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L16+4
	mov	lr, pc
	bx	r4
	mov	r3, #7552
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L16+8
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L16+12
	ldr	r1, .L16+16
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L16+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L16+24
	mov	lr, pc
	bx	r3
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L16+28
	mov	r3, #512
	mov	lr, pc
	bx	r4
	ldr	r3, .L16+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L16+36
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L16+40
	ldr	r3, .L16+44
	mov	lr, pc
	bx	r3
	ldr	r3, .L16+48
	mov	r2, #0
	ldr	r1, [r3]
	ldr	r0, .L16+52
	ldr	r3, .L16+56
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L16+60
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L17:
	.align	2
.L16:
	.word	DMANow
	.word	losePal
	.word	loseTiles
	.word	100720640
	.word	loseMap
	.word	hideSprites
	.word	waitForVBlank
	.word	shadowOAM
	.word	stopSound
	.word	loseSong_length
	.word	loseSong_data
	.word	playSoundA
	.word	sfxSound_length
	.word	sfxSound_data
	.word	playSoundB
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L25
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L25+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L18
	ldr	r3, .L25+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L24
.L18:
	pop	{r4, lr}
	bx	lr
.L24:
	pop	{r4, lr}
	b	goToStart
.L26:
	.align	2
.L25:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	lose, .-lose
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L29
	mov	lr, pc
	bx	r3
	ldr	r3, .L29+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L29+8
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L29+12
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L29+16
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L30:
	.align	2
.L29:
	.word	hideSprites
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L38
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L38+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L31
	ldr	r3, .L38+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L37
.L31:
	pop	{r4, lr}
	bx	lr
.L37:
	ldr	r3, .L38+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToGame
.L39:
	.align	2
.L38:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	unpauseSound
	.size	pause, .-pause
	.global	__aeabi_idivmod
	.align	2
	.global	initializeGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initializeGame, %function
initializeGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r5, #16
	mov	r6, #24
	ldr	r4, .L42
	ldr	r7, .L42+4
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L42+8
	ldr	r1, .L42+12
	mov	lr, pc
	bx	r7
	ldr	r8, .L42+16
	mov	r3, #16384
	ldr	r2, .L42+20
	ldr	r1, .L42+24
	mov	r0, #3
	mov	lr, pc
	bx	r7
	str	r5, [r4, #16]
	str	r6, [r4, #20]
	mov	lr, pc
	bx	r8
	ldr	r1, [r4, #20]
	ldr	r7, .L42+28
	rsb	r1, r1, #160
	mov	lr, pc
	bx	r7
	str	r1, [r4]
	mov	lr, pc
	bx	r8
	ldr	r1, [r4, #16]
	rsb	r1, r1, #240
	mov	lr, pc
	bx	r7
	mvn	r3, #0
	mov	r2, #0
	mov	r0, #3
	mov	lr, #72
	mov	ip, #112
	stmib	r4, {r1, r3}
	ldr	r3, .L42+32
	str	r6, [r4, #32]
	str	r2, [r4, #12]
	str	r2, [r4, #24]
	str	r2, [r4, #36]
	str	r2, [r4, #40]
	str	r0, [r4, #28]
	str	r5, [r3, #16]
	str	r5, [r3, #20]
	str	lr, [r3]
	str	r0, [r3, #8]
	str	r0, [r3, #12]
	str	r2, [r3, #24]
	str	r2, [r3, #32]
	str	r0, [r3, #36]
	str	r2, [r3, #40]
	str	ip, [r3, #4]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L43:
	.align	2
.L42:
	.word	rosie
	.word	DMANow
	.word	83886592
	.word	rosiePal
	.word	rand
	.word	100728832
	.word	rosieTiles
	.word	__aeabi_idivmod
	.word	bee
	.size	initializeGame, .-initializeGame
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L51
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L51+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L44
	ldr	r3, .L51+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L50
.L44:
	pop	{r4, lr}
	bx	lr
.L50:
	ldr	r3, .L51+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L51+16
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L51+20
	ldr	r3, .L51+24
	mov	lr, pc
	bx	r3
	bl	goToGame
	pop	{r4, lr}
	b	initializeGame
.L52:
	.align	2
.L51:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	stopSound
	.word	gameSong_length
	.word	gameSong_data
	.word	playSoundA
	.size	start, .-start
	.align	2
	.global	updateBee
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBee, %function
updateBee:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r5, .L68
	mov	lr, pc
	bx	r5
	ldr	r4, .L68+4
	smull	r3, r4, r0, r4
	sub	r4, r4, r0, asr #31
	add	r4, r4, r4, lsl #1
	sub	r4, r0, r4
	mov	lr, pc
	bx	r5
	cmp	r4, #1
	beq	.L54
	cmp	r4, #2
	beq	.L55
	cmp	r4, #0
	ldr	r4, .L68+8
	beq	.L56
	ldm	r4, {r2, r3}
.L57:
	cmp	r2, #0
	movlt	r1, #0
	movlt	r2, r1
	strlt	r1, [r4]
	ldr	r1, [r4, #20]
	rsb	r1, r1, #159
	cmp	r1, r2
	strlt	r1, [r4]
	cmp	r3, #0
	movlt	r2, #0
	movlt	r3, r2
	strlt	r2, [r4, #4]
	ldr	r2, [r4, #16]
	rsb	r2, r2, #239
	cmp	r2, r3
	strlt	r2, [r4, #4]
	pop	{r4, r5, r6, lr}
	bx	lr
.L54:
	ldr	r4, .L68+8
	tst	r0, #1
	ldr	r6, [r4, #12]
	beq	.L66
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	and	r0, r0, #1
	rsblt	r0, r0, #0
	add	r0, r0, #1
	mul	r0, r6, r0
	ldr	r3, [r4, #4]
	sub	r3, r3, r0
	str	r3, [r4, #4]
	ldr	r2, [r4]
	b	.L57
.L55:
	ldr	r4, .L68+8
	tst	r0, #1
	ldr	r6, [r4, #8]
	bne	.L67
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	and	r0, r0, #1
	ldr	r3, [r4]
	rsblt	r0, r0, #0
	add	r0, r0, #1
	mla	r0, r6, r0, r3
	ldr	r6, [r4, #12]
	str	r0, [r4]
.L66:
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	and	r3, r0, #1
	ldr	r2, [r4, #4]
	rsblt	r3, r3, #0
	add	r3, r3, #1
	mla	r3, r6, r3, r2
	ldr	r2, [r4]
	str	r3, [r4, #4]
	b	.L57
.L56:
	tst	r0, #1
	ldr	r6, [r4, #8]
	beq	.L58
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	and	r0, r0, #1
	rsblt	r0, r0, #0
	add	r0, r0, #1
	mul	r0, r6, r0
	ldr	r2, [r4]
	sub	r2, r2, r0
	str	r2, [r4]
	ldr	r3, [r4, #4]
	b	.L57
.L67:
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	and	r0, r0, #1
	rsblt	r0, r0, #0
	add	r0, r0, #1
	mul	r0, r6, r0
	ldr	r3, [r4]
	sub	r0, r3, r0
	ldr	r6, [r4, #12]
	str	r0, [r4]
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	and	r3, r0, #1
	rsblt	r3, r3, #0
	add	r3, r3, #1
	mul	r2, r6, r3
	ldr	r3, [r4, #4]
	sub	r3, r3, r2
	str	r3, [r4, #4]
	ldr	r2, [r4]
	b	.L57
.L58:
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	and	r2, r0, #1
	ldr	r3, [r4]
	rsblt	r2, r2, #0
	add	r2, r2, #1
	mla	r2, r6, r2, r3
	ldr	r3, [r4, #4]
	str	r2, [r4]
	b	.L57
.L69:
	.align	2
.L68:
	.word	rand
	.word	1431655766
	.word	bee
	.size	updateBee, .-updateBee
	.align	2
	.global	updateRosie
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateRosie, %function
updateRosie:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L100
	ldr	r1, [r3]
	ldr	r2, [r3, #8]
	add	r1, r1, r2
	ldr	r2, .L100+4
	push	{r4, r5, lr}
	ldrh	r0, [r2, #48]
	ldr	ip, [r3, #24]
	ldr	lr, [r3, #4]
	ldr	r2, [r3, #12]
	add	ip, ip, #1
	add	r2, lr, r2
	ands	r0, r0, #32
	str	r1, [r3]
	str	ip, [r3, #24]
	str	r2, [r3, #4]
	bne	.L71
	mvn	r4, #0
	mov	lr, #2
	str	r0, [r3, #8]
	str	r0, [r3, #32]
	str	r4, [r3, #12]
	str	lr, [r3, #40]
.L71:
	ldr	r0, .L100+4
	ldrh	r0, [r0, #48]
	ands	r0, r0, #16
	bne	.L72
	mov	r4, #1
	mov	lr, #3
	str	r0, [r3, #8]
	str	r0, [r3, #32]
	str	r4, [r3, #12]
	str	lr, [r3, #40]
.L72:
	ldr	lr, .L100+4
	ldrh	r0, [lr, #48]
	ands	r0, r0, #64
	bne	.L73
	mvn	r5, #0
	mov	r4, #24
	ldrh	lr, [lr, #48]
	tst	lr, #128
	str	r0, [r3, #12]
	str	r0, [r3, #40]
	str	r5, [r3, #8]
	str	r4, [r3, #32]
	bne	.L74
.L76:
	mov	r0, #1
	mov	r4, #0
	mov	lr, #12
	str	r4, [r3, #12]
	str	r0, [r3, #8]
	str	r0, [r3, #40]
	str	lr, [r3, #32]
.L75:
	cmp	r1, #0
	movlt	lr, #0
	movlt	r1, lr
	strlt	lr, [r3]
.L78:
	ldr	lr, [r3, #20]
	rsb	lr, lr, #159
	cmp	lr, r1
	strlt	lr, [r3]
	cmp	r2, #0
	movlt	r1, #0
	movlt	r2, r1
	strlt	r1, [r3, #4]
	ldr	r1, [r3, #16]
	rsb	r1, r1, #239
	cmp	r1, r2
	strlt	r1, [r3, #4]
	cmp	ip, #10
	beq	.L98
	pop	{r4, r5, lr}
	bx	lr
.L74:
	cmp	r1, #39
	cmple	r2, #49
	movle	r1, #40
	movle	r0, #1
	movgt	r0, #0
	movle	r0, #0
	strle	r1, [r3]
	bgt	.L75
	b	.L78
.L73:
	ldrh	r0, [lr, #48]
	tst	r0, #128
	beq	.L76
	ldr	r0, [r3, #40]
	cmp	r0, #0
	beq	.L74
	cmp	r0, #2
	bne	.L75
	cmp	r2, #49
	bgt	.L75
	cmp	r1, #39
	bgt	.L78
	mov	r2, #50
	str	r2, [r3, #4]
	b	.L75
.L98:
	cmp	r0, #0
	ldr	r2, [r3, #32]
	beq	.L85
	cmp	r0, #1
	bne	.L99
	sub	r1, r2, #12
	cmp	r1, #7
	movhi	r2, #12
	strhi	r2, [r3, #32]
	bhi	.L89
.L91:
	add	r2, r2, #4
	str	r2, [r3, #32]
.L89:
	mov	r2, #0
	pop	{r4, r5, lr}
	str	r2, [r3, #24]
	bx	lr
.L99:
	cmp	r2, #7
	movgt	r2, #0
	strgt	r2, [r3, #32]
	bgt	.L89
	b	.L91
.L85:
	sub	r1, r2, #24
	cmp	r1, #3
	movhi	r2, #24
	strhi	r2, [r3, #32]
	bhi	.L89
	b	.L91
.L101:
	.align	2
.L100:
	.word	rosie
	.word	67109120
	.size	updateRosie, .-updateRosie
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	updateRosie
	pop	{r4, lr}
	b	updateBee
	.size	updateGame, .-updateGame
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L108
	ldr	r2, [r3, #40]
	cmp	r2, #3
	push	{r4, r5, r6, r7, lr}
	moveq	r7, #4096
	movne	r7, #0
	ldr	r6, .L108+4
	ldr	r5, [r3, #4]
	ldr	r0, .L108+8
	ldr	r4, [r6, #4]
	and	r1, r5, r0
	ldr	r2, [r3]
	ldr	ip, [r3, #36]
	orr	lr, r7, r1
	and	r4, r4, r0
	ldrh	r0, [r3, #32]
	ldr	r3, .L108+12
	orr	r4, r4, #16384
	orr	lr, lr, #16384
	orr	r5, r7, r1
	strh	r4, [r3, #18]	@ movhi
	ldr	r7, [r6, #36]
	ldrb	r4, [r6]	@ zero_extendqisi2
	add	r1, r2, #16
	strh	lr, [r3, #2]	@ movhi
	ldr	lr, [r6, #32]
	strh	r5, [r3, #10]	@ movhi
	and	r2, r2, #255
	add	r5, ip, #2
	and	r1, r1, #255
	orr	r4, r4, #8192
	add	lr, lr, r7, lsl #5
	add	ip, r0, ip, lsl #5
	orr	r2, r2, #8192
	add	r0, r0, r5, lsl #5
	orr	r1, r1, #24576
	strh	r4, [r3, #16]	@ movhi
	strh	lr, [r3, #20]	@ movhi
	strh	r2, [r3]	@ movhi
	strh	r1, [r3, #8]	@ movhi
	strh	ip, [r3, #4]	@ movhi
	strh	r0, [r3, #12]	@ movhi
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L109:
	.align	2
.L108:
	.word	rosie
	.word	bee
	.word	511
	.word	shadowOAM
	.size	drawGame, .-drawGame
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	sub	sp, sp, #20
	bl	updateRosie
	ldr	r4, .L124
	bl	updateBee
	bl	drawGame
	ldr	r3, .L124+4
	mov	lr, pc
	bx	r3
	ldr	r5, .L124+8
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L124+12
	mov	lr, pc
	bx	r5
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L111
	ldr	r2, .L124+16
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L121
.L111:
	tst	r3, #4
	beq	.L112
	ldr	r3, .L124+16
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L122
.L112:
	ldr	r3, .L124+20
	add	r1, r3, #16
	ldm	r1, {r1, ip}
	ldm	r3, {r2, r3}
	ldr	r0, .L124+24
	str	r2, [sp, #4]
	str	ip, [sp, #12]
	str	r1, [sp, #8]
	str	r3, [sp]
	add	r2, r0, #16
	ldr	r1, [r0]
	ldm	r2, {r2, r3}
	ldr	r0, [r0, #4]
	ldr	r4, .L124+28
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	bne	.L123
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L123:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	b	goToLose
.L122:
	bl	goToStart
	b	.L112
.L121:
	ldr	r3, .L124+32
	mov	lr, pc
	bx	r3
	bl	goToPause
	ldrh	r3, [r4]
	b	.L111
.L125:
	.align	2
.L124:
	.word	oldButtons
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.word	buttons
	.word	bee
	.word	rosie
	.word	collision
	.word	pauseSound
	.size	game, .-game
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r7, fp, lr}
	ldr	r3, .L137
	mov	lr, pc
	bx	r3
	ldr	r6, .L137+4
	ldr	fp, .L137+8
	ldr	r5, .L137+12
	ldr	r10, .L137+16
	ldr	r9, .L137+20
	ldr	r8, .L137+24
	ldr	r7, .L137+28
	ldr	r4, .L137+32
.L127:
	ldr	r2, [r6]
	ldrh	r3, [fp]
.L128:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [fp]	@ movhi
	cmp	r2, #3
	ldrls	pc, [pc, r2, asl #2]
	b	.L128
.L130:
	.word	.L133
	.word	.L132
	.word	.L131
	.word	.L129
.L129:
	mov	lr, pc
	bx	r7
	b	.L127
.L131:
	mov	lr, pc
	bx	r8
	b	.L127
.L132:
	mov	lr, pc
	bx	r9
	b	.L127
.L133:
	mov	lr, pc
	bx	r10
	b	.L127
.L138:
	.align	2
.L137:
	.word	initialize
	.word	state
	.word	buttons
	.word	oldButtons
	.word	start
	.word	game
	.word	pause
	.word	lose
	.word	67109120
	.size	main, .-main
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.comm	shadowOAM,1024,4
	.comm	bee,44,4
	.comm	rosie,44,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
