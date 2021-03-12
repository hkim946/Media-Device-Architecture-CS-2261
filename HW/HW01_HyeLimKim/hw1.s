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
	.file	"hw1.c"
	.text
	.align	2
	.global	waitForVBlank
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	waitForVBlank, %function
waitForVBlank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L8
	ldr	r3, [r3]
.L2:
	ldrh	r2, [r3]
	cmp	r2, #159
	bhi	.L2
.L3:
	ldrh	r2, [r3]
	cmp	r2, #159
	bls	.L3
	bx	lr
.L9:
	.align	2
.L8:
	.word	.LANCHOR0
	.size	waitForVBlank, .-waitForVBlank
	.align	2
	.global	setPixel
	.syntax unified
	.arm
	.fpu softvfp
	.type	setPixel, %function
setPixel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L11
	rsb	r1, r1, r1, lsl #4
	ldr	r3, [r3, #4]
	add	r0, r0, r1, lsl #4
	lsl	r0, r0, #1
	strh	r2, [r3, r0]	@ movhi
	bx	lr
.L12:
	.align	2
.L11:
	.word	.LANCHOR0
	.size	setPixel, .-setPixel
	.align	2
	.global	drawRect
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRect, %function
drawRect:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	subs	r4, r2, #0
	ldrh	ip, [sp, #8]
	ble	.L13
	ldr	lr, .L21
	add	r2, r1, r3
	rsb	r2, r2, r2, lsl #4
	ldr	r1, [lr, #4]
	add	r2, r0, r2, lsl #4
	sub	lr, r3, r3, lsl #4
	add	r4, r4, r0
	add	r1, r1, r2, lsl #1
	lsl	lr, lr, #5
.L15:
	cmp	r3, #0
	addgt	r2, r1, lr
	ble	.L18
.L16:
	strh	ip, [r2]	@ movhi
	add	r2, r2, #480
	cmp	r2, r1
	bne	.L16
.L18:
	add	r0, r0, #1
	cmp	r0, r4
	add	r1, r1, #2
	bne	.L15
.L13:
	pop	{r4, lr}
	bx	lr
.L22:
	.align	2
.L21:
	.word	.LANCHOR0
	.size	drawRect, .-drawRect
	.align	2
	.global	update
	.syntax unified
	.arm
	.fpu softvfp
	.type	update, %function
update:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L26
	ldr	r3, [r2, #8]
	ldr	r1, [r2, #12]
	ldr	r0, [r2, #16]
	cmp	r3, #0
	rsble	r1, r1, #0
	add	r0, r3, r0
	strle	r1, [r2, #12]
	cmp	r0, #240
	rsbgt	r1, r1, #0
	add	r3, r3, r1
	strgt	r1, [r2, #12]
	str	r3, [r2, #8]
	bx	lr
.L27:
	.align	2
.L26:
	.word	.LANCHOR0
	.size	update, .-update
	.align	2
	.global	frame1
	.syntax unified
	.arm
	.fpu softvfp
	.type	frame1, %function
frame1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r7, .L44
	bl	update
	ldr	r6, [r7, #16]
	ldr	r4, .L44+4
	cmp	r6, #0
	ldr	lr, [r7, #20]
	ldr	ip, [r4]
	ldr	r3, [r4, #4]
	ble	.L29
	mov	r0, #0
	add	r3, r3, lr
	ldr	r1, [r7, #4]
	rsb	r3, r3, r3, lsl #4
	add	r2, ip, r3, lsl #4
	sub	r5, lr, lr, lsl #4
	add	r2, r1, r2, lsl #1
	add	r8, ip, r6
	lsl	r5, r5, #5
.L30:
	cmp	lr, #0
	addgt	r3, r2, r5
	ble	.L34
.L31:
	strh	r0, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r2
	bne	.L31
.L34:
	add	ip, ip, #1
	cmp	ip, r8
	add	r2, r2, #2
	bne	.L30
	ldr	r8, [r7, #8]
	mov	r0, r8
	ldr	r9, [r7, #24]
	add	r3, r9, lr
	rsb	r3, r3, r3, lsl #4
	add	r2, r8, r3, lsl #4
	add	r2, r1, r2, lsl #1
	ldr	r1, .L44+8
	add	ip, r8, r6
.L39:
	cmp	lr, #0
	addgt	r3, r2, r5
	ble	.L38
.L35:
	strh	r1, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r2
	bne	.L35
.L38:
	add	r0, r0, #1
	cmp	r0, ip
	add	r2, r2, #2
	bne	.L39
	stm	r4, {r8, r9}
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L29:
	ldr	r8, [r7, #8]
	ldr	r9, [r7, #24]
	stm	r4, {r8, r9}
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L45:
	.align	2
.L44:
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	32736
	.size	frame1, .-frame1
	.align	2
	.global	frame2
	.syntax unified
	.arm
	.fpu softvfp
	.type	frame2, %function
frame2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r7, .L62
	bl	update
	ldr	r6, [r7, #16]
	ldr	r4, .L62+4
	cmp	r6, #0
	ldr	lr, [r7, #20]
	ldr	ip, [r4]
	ldr	r3, [r4, #4]
	ble	.L47
	mov	r0, #0
	add	r3, r3, lr
	ldr	r1, [r7, #4]
	rsb	r3, r3, r3, lsl #4
	add	r2, ip, r3, lsl #4
	sub	r5, lr, lr, lsl #4
	add	r2, r1, r2, lsl #1
	add	r8, ip, r6
	lsl	r5, r5, #5
.L48:
	cmp	lr, #0
	addgt	r3, r2, r5
	ble	.L52
.L49:
	strh	r0, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r2
	bne	.L49
.L52:
	add	ip, ip, #1
	cmp	ip, r8
	add	r2, r2, #2
	bne	.L48
	ldr	r9, [r7, #24]
	ldr	r8, [r7, #8]
	add	r3, r9, lr
	rsb	r3, r3, r3, lsl #4
	add	r2, r8, r3, lsl #4
	add	r2, r1, r2, lsl #1
	mov	r0, r8
	mov	r1, #992
	add	ip, r8, r6
.L57:
	cmp	lr, #0
	addgt	r3, r2, r5
	ble	.L56
.L53:
	strh	r1, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r2
	bne	.L53
.L56:
	add	r0, r0, #1
	cmp	r0, ip
	add	r2, r2, #2
	bne	.L57
	stm	r4, {r8, r9}
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L47:
	ldr	r8, [r7, #8]
	ldr	r9, [r7, #24]
	stm	r4, {r8, r9}
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L63:
	.align	2
.L62:
	.word	.LANCHOR0
	.word	.LANCHOR1
	.size	frame2, .-frame2
	.align	2
	.global	frame3
	.syntax unified
	.arm
	.fpu softvfp
	.type	frame3, %function
frame3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r7, .L80
	bl	update
	ldr	r6, [r7, #16]
	ldr	r4, .L80+4
	cmp	r6, #0
	ldr	lr, [r7, #20]
	ldr	ip, [r4]
	ldr	r3, [r4, #4]
	ble	.L65
	mov	r0, #0
	add	r3, r3, lr
	ldr	r1, [r7, #4]
	rsb	r3, r3, r3, lsl #4
	add	r2, ip, r3, lsl #4
	sub	r5, lr, lr, lsl #4
	add	r2, r1, r2, lsl #1
	add	r8, ip, r6
	lsl	r5, r5, #5
.L66:
	cmp	lr, #0
	addgt	r3, r2, r5
	ble	.L70
.L67:
	strh	r0, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r2
	bne	.L67
.L70:
	add	ip, ip, #1
	cmp	ip, r8
	add	r2, r2, #2
	bne	.L66
	ldr	r8, [r7, #8]
	mov	r0, r8
	ldr	r9, [r7, #24]
	add	r3, r9, lr
	rsb	r3, r3, r3, lsl #4
	add	r2, r8, r3, lsl #4
	add	r2, r1, r2, lsl #1
	ldr	r1, .L80+8
	add	ip, r8, r6
.L75:
	cmp	lr, #0
	addgt	r3, r2, r5
	ble	.L74
.L71:
	strh	r1, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r2
	bne	.L71
.L74:
	add	r0, r0, #1
	cmp	r0, ip
	add	r2, r2, #2
	bne	.L75
	stm	r4, {r8, r9}
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L65:
	ldr	r8, [r7, #8]
	ldr	r9, [r7, #24]
	stm	r4, {r8, r9}
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L81:
	.align	2
.L80:
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	31775
	.size	frame3, .-frame3
	.align	2
	.global	frame4
	.syntax unified
	.arm
	.fpu softvfp
	.type	frame4, %function
frame4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r7, .L98
	bl	update
	ldr	r6, [r7, #16]
	ldr	r4, .L98+4
	cmp	r6, #0
	ldr	lr, [r7, #20]
	ldr	ip, [r4]
	ldr	r3, [r4, #4]
	ble	.L83
	mov	r0, #0
	add	r3, r3, lr
	ldr	r1, [r7, #4]
	rsb	r3, r3, r3, lsl #4
	add	r2, ip, r3, lsl #4
	sub	r5, lr, lr, lsl #4
	add	r2, r1, r2, lsl #1
	add	r8, ip, r6
	lsl	r5, r5, #5
.L84:
	cmp	lr, #0
	addgt	r3, r2, r5
	ble	.L88
.L85:
	strh	r0, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r2
	bne	.L85
.L88:
	add	ip, ip, #1
	cmp	ip, r8
	add	r2, r2, #2
	bne	.L84
	ldr	r9, [r7, #24]
	ldr	r8, [r7, #8]
	add	r3, r9, lr
	rsb	r3, r3, r3, lsl #4
	add	r2, r8, r3, lsl #4
	add	r2, r1, r2, lsl #1
	mov	r0, r8
	mov	r1, #31
	add	ip, r8, r6
.L93:
	cmp	lr, #0
	addgt	r3, r2, r5
	ble	.L92
.L89:
	strh	r1, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r2
	bne	.L89
.L92:
	add	r0, r0, #1
	cmp	r0, ip
	add	r2, r2, #2
	bne	.L93
	stm	r4, {r8, r9}
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L83:
	ldr	r8, [r7, #8]
	ldr	r9, [r7, #24]
	stm	r4, {r8, r9}
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L99:
	.align	2
.L98:
	.word	.LANCHOR0
	.word	.LANCHOR1
	.size	frame4, .-frame4
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
	mov	r3, #67108864
	ldr	r2, .L120
	push	{r7, lr}
	ldr	r8, .L120+4
	strh	r2, [r3]	@ movhi
	ldr	r4, .L120+8
	ldr	r7, .L120+12
	ldr	r6, .L120+16
	ldr	r5, .L120+20
.L109:
	mov	lr, pc
	bx	r8
	ldr	r3, [r4]
.L101:
	ldrh	r2, [r3]
	cmp	r2, #159
	bhi	.L101
.L102:
	ldrh	r2, [r3]
	cmp	r2, #159
	bls	.L102
	mov	lr, pc
	bx	r7
	ldr	r3, [r4]
.L103:
	ldrh	r2, [r3]
	cmp	r2, #159
	bhi	.L103
.L104:
	ldrh	r2, [r3]
	cmp	r2, #159
	bls	.L104
	mov	lr, pc
	bx	r6
	ldr	r3, [r4]
.L105:
	ldrh	r2, [r3]
	cmp	r2, #159
	bhi	.L105
.L106:
	ldrh	r2, [r3]
	cmp	r2, #159
	bls	.L106
	mov	lr, pc
	bx	r5
	ldr	r3, [r4]
.L107:
	ldrh	r2, [r3]
	cmp	r2, #159
	bhi	.L107
.L108:
	ldrh	r2, [r3]
	cmp	r2, #159
	bhi	.L109
	ldrh	r2, [r3]
	cmp	r2, #159
	bls	.L108
	b	.L109
.L121:
	.align	2
.L120:
	.word	1027
	.word	frame1
	.word	.LANCHOR0
	.word	frame2
	.word	frame3
	.word	frame4
	.size	main, .-main
	.global	rCDel
	.global	rOldCol
	.global	rOldRow
	.global	rHeight
	.global	rRow
	.global	rCol
	.global	rWidth
	.global	scanlineCounter
	.global	videoBuffer
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	scanlineCounter, %object
	.size	scanlineCounter, 4
scanlineCounter:
	.word	67108870
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.type	rCol, %object
	.size	rCol, 4
rCol:
	.word	95
	.type	rCDel, %object
	.size	rCDel, 4
rCDel:
	.word	1
	.type	rWidth, %object
	.size	rWidth, 4
rWidth:
	.word	50
	.type	rHeight, %object
	.size	rHeight, 4
rHeight:
	.word	15
	.type	rRow, %object
	.size	rRow, 4
rRow:
	.word	80
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	rOldCol, %object
	.size	rOldCol, 4
rOldCol:
	.space	4
	.type	rOldRow, %object
	.size	rOldRow, 4
rOldRow:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
