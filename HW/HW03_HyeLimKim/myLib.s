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
	.file	"myLib.c"
	.text
	.align	2
	.global	setPixel
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	setPixel, %function
setPixel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L3
	rsb	r1, r1, r1, lsl #4
	ldr	r3, [r3]
	add	r0, r0, r1, lsl #4
	lsl	r0, r0, #1
	strh	r2, [r3, r0]	@ movhi
	bx	lr
.L4:
	.align	2
.L3:
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
	subs	lr, r3, #0
	ldrh	ip, [sp, #8]
	ble	.L5
	ldr	r3, .L13
	rsb	r1, r1, r1, lsl #4
	add	r0, r0, r1, lsl #4
	ldr	r1, [r3]
	add	r3, r0, r2
	mov	r0, #0
	rsb	r4, r2, r2, lsl #31
	add	r1, r1, r3, lsl #1
	lsl	r4, r4, #1
.L7:
	cmp	r2, #0
	addgt	r3, r1, r4
	ble	.L10
.L8:
	strh	ip, [r3], #2	@ movhi
	cmp	r3, r1
	bne	.L8
.L10:
	add	r0, r0, #1
	cmp	lr, r0
	add	r1, r1, #480
	bne	.L7
.L5:
	pop	{r4, lr}
	bx	lr
.L14:
	.align	2
.L13:
	.word	.LANCHOR0
	.size	drawRect, .-drawRect
	.align	2
	.global	fillScreen
	.syntax unified
	.arm
	.fpu softvfp
	.type	fillScreen, %function
fillScreen:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L19
	ldr	r3, [r3]
	add	r2, r3, #76800
.L16:
	strh	r0, [r3], #2	@ movhi
	cmp	r3, r2
	bne	.L16
	bx	lr
.L20:
	.align	2
.L19:
	.word	.LANCHOR0
	.size	fillScreen, .-fillScreen
	.align	2
	.global	waitForVBlank
	.syntax unified
	.arm
	.fpu softvfp
	.type	waitForVBlank, %function
waitForVBlank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
.L22:
	ldrh	r3, [r2, #6]
	cmp	r3, #160
	bhi	.L22
	mov	r2, #67108864
.L23:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L23
	bx	lr
	.size	waitForVBlank, .-waitForVBlank
	.align	2
	.global	drawVerticalLine
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawVerticalLine, %function
drawVerticalLine:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	subs	ip, r2, #0
	bxeq	lr
	sub	ip, ip, #1
	and	ip, ip, #255
	add	ip, ip, r1
	rsb	r2, r1, r1, lsl #4
	add	r1, r0, #50331648
	rsb	ip, ip, ip, lsl #4
	add	r2, r0, r2, lsl #4
	add	r1, r1, #240
	lsl	r2, r2, #1
	add	r1, r1, ip, lsl #4
	add	r2, r2, #100663296
	lsl	r1, r1, #1
.L29:
	strh	r3, [r2]	@ movhi
	add	r2, r2, #480
	cmp	r2, r1
	bne	.L29
	bx	lr
	.size	drawVerticalLine, .-drawVerticalLine
	.align	2
	.global	drawHorizontalLine
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawHorizontalLine, %function
drawHorizontalLine:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	subs	lr, r2, #0
	beq	.L32
	add	ip, r0, #50331648
	rsb	r2, r1, r1, lsl #4
	sub	lr, lr, #1
	add	ip, ip, #1
	add	r1, ip, r2, lsl #4
	and	lr, lr, #255
	add	r2, r0, r2, lsl #4
	add	r1, r1, lr
	lsl	r2, r2, #1
	lsl	r1, r1, #1
	add	r2, r2, #100663296
.L34:
	strh	r3, [r2], #2	@ movhi
	cmp	r2, r1
	bne	.L34
.L32:
	ldr	lr, [sp], #4
	bx	lr
	.size	drawHorizontalLine, .-drawHorizontalLine
	.align	2
	.global	drawSquare
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawSquare, %function
drawSquare:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r2, #0
	bxeq	lr
	mov	ip, r0
	sub	r2, r2, #1
	push	{r4, lr}
	and	r4, r2, #255
	add	lr, r1, r4
	add	r2, r0, #50331648
	rsb	r1, r1, r1, lsl #4
	rsb	lr, lr, lr, lsl #4
	add	r0, r0, r1, lsl #4
	add	r2, r2, #240
	add	r2, r2, lr, lsl #4
	lsl	r0, r0, #1
	add	lr, ip, #1
	add	r0, r0, #100663296
	lsl	r1, r2, #1
	add	lr, lr, r4
.L40:
	mov	r2, r0
.L41:
	strh	r3, [r2]	@ movhi
	add	r2, r2, #480
	cmp	r1, r2
	bne	.L41
	add	ip, ip, #1
	cmp	ip, lr
	add	r0, r0, #2
	add	r1, r1, #2
	bne	.L40
	pop	{r4, lr}
	bx	lr
	.size	drawSquare, .-drawSquare
	.align	2
	.global	collision
	.syntax unified
	.arm
	.fpu softvfp
	.type	collision, %function
collision:
	@ Function supports interworking.
	@ args = 16, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r0, #199
	ldr	ip, [sp, #4]
	add	r3, r1, r3
	ble	.L51
	cmp	ip, r3
	bgt	.L60
	ldr	r3, [sp, #12]
	add	ip, ip, r3
	cmp	ip, r1
	blt	.L60
	ldr	r1, [sp]
	add	r3, r0, r2
	cmp	r3, r1
	blt	.L53
	mov	r3, r1
	ldr	r1, [sp, #8]
	add	r3, r3, r1
	cmp	r3, r0
	blt	.L53
	mov	r0, #1
	bx	lr
.L51:
	cmp	ip, r3
	bgt	.L60
	ldr	r3, [sp, #12]
	add	ip, ip, r3
	cmp	ip, r1
	bge	.L61
.L60:
	mov	r0, #0
	bx	lr
.L61:
	ldr	r3, [sp]
	add	r2, r0, r2
	cmp	r2, r3
	blt	.L60
	ldr	r2, [sp, #8]
	add	r3, r3, r2
	cmp	r3, r0
	movlt	r0, #0
	movge	r0, #1
	bx	lr
.L53:
	ldr	r3, [sp]
	rsb	r0, r0, #239
	sub	r2, r2, r0
	cmp	r3, r2
	bgt	.L60
	ldr	r2, [sp, #8]
	add	r0, r3, r2
	mvn	r0, r0
	lsr	r0, r0, #31
	bx	lr
	.size	collision, .-collision
	.global	videoBuffer
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.ident	"GCC: (devkitARM release 53) 9.1.0"
