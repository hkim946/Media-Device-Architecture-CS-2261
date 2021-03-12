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
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateAlien.part.0, %function
updateAlien.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	r3, [r0]
	cmp	r3, #1
	mov	r5, r0
	sub	sp, sp, #20
	ble	.L2
	ldr	r2, [r0, #16]
	add	r3, r3, r2
	cmp	r3, #119
	bgt	.L2
.L3:
	ldr	r3, [r5, #4]
	cmp	r3, #1
	ldr	r2, [r5, #12]
	ble	.L4
	ldr	r1, [r5, #20]
	add	r1, r3, r1
	cmp	r1, #238
	bgt	.L4
.L5:
	mov	r7, #0
	ldr	r4, .L17
	add	r3, r3, r2
	str	r3, [r5, #4]
	ldr	r8, .L17+4
	ldr	r9, .L17+8
	add	r6, r4, #160
.L9:
	ldr	r3, [r4, #28]
	cmp	r3, #0
	bne	.L16
.L7:
	add	r4, r4, #32
	cmp	r4, r6
	bne	.L9
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L4:
	rsb	r2, r2, #0
	str	r2, [r5, #12]
	b	.L5
.L2:
	ldr	r3, [r5, #8]
	rsb	r3, r3, #0
	str	r3, [r5, #8]
	b	.L3
.L16:
	add	r0, r4, #16
	ldm	r0, {r0, r1}
	ldm	r4, {r2, r3}
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldr	r3, [r5, #16]
	ldr	r2, [r5, #20]
	ldr	r1, [r5]
	ldr	r0, [r5, #4]
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	ldrne	r3, [r9]
	addne	r3, r3, #10
	strne	r7, [r4, #28]
	strne	r3, [r9]
	strne	r7, [r5, #24]
	b	.L7
.L18:
	.align	2
.L17:
	.word	bullets
	.word	collision
	.word	score
	.size	updateAlien.part.0, .-updateAlien.part.0
	.align	2
	.global	drawBlocks
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBlocks, %function
drawBlocks:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldrb	r2, [r0, #16]	@ zero_extendqisi2
	sub	sp, sp, #8
	ldr	r3, [r0, #8]
	str	r2, [sp]
	ldr	r4, .L21
	ldr	r2, [r0, #12]
	ldr	r1, [r0]
	ldr	r0, [r0, #4]
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L22:
	.align	2
.L21:
	.word	drawRect4
	.size	drawBlocks, .-drawBlocks
	.align	2
	.global	initBlocks
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBlocks, %function
initBlocks:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r2, #35
	mov	lr, #120
	mov	ip, #10
	mov	r0, #20
	mvn	r1, #3
	ldr	r3, .L27
.L24:
	str	r2, [r3, #4]
	add	r2, r2, #50
	cmp	r2, #235
	str	lr, [r3]
	str	ip, [r3, #8]
	str	r0, [r3, #12]
	strb	r1, [r3, #16]
	add	r3, r3, #24
	bne	.L24
	ldr	lr, [sp], #4
	bx	lr
.L28:
	.align	2
.L27:
	.word	blocks
	.size	initBlocks, .-initBlocks
	.align	2
	.global	updateBlocks
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBlocks, %function
updateBlocks:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r8, #0
	mov	r5, r0
	ldr	r4, .L37
	ldr	r7, .L37+4
	sub	sp, sp, #16
	add	r6, r4, #160
.L31:
	add	r0, r4, #16
	ldm	r0, {r0, r1}
	ldm	r4, {r2, r3}
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldr	r3, [r5, #8]
	ldr	r2, [r5, #12]
	ldr	r1, [r5]
	ldr	r0, [r5, #4]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	strne	r8, [r4, #28]
	add	r4, r4, #32
	cmp	r4, r6
	bne	.L31
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L38:
	.align	2
.L37:
	.word	bullets
	.word	collision
	.size	updateBlocks, .-updateBlocks
	.align	2
	.global	initRocket
	.syntax unified
	.arm
	.fpu softvfp
	.type	initRocket, %function
initRocket:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mvn	r1, #0
	push	{r4, r5, lr}
	mov	ip, #10
	mov	r5, #145
	mov	r4, #140
	mov	lr, #2
	mov	r0, #5
	mov	r2, #20
	ldr	r3, .L41
	strb	r1, [r3, #20]
	stmib	r3, {r4, lr}
	str	r5, [r3]
	str	ip, [r3, #12]
	str	r0, [r3, #16]
	str	r2, [r3, #24]
	pop	{r4, r5, lr}
	bx	lr
.L42:
	.align	2
.L41:
	.word	rocket
	.size	initRocket, .-initRocket
	.align	2
	.global	drawRocket
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRocket, %function
drawRocket:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r0, .L45
	ldrb	r2, [r0, #20]	@ zero_extendqisi2
	sub	sp, sp, #8
	ldr	r3, [r0, #12]
	str	r2, [sp]
	ldr	r4, .L45+4
	ldr	r2, [r0, #16]
	ldr	r1, [r0]
	ldr	r0, [r0, #4]
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L46:
	.align	2
.L45:
	.word	rocket
	.word	drawRect4
	.size	drawRocket, .-drawRocket
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
	push	{r4, r5, r6, r7, r8, lr}
	mov	r0, #251
	ldr	r3, .L65
	sub	sp, sp, #8
	mov	lr, pc
	bx	r3
	bl	drawRocket
	ldr	r4, .L65+4
	ldr	r6, .L65+8
	add	r5, r4, #160
.L49:
	ldr	r3, [r4, #28]
	cmp	r3, #0
	bne	.L63
.L48:
	add	r4, r4, #32
	cmp	r4, r5
	bne	.L49
	ldr	r4, .L65+12
	ldr	r8, .L65+16
	ldr	r7, .L65+20
	add	r5, r4, #420
	b	.L51
.L50:
	add	r4, r4, #28
	cmp	r4, r5
	beq	.L64
.L51:
	ldr	r3, [r4, #24]
	cmp	r3, #0
	beq	.L50
	str	r8, [sp]
	add	r4, r4, #28
	ldr	r3, [r4, #-12]
	ldr	r2, [r4, #-8]
	ldr	r1, [r4, #-28]
	ldr	r0, [r4, #-24]
	mov	lr, pc
	bx	r7
	cmp	r4, r5
	bne	.L51
.L64:
	ldr	r4, .L65+24
	add	r5, r4, #96
.L52:
	ldrb	r2, [r4, #16]	@ zero_extendqisi2
	ldr	r3, [r4, #8]
	str	r2, [sp]
	add	r4, r4, #24
	ldr	r2, [r4, #-12]
	ldr	r1, [r4, #-24]
	ldr	r0, [r4, #-20]
	mov	lr, pc
	bx	r6
	cmp	r4, r5
	bne	.L52
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L63:
	ldrb	r2, [r4, #24]	@ zero_extendqisi2
	ldr	r3, [r4, #16]
	str	r2, [sp]
	ldr	r2, [r4, #20]
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r6
	b	.L48
.L66:
	.align	2
.L65:
	.word	fillScreen4
	.word	bullets
	.word	drawRect4
	.word	aliens
	.word	alienBitmap
	.word	drawImage4
	.word	blocks
	.size	drawGame, .-drawGame
	.align	2
	.global	initBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBullets, %function
initBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r0, #2
	mvn	r1, #1
	mov	r2, #0
	mvn	lr, #2
	ldr	r3, .L71
	add	ip, r3, #160
.L68:
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	str	r1, [r3, #8]
	str	r2, [r3, #12]
	strb	lr, [r3, #24]
	str	r2, [r3, #28]
	stm	r3, {r1, r2}
	add	r3, r3, #32
	cmp	r3, ip
	bne	.L68
	ldr	lr, [sp], #4
	bx	lr
.L72:
	.align	2
.L71:
	.word	bullets
	.size	initBullets, .-initBullets
	.align	2
	.global	fireBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	fireBullet, %function
fireBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	ldr	r1, .L84
	ldr	r2, [r1, r3, lsl #5]
	cmp	r2, #0
	lsl	r2, r3, #5
	beq	.L83
.L74:
	add	r3, r3, #1
	cmp	r3, #5
	bxeq	lr
	ldr	r2, [r1, r3, lsl #5]
	cmp	r2, #0
	lsl	r2, r3, #5
	bne	.L74
.L83:
	push	{r4, r5, lr}
	mov	r5, #1
	ldr	ip, .L84+4
	ldr	r4, .L84+8
	ldr	lr, [ip, #16]
	add	r2, r4, r2
	ldr	r1, [ip, #4]
	ldr	r0, [r2, #20]
	add	lr, lr, lr, lsr #31
	add	r1, r1, lr, asr r5
	add	r0, r0, r0, lsr #31
	ldr	lr, [ip, #28]
	ldr	ip, [ip]
	sub	r1, r1, r0, asr r5
	str	lr, [r2, #12]
	str	ip, [r4, r3, lsl #5]
	str	r5, [r2, #28]
	str	r1, [r2, #4]
	pop	{r4, r5, lr}
	bx	lr
.L85:
	.align	2
.L84:
	.word	bullets+28
	.word	rocket
	.word	bullets
	.size	fireBullet, .-fireBullet
	.align	2
	.global	updateRocket
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateRocket, %function
updateRocket:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L99
	ldrh	r3, [r3, #48]
	tst	r3, #32
	push	{r4, lr}
	ldr	r4, .L99+4
	bne	.L87
	ldr	r3, [r4, #4]
	ldr	r2, [r4, #8]
	cmp	r3, r2
	blt	.L87
	mvn	r1, #0
	sub	r3, r3, r2
	str	r3, [r4, #4]
	str	r1, [r4, #28]
	b	.L88
.L87:
	ldr	r3, .L99
	ldrh	r3, [r3, #48]
	tst	r3, #16
	beq	.L98
.L89:
	mov	r3, #0
	str	r3, [r4, #28]
.L88:
	ldr	r3, .L99+8
	ldrh	r3, [r3]
	tst	r3, #1
	ldr	r3, [r4, #24]
	beq	.L97
	ldr	r2, .L99+12
	ldrh	r2, [r2]
	tst	r2, #1
	beq	.L92
.L97:
	add	r3, r3, #1
.L91:
	str	r3, [r4, #24]
	pop	{r4, lr}
	bx	lr
.L98:
	ldr	r2, [r4, #4]
	ldr	r3, [r4, #16]
	ldr	r1, [r4, #8]
	add	r3, r2, r3
	rsb	r0, r1, #240
	cmp	r3, r0
	bgt	.L89
	mov	r3, #1
	add	r2, r2, r1
	str	r2, [r4, #4]
	str	r3, [r4, #28]
	b	.L88
.L92:
	cmp	r3, #14
	ble	.L97
	bl	fireBullet
	mov	r3, #1
	b	.L91
.L100:
	.align	2
.L99:
	.word	67109120
	.word	rocket
	.word	oldButtons
	.word	buttons
	.size	updateRocket, .-updateRocket
	.align	2
	.global	updateBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBullet, %function
updateBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	r3, [r0, #28]
	cmp	r3, #0
	mov	r5, r0
	ldr	r1, [r0]
	ldr	r3, [r0, #16]
	sub	sp, sp, #20
	ldr	r0, [r0, #4]
	beq	.L102
	add	r2, r3, r1
	cmp	r2, #0
	ble	.L103
	ldr	r2, [r5, #12]
	add	r2, r0, r2
	sub	ip, r2, #1
	cmp	ip, #237
	bls	.L114
.L103:
	mov	r2, #0
	str	r2, [r5, #28]
.L102:
	mov	r8, #0
	ldr	r4, .L115
	ldr	r7, .L115+4
	add	r6, r4, #96
.L106:
	add	r9, r4, #8
	ldr	r2, [r4, #4]
	ldr	ip, [r4]
	ldm	r9, {r9, lr}
	stm	sp, {r2, ip, lr}
	str	r9, [sp, #12]
	ldr	r2, [r5, #20]
	mov	lr, pc
	bx	r7
	add	r4, r4, #24
	cmp	r0, #0
	strne	r8, [r5, #28]
	cmp	r4, r6
	ldrne	r0, [r5, #4]
	ldrne	r1, [r5]
	ldrne	r3, [r5, #16]
	bne	.L106
.L101:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L114:
	ldr	r0, [r5, #8]
	add	r1, r1, r0
	str	r2, [r5, #4]
	mov	r0, r2
	str	r1, [r5]
	b	.L102
.L116:
	.align	2
.L115:
	.word	blocks
	.word	collision
	.size	updateBullet, .-updateBullet
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
	bl	updateRocket
	ldr	r0, .L125
	bl	updateBullet
	ldr	r0, .L125+4
	bl	updateBullet
	ldr	r0, .L125+8
	bl	updateBullet
	ldr	r0, .L125+12
	bl	updateBullet
	ldr	r0, .L125+16
	bl	updateBullet
	ldr	r4, .L125+20
	add	r5, r4, #420
.L119:
	ldr	r3, [r4, #24]
	cmp	r3, #0
	movne	r0, r4
	blne	updateAlien.part.0
.L118:
	add	r4, r4, #28
	cmp	r4, r5
	bne	.L119
	pop	{r4, r5, r6, lr}
	bx	lr
.L126:
	.align	2
.L125:
	.word	bullets
	.word	bullets+32
	.word	bullets+64
	.word	bullets+96
	.word	bullets+128
	.word	aliens
	.size	updateGame, .-updateGame
	.align	2
	.global	drawBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBullet, %function
drawBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #28]
	cmp	r3, #0
	bxeq	lr
	push	{r4, lr}
	ldrb	r2, [r0, #24]	@ zero_extendqisi2
	sub	sp, sp, #8
	ldr	r3, [r0, #16]
	str	r2, [sp]
	ldr	r4, .L136
	ldr	r2, [r0, #20]
	ldr	r1, [r0]
	ldr	r0, [r0, #4]
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L137:
	.align	2
.L136:
	.word	drawRect4
	.size	drawBullet, .-drawBullet
	.align	2
	.global	initAliens
	.syntax unified
	.arm
	.fpu softvfp
	.type	initAliens, %function
initAliens:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #10
	mov	r1, #1
	mov	r0, #16
	str	lr, [sp, #-4]!
	ldr	lr, .L148
.L140:
	mov	r3, lr
	mov	r2, #40
	add	ip, ip, #25
.L139:
	str	r2, [r3, #4]
	add	r2, r2, #40
	cmp	r2, #240
	str	ip, [r3]
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	str	r1, [r3, #24]
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	add	r3, r3, #28
	bne	.L139
	cmp	ip, #85
	add	lr, lr, #140
	bne	.L140
	ldr	lr, [sp], #4
	bx	lr
.L149:
	.align	2
.L148:
	.word	aliens
	.size	initAliens, .-initAliens
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
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r5, #10
	mov	r4, #20
	mov	r10, #145
	mov	r9, #140
	mov	r8, #2
	mov	r7, #5
	mvn	r6, #0
	mov	lr, r5
	mov	ip, r4
	mov	r2, #35
	mov	r0, #120
	mvn	r1, #3
	ldr	r3, .L156
	str	r5, [r3, #12]
	str	r10, [r3]
	str	r9, [r3, #4]
	str	r8, [r3, #8]
	str	r7, [r3, #16]
	strb	r6, [r3, #20]
	str	r4, [r3, #24]
	ldr	r3, .L156+4
.L151:
	str	r2, [r3, #4]
	add	r2, r2, #50
	cmp	r2, #235
	str	r0, [r3]
	str	lr, [r3, #8]
	str	ip, [r3, #12]
	strb	r1, [r3, #16]
	add	r3, r3, #24
	bne	.L151
	mov	r1, #2
	mvn	r2, #1
	mov	r4, #0
	mvn	ip, #2
	ldr	r3, .L156+8
	add	r0, r3, #160
.L152:
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r2, [r3, #8]
	str	r4, [r3, #12]
	strb	ip, [r3, #24]
	str	r4, [r3, #28]
	stm	r3, {r2, r4}
	add	r3, r3, #32
	cmp	r3, r0
	bne	.L152
	bl	initAliens
	mov	lr, #14
	ldr	r0, .L156+12
	ldr	ip, .L156+16
	str	lr, [r0]
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L156+20
	ldr	r5, .L156+24
	str	r4, [ip]
	mov	lr, pc
	bx	r5
	mov	ip, #992
	mov	r0, #31
	mvn	r1, #32768
	ldr	r3, .L156+28
	ldr	r2, .L156+32
	strh	r4, [r3, #246]	@ movhi
	strh	ip, [r3, #248]	@ movhi
	strh	r0, [r3, #250]	@ movhi
	strh	r1, [r3, #252]	@ movhi
	strh	r2, [r3, #254]	@ movhi
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L157:
	.align	2
.L156:
	.word	rocket
	.word	blocks
	.word	bullets
	.word	aliensRemaining
	.word	score
	.word	alienPal
	.word	DMANow
	.word	83886336
	.word	15855
	.size	initGame, .-initGame
	.align	2
	.global	updateAlien
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateAlien, %function
updateAlien:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #24]
	cmp	r3, #0
	bxeq	lr
	b	updateAlien.part.0
	.size	updateAlien, .-updateAlien
	.align	2
	.global	drawAlien
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawAlien, %function
drawAlien:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #24]
	cmp	r3, #0
	bxeq	lr
	push	{r4, lr}
	ldr	r2, .L169
	sub	sp, sp, #8
	ldr	r3, [r0, #16]
	str	r2, [sp]
	ldr	r4, .L169+4
	ldr	r2, [r0, #20]
	ldr	r1, [r0]
	ldr	r0, [r0, #4]
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L170:
	.align	2
.L169:
	.word	alienBitmap
	.word	drawImage4
	.size	drawAlien, .-drawAlien
	.comm	score,4,4
	.comm	aliensRemaining,4,4
	.comm	blocks,96,4
	.comm	aliens,420,4
	.comm	bullets,160,4
	.comm	rocket,32,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
