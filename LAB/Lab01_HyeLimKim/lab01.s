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
	.file	"lab01.c"
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
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	subs	ip, r1, #0
	bxle	lr
	ldr	r3, .L19
	ldr	r2, [r3]
	ldr	r1, .L19+4
	rsb	r3, ip, ip, lsl #4
	str	lr, [sp, #-4]!
	add	r2, r2, r3, lsl #5
	lsl	lr, r0, #1
.L7:
	cmp	r0, #0
	addgt	r3, r2, lr
	ble	.L10
.L8:
	strh	r1, [r3], #-2	@ movhi
	cmp	r3, r2
	bne	.L8
.L10:
	subs	ip, ip, #1
	sub	r2, r2, #480
	bne	.L7
	ldr	lr, [sp], #4
	bx	lr
.L20:
	.align	2
.L19:
	.word	.LANCHOR0
	.word	32736
	.size	drawRect, .-drawRect
	.align	2
	.global	drawTriangle
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawTriangle, %function
drawTriangle:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L25
	push	{r4, r5, lr}
	rsb	r3, r1, r1, lsl #4
	ldr	r4, [r2]
	add	r5, r0, r3, lsl #4
	add	r2, r4, r5, lsl #1
	mov	ip, r2
	mov	lr, #992
	sub	r3, r5, #6016
	sub	r3, r3, #9
	sub	r1, r4, #52
	add	r3, r4, r3, lsl #1
	add	r1, r1, r5, lsl #1
.L22:
	strh	lr, [r2]	@ movhi
	strh	lr, [r2, #-50]	@ movhi
	sub	r2, r2, #2
	strh	lr, [ip]	@ movhi
	cmp	r2, r1
	strh	lr, [r3]	@ movhi
	sub	ip, ip, #480
	add	r3, r3, #476
	sub	ip, ip, #2
	add	r3, r3, #2
	bne	.L22
	pop	{r4, r5, lr}
	bx	lr
.L26:
	.align	2
.L25:
	.word	.LANCHOR0
	.size	drawTriangle, .-drawTriangle
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
	ldr	r3, .L34
	ldr	r1, .L34+4
	ldr	r0, [r3]
	push	{r4, lr}
	strh	r1, [r2]	@ movhi
	ldr	r1, .L34+8
	add	r2, r0, #14400
.L28:
	add	r3, r2, #100
.L29:
	strh	r1, [r3], #-2	@ movhi
	cmp	r3, r2
	bne	.L29
	sub	r2, r3, #480
	cmp	r2, r0
	bne	.L28
	mov	r1, #100
	mov	r0, #150
	ldr	r4, .L34+12
	mov	lr, pc
	bx	r4
	mov	r1, #150
	mov	r0, #80
	mov	lr, pc
	bx	r4
.L31:
	b	.L31
.L35:
	.align	2
.L34:
	.word	.LANCHOR0
	.word	1027
	.word	32736
	.word	drawTriangle
	.size	main, .-main
	.global	videoBuffer
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.ident	"GCC: (devkitARM release 53) 9.1.0"
