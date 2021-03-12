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
	push	{r4, lr}
	mov	r2, #83886080
	ldr	r1, .L4
	mov	r3, #256
	mov	r0, #3
	ldr	r4, .L4+4
	mov	lr, pc
	bx	r4
	ldr	r0, .L4+8
	ldr	r3, .L4+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+20
	mov	lr, pc
	bx	r3
	mov	r3, #0
	ldr	r1, .L4+24
	ldr	r2, .L4+28
	str	r3, [r1]
	str	r3, [r2]
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	startPal
	.word	DMANow
	.word	startBitmap
	.word	drawFullscreenImage4
	.word	waitForVBlank
	.word	flipPage
	.word	state
	.word	seed
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
	@ link register save eliminated.
	mov	r3, #67108864
	ldr	r2, .L7
	strh	r2, [r3]	@ movhi
	b	goToStart
.L8:
	.align	2
.L7:
	.word	1044
	.size	initialize, .-initialize
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
	push	{r4, lr}
	ldr	r4, .L16
	ldr	r3, [r4]
	ldr	r2, .L16+4
	add	r3, r3, #1
	str	r3, [r4]
	mov	lr, pc
	bx	r2
	ldr	r3, .L16+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L9
	ldr	r3, .L16+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L15
.L9:
	pop	{r4, lr}
	bx	lr
.L15:
	ldr	r0, [r4]
	ldr	r3, .L16+16
	mov	lr, pc
	bx	r3
	ldr	r4, .L16+20
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L16+24
	mov	lr, pc
	bx	r4
	mov	r1, #1
	ldr	r2, .L16+28
	ldr	r3, .L16+32
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L17:
	.align	2
.L16:
	.word	seed
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	srand
	.word	DMANow
	.word	alienPal
	.word	state
	.word	initGame
	.size	start, .-start
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
	push	{r4, lr}
	mov	r3, #256
	mov	r2, #83886080
	ldr	r4, .L20
	mov	r0, #3
	ldr	r1, .L20+4
	mov	lr, pc
	bx	r4
	mov	r2, #1
	ldr	r3, .L20+8
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L21:
	.align	2
.L20:
	.word	DMANow
	.word	alienPal
	.word	state
	.size	goToGame, .-goToGame
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
	mov	r2, #83886080
	ldr	r1, .L24
	mov	r3, #256
	mov	r0, #3
	ldr	r4, .L24+4
	mov	lr, pc
	bx	r4
	ldr	r0, .L24+8
	ldr	r3, .L24+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L24+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L24+20
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L24+24
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L25:
	.align	2
.L24:
	.word	pausePal
	.word	DMANow
	.word	pauseBitmap
	.word	drawFullscreenImage4
	.word	waitForVBlank
	.word	flipPage
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
	beq	.L27
	ldr	r2, .L38+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L36
.L27:
	tst	r3, #4
	beq	.L26
	ldr	r3, .L38+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L37
.L26:
	pop	{r4, lr}
	bx	lr
.L36:
	mov	r3, #256
	mov	r2, #83886080
	ldr	r4, .L38+12
	mov	r0, #3
	ldr	r1, .L38+16
	mov	lr, pc
	bx	r4
	mov	r2, #1
	ldr	r3, .L38+20
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L37:
	pop	{r4, lr}
	b	goToStart
.L39:
	.align	2
.L38:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	DMANow
	.word	alienPal
	.word	state
	.size	pause, .-pause
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r2, #83886080
	ldr	r1, .L42
	mov	r3, #256
	mov	r0, #3
	ldr	r4, .L42+4
	mov	lr, pc
	bx	r4
	ldr	r0, .L42+8
	ldr	r3, .L42+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L42+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L42+20
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L42+24
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L43:
	.align	2
.L42:
	.word	winPal
	.word	DMANow
	.word	winBitmap
	.word	drawFullscreenImage4
	.word	waitForVBlank
	.word	flipPage
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
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
	pop	{r4, lr}
	b	goToStart
.L52:
	.align	2
.L51:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	win, .-win
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
	push	{r4, lr}
	mov	r2, #83886080
	ldr	r1, .L55
	mov	r3, #256
	mov	r0, #3
	ldr	r4, .L55+4
	mov	lr, pc
	bx	r4
	ldr	r0, .L55+8
	ldr	r3, .L55+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L55+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L55+20
	mov	lr, pc
	bx	r3
	mov	r2, #4
	ldr	r3, .L55+24
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L56:
	.align	2
.L55:
	.word	losePal
	.word	DMANow
	.word	loseBitmap
	.word	drawFullscreenImage4
	.word	waitForVBlank
	.word	flipPage
	.word	state
	.size	goToLose, .-goToLose
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"SCORE: %d\000"
	.text
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
	push	{r4, r5, r6, lr}
	ldr	r3, .L71
	ldr	r4, .L71+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L71+8
	mov	lr, pc
	bx	r3
	ldr	r2, [r4]
	ldr	r1, .L71+12
	ldr	r3, .L71+16
	ldr	r0, .L71+20
	mov	lr, pc
	bx	r3
	ldr	r5, .L71+24
	mov	r1, #5
	mov	r0, #15
	ldr	r2, .L71+20
	mov	r3, #252
	mov	lr, pc
	bx	r5
	ldr	r3, .L71+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L71+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L71+36
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L58
	ldr	r2, .L71+40
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L68
.L58:
	ldr	r2, [r4]
	cmp	r2, #130
	beq	.L69
	tst	r3, #2
	beq	.L57
	ldr	r3, .L71+40
	ldrh	r3, [r3]
	tst	r3, #2
	beq	.L70
.L57:
	pop	{r4, r5, r6, lr}
	bx	lr
.L68:
	pop	{r4, r5, r6, lr}
	b	goToPause
.L70:
	pop	{r4, r5, r6, lr}
	b	goToLose
.L69:
	pop	{r4, r5, r6, lr}
	b	goToWin
.L72:
	.align	2
.L71:
	.word	updateGame
	.word	score
	.word	drawGame
	.word	.LC0
	.word	sprintf
	.word	buffer
	.word	drawString4
	.word	waitForVBlank
	.word	flipPage
	.word	oldButtons
	.word	buttons
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
	mov	r2, #67108864
	ldr	r1, .L84
	push	{r4, r7, fp, lr}
	ldr	r3, .L84+4
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r6, .L84+8
	ldr	fp, .L84+12
	ldr	r5, .L84+16
	ldr	r10, .L84+20
	ldr	r9, .L84+24
	ldr	r8, .L84+28
	ldr	r7, .L84+32
	ldr	r4, .L84+36
.L74:
	ldr	r2, [r6]
	ldrh	r3, [fp]
.L75:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [fp]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L75
.L77:
	.word	.L80
	.word	.L79
	.word	.L78
	.word	.L76
	.word	.L76
.L76:
	mov	lr, pc
	bx	r7
	b	.L74
.L78:
	mov	lr, pc
	bx	r8
	b	.L74
.L79:
	mov	lr, pc
	bx	r9
	b	.L74
.L80:
	mov	lr, pc
	bx	r10
	b	.L74
.L85:
	.align	2
.L84:
	.word	1044
	.word	goToStart
	.word	state
	.word	buttons
	.word	oldButtons
	.word	start
	.word	game
	.word	pause
	.word	win
	.word	67109120
	.size	main, .-main
	.text
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
	@ link register save eliminated.
	b	win
	.size	lose, .-lose
	.comm	buffer2,41,4
	.comm	buffer,41,4
	.comm	seed,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
