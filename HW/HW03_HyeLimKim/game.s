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
	.file	"game.c"
	.text
	.align	2
	.global	drawLand
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawLand, %function
drawLand:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #0
	mov	r3, #4416
	push	{r4, lr}
	sub	sp, sp, #8
	str	r3, [sp]
	mov	r0, r1
	mov	r3, #15
	mov	r2, #240
	ldr	r4, .L4
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	drawRect
	.size	drawLand, .-drawLand
	.align	2
	.global	initFrog
	.syntax unified
	.arm
	.fpu softvfp
	.type	initFrog, %function
initFrog:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #145
	mov	r0, #118
	mov	r1, #2
	mov	r2, #10
	str	lr, [sp, #-4]!
	ldr	r3, .L8
	ldr	lr, .L8+4
	str	ip, [r3]
	strh	lr, [r3, #32]	@ movhi
	str	ip, [r3, #8]
	str	r0, [r3, #4]
	str	r0, [r3, #12]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	ldr	lr, [sp], #4
	bx	lr
.L9:
	.align	2
.L8:
	.word	frog
	.word	805
	.size	initFrog, .-initFrog
	.align	2
	.global	updateFrog
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateFrog, %function
updateFrog:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r3, .L20
	ldrh	r2, [r3, #48]
	ldr	r3, .L20+4
	tst	r2, #32
	ldr	ip, [r3, #28]
	ldr	r2, [r3, #4]
	ldr	r0, [r3]
	ldr	lr, [r3, #24]
	sub	sp, sp, #20
	bne	.L11
	ldr	r1, [r3, #16]
	cmp	r1, r2
	suble	r2, r2, r1
	strle	r2, [r3, #4]
	ble	.L12
.L11:
	ldr	r1, .L20
	ldrh	r1, [r1, #48]
	tst	r1, #16
	bne	.L13
	ldr	r4, [r3, #16]
	add	r1, r2, ip
	rsb	r5, r4, #240
	cmp	r1, r5
	addle	r2, r2, r4
	strle	r2, [r3, #4]
	ble	.L12
.L13:
	ldr	r1, .L20
	ldrh	r4, [r1, #48]
	tst	r4, #64
	bne	.L14
	ldr	r1, [r3, #20]
	sub	r0, r0, r1
	str	r0, [r3]
.L12:
	mov	r1, #0
	mov	r3, #15
	stmib	sp, {r0, ip, lr}
	str	r2, [sp]
	mov	r0, r1
	mov	r2, #240
	ldr	r4, .L20+8
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	movne	r2, #1
	ldrne	r3, .L20+12
	strne	r2, [r3]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L14:
	ldrh	r1, [r1, #48]
	tst	r1, #128
	bne	.L12
	ldr	r4, [r3, #20]
	add	r1, r0, lr
	rsb	r5, r4, #160
	cmp	r1, r5
	addle	r0, r0, r4
	strle	r0, [r3]
	b	.L12
.L21:
	.align	2
.L20:
	.word	67109120
	.word	frog
	.word	collision
	.word	reachLand
	.size	updateFrog, .-updateFrog
	.align	2
	.global	drawFrog
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFrog, %function
drawFrog:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	ip, .L24
	ldr	r4, .L24+4
	sub	sp, sp, #12
	ldr	r3, [r4, #24]
	ldr	r2, [r4, #28]
	ldr	r1, [r4, #8]
	ldr	r0, [r4, #12]
	str	ip, [sp]
	ldr	r5, .L24+8
	mov	lr, pc
	bx	r5
	ldrh	r2, [r4, #32]
	ldr	r3, [r4, #24]
	str	r2, [sp]
	ldr	r1, [r4]
	ldr	r2, [r4, #28]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r5
	ldm	r4, {r2, r3}
	str	r2, [r4, #8]
	str	r3, [r4, #12]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L25:
	.align	2
.L24:
	.word	30304
	.word	frog
	.word	drawRect
	.size	drawFrog, .-drawFrog
	.align	2
	.global	initLogs
	.syntax unified
	.arm
	.fpu softvfp
	.type	initLogs, %function
initLogs:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r9, #20
	ldr	r4, .L30
	ldr	r5, .L30+4
	ldr	r8, .L30+8
	ldr	r6, .L30+12
	ldr	r7, .L30+16
.L27:
	mov	r3, #40
	mov	r2, #10
	str	r3, [r4, #28]
	str	r9, [r4]
	str	r2, [r4, #24]
	mov	lr, pc
	bx	r5
	smull	r3, r2, r8, r0
	asr	r3, r0, #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #7
	rsb	r2, r3, r3, lsl #4
	rsb	r3, r3, r2, lsl #4
	ldr	r2, [r4]
	sub	r3, r0, r3
	str	r2, [r4, #8]
	str	r3, [r4, #4]
	str	r3, [r4, #12]
	mov	lr, pc
	bx	r5
	smull	r2, r3, r6, r0
	sub	r3, r3, r0, asr #31
	add	r3, r3, r3, lsl #1
	sub	r0, r0, r3
	add	r0, r0, #1
	str	r0, [r4, #16]
	mov	lr, pc
	bx	r5
	smull	r2, r3, r6, r0
	sub	r3, r3, r0, asr #31
	add	r3, r3, r3, lsl #1
	add	r9, r9, #12
	sub	r0, r0, r3
	add	r0, r0, #1
	cmp	r9, #140
	strh	r7, [r4, #32]	@ movhi
	str	r0, [r4, #20]
	add	r4, r4, #36
	bne	.L27
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L31:
	.align	2
.L30:
	.word	logs
	.word	rand
	.word	-1994733765
	.word	1431655766
	.word	2186
	.size	initLogs, .-initLogs
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #118
	mov	r1, #2
	mov	r2, #10
	mov	ip, #145
	push	{r4, lr}
	ldr	r3, .L34
	ldr	lr, .L34+4
	str	r0, [r3, #4]
	strh	lr, [r3, #32]	@ movhi
	str	r0, [r3, #12]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	str	ip, [r3]
	str	ip, [r3, #8]
	bl	initLogs
	mov	r0, #1
	mov	r2, #0
	ldr	r1, .L34+8
	ldr	r3, .L34+12
	str	r0, [r1]
	str	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L35:
	.align	2
.L34:
	.word	frog
	.word	805
	.word	reachLog
	.word	reachLand
	.size	initGame, .-initGame
	.align	2
	.global	updateLog
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateLog, %function
updateLog:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, r0
	ldr	r0, [r0, #4]
	cmp	r0, #239
	movgt	r0, #0
	push	{r4, lr}
	ldrle	r3, [r1, #20]
	addle	r0, r0, r3
	ldr	r3, .L44
	ldr	lr, [r3, #24]
	ldr	ip, [r3, #28]
	ldm	r3, {r2, r3}
	sub	sp, sp, #16
	str	r0, [r1, #4]
	stmib	sp, {r2, ip, lr}
	str	r3, [sp]
	ldr	r4, .L44+4
	ldr	r3, [r1, #24]
	ldr	r2, [r1, #28]
	ldr	r1, [r1]
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	movne	r2, #0
	ldrne	r3, .L44+8
	strne	r2, [r3]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L45:
	.align	2
.L44:
	.word	frog
	.word	collision
	.word	reachLog
	.size	updateLog, .-updateLog
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
	push	{r4, r5, r6, lr}
	bl	updateFrog
	ldr	r4, .L50
	add	r5, r4, #360
.L47:
	mov	r0, r4
	add	r4, r4, #36
	bl	updateLog
	cmp	r4, r5
	bne	.L47
	pop	{r4, r5, r6, lr}
	bx	lr
.L51:
	.align	2
.L50:
	.word	logs
	.size	updateGame, .-updateGame
	.align	2
	.global	drawLogs
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawLogs, %function
drawLogs:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r4, r0
	ldr	ip, .L54
	sub	sp, sp, #12
	ldr	r3, [r0, #24]
	ldr	r2, [r0, #28]
	ldr	r1, [r0, #8]
	ldr	r5, .L54+4
	ldr	r0, [r0, #12]
	str	ip, [sp]
	mov	lr, pc
	bx	r5
	ldrh	r2, [r4, #32]
	ldr	r3, [r4, #24]
	str	r2, [sp]
	ldr	r2, [r4, #28]
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r5
	ldm	r4, {r2, r3}
	str	r2, [r4, #8]
	str	r3, [r4, #12]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L55:
	.align	2
.L54:
	.word	30304
	.word	drawRect
	.size	drawLogs, .-drawLogs
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
	push	{r4, r5, lr}
	sub	sp, sp, #12
	bl	drawFrog
	mov	r3, #4416
	mov	r1, #0
	str	r3, [sp]
	ldr	r4, .L60
	mov	r0, r1
	mov	r3, #15
	mov	r2, #240
	mov	lr, pc
	bx	r4
	ldr	r4, .L60+4
	add	r5, r4, #360
.L57:
	mov	r0, r4
	add	r4, r4, #36
	bl	drawLogs
	cmp	r4, r5
	bne	.L57
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L61:
	.align	2
.L60:
	.word	drawRect
	.word	logs
	.size	drawGame, .-drawGame
	.comm	reachLand,4,4
	.comm	reachLog,4,4
	.comm	logs,360,4
	.comm	frog,36,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
