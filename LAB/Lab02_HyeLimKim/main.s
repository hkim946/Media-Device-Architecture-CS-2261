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
	.global	initialize
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r0, #31744
	push	{r4, r5, r6, r7, r8, lr}
	mov	r4, #0
	mov	ip, #992
	mvn	r1, #32768
	ldr	r2, .L4
	strh	r2, [r3]	@ movhi
	ldr	r2, .L4+4
	ldr	r3, .L4+8
	ldrh	r2, [r2, #48]
	strh	r2, [r3]	@ movhi
	ldr	r3, .L4+12
	ldr	r2, .L4+16
	strh	r0, [r3]	@ movhi
	ldr	r3, .L4+20
	strh	r4, [r2]	@ movhi
	ldr	r2, .L4+24
	strh	ip, [r3]	@ movhi
	ldr	r3, .L4+28
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	mov	ip, #10
	mov	r6, #240
	mov	r5, #150
	mov	r1, #15
	mov	r2, #95
	mov	lr, #50
	mov	r3, #1
	mov	r0, #113
	ldr	r7, .L4+32
	str	r4, [r7]
	ldr	r4, .L4+36
	str	ip, [r4]
	ldr	r4, .L4+40
	str	ip, [r4]
	ldr	ip, .L4+44
	str	r6, [ip]
	ldr	ip, .L4+48
	str	r5, [ip]
	ldr	ip, .L4+52
	str	r1, [ip]
	ldr	ip, .L4+56
	str	r1, [ip]
	ldr	ip, .L4+60
	str	r1, [ip]
	ldr	ip, .L4+64
	ldr	r1, .L4+68
	str	lr, [ip]
	str	r2, [r1]
	ldr	lr, .L4+72
	ldr	ip, .L4+76
	ldr	r1, .L4+80
	str	r2, [lr]
	str	r2, [ip]
	ldr	r4, .L4+84
	ldr	lr, .L4+88
	str	r3, [r1]
	ldr	ip, .L4+92
	ldr	r1, .L4+96
	ldr	r2, .L4+100
	str	r3, [r4]
	str	r3, [lr]
	str	r3, [ip]
	str	r0, [r1]
	str	r0, [r2]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	1027
	.word	67109120
	.word	buttons
	.word	bgColor
	.word	oldButtons
	.word	lColor
	.word	cColor
	.word	fillScreen
	.word	lCol
	.word	lHeight
	.word	cRow
	.word	lWidth
	.word	lRow
	.word	cHeight
	.word	yHeight
	.word	yWidth
	.word	cWidth
	.word	cCol
	.word	yRow
	.word	yOldRow
	.word	cRDel
	.word	cCDel
	.word	yRDel
	.word	yCDel
	.word	yCol
	.word	yOldCol
	.size	initialize, .-initialize
	.align	2
	.global	update
	.syntax unified
	.arm
	.fpu softvfp
	.type	update, %function
update:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, .L32
	ldrh	r3, [r3]
	tst	r3, #1
	sub	sp, sp, #28
	beq	.L7
	ldr	r3, .L32+4
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L30
.L7:
	ldr	r6, .L32+8
	ldr	r0, [r6]
	cmp	r0, #0
	movlt	r3, #0
	ldrlt	r2, .L32+12
	strlt	r0, [r2]
	movlt	r0, r3
	ldr	r8, .L32+16
	ldr	r2, [r8]
	strlt	r3, [r6]
	add	r3, r2, r0
	cmp	r3, #240
	ldr	r5, .L32+20
	ldrgt	r3, .L32+12
	ldr	r1, [r5]
	strgt	r0, [r3]
	rsbgt	r0, r2, #240
	strgt	r0, [r6]
	cmp	r1, #0
	movlt	r3, #0
	ldrlt	ip, .L32+24
	strlt	r1, [ip]
	movlt	r1, r3
	ldr	r7, .L32+28
	strlt	r3, [r5]
	ldr	r3, [r7]
	add	ip, r3, r1
	cmp	ip, #160
	ldrgt	ip, .L32+24
	strgt	r1, [ip]
	ldr	ip, .L32+32
	ldrh	lr, [ip, #48]
	rsbgt	r1, r3, #160
	strgt	r1, [r5]
	tst	lr, #64
	subeq	r1, r1, #1
	streq	r1, [r5]
	beq	.L14
	ldrh	lr, [ip, #48]
	tst	lr, #128
	addeq	r1, r1, #1
	streq	r1, [r5]
	bne	.L31
.L14:
	ldr	r9, .L32+36
	ldr	r4, .L32+40
	ldr	r10, .L32+44
	ldr	lr, [r9]
	ldr	ip, [r4]
	ldr	r10, [r10]
	cmp	lr, #0
	str	r10, [sp, #20]
	rsble	ip, ip, #0
	add	r10, lr, r10
	strle	ip, [r4]
	ldr	fp, .L32+48
	cmp	r10, #240
	ldr	r10, .L32+52
	rsbgt	ip, ip, #0
	strgt	ip, [r4]
	ldr	r10, [r10]
	ldr	fp, [fp]
	add	ip, lr, ip
	ldr	lr, [sp, #20]
	str	r10, [sp, #4]
	str	ip, [sp]
	str	lr, [sp, #8]
	str	fp, [sp, #12]
	ldr	r10, .L32+56
	str	ip, [r9]
	mov	lr, pc
	bx	r10
	cmp	r0, #0
	bne	.L19
	ldr	r3, [r7]
	ldr	r2, [r8]
	ldr	r0, [r6]
	ldr	r1, [r5]
.L20:
	ldr	r4, .L32+60
	ldr	lr, .L32+64
	ldr	ip, .L32+68
	ldr	r9, [r4]
	ldr	r4, [lr]
	ldr	lr, [ip]
	ldr	ip, .L32+72
	ldr	ip, [ip]
	str	r9, [sp, #12]
	stm	sp, {ip, lr}
	str	r4, [sp, #8]
	mov	lr, pc
	bx	r10
	cmp	r0, #0
	beq	.L6
	ldr	r1, .L32+76
	ldr	r3, [r8]
	ldrh	r0, [r1]
	add	r3, r3, r3, lsr #31
	asr	r3, r3, #1
	rsb	r3, r3, #120
	cmp	r0, #992
	str	r3, [r6]
	moveq	r3, #0
	ldr	r2, [r7]
	add	r2, r2, #80
	str	r2, [r5]
	strheq	r3, [r1]	@ movhi
	beq	.L6
	cmp	r0, #0
	moveq	r3, #992
	strheq	r3, [r1]	@ movhi
.L6:
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L19:
	ldr	ip, [r4]
	cmp	ip, #0
	movne	ip, #0
	ldr	r2, [r8]
	ldr	r3, [r7]
	add	r0, r2, r2, lsr #31
	asr	r0, r0, #1
	rsb	r0, r0, #120
	add	r1, r3, #80
	str	r0, [r6]
	str	r1, [r5]
	strne	ip, [r4]
	bne	.L20
	ldr	ip, [r9]
	cmp	ip, #239
	movle	ip, #1
	strle	ip, [r4]
	b	.L20
.L31:
	ldrh	lr, [ip, #48]
	tst	lr, #32
	subeq	r0, r0, #1
	streq	r0, [r6]
	beq	.L14
	ldrh	ip, [ip, #48]
	tst	ip, #16
	addeq	r0, r0, #1
	streq	r0, [r6]
	b	.L14
.L30:
	ldr	r3, .L32+80
	ldr	r2, .L32+84
	ldrh	r1, [r3]
	cmp	r1, r2
	mvn	r2, #32768
	ldreq	r2, .L32+88
	strh	r2, [r3]	@ movhi
	b	.L7
.L33:
	.align	2
.L32:
	.word	oldButtons
	.word	buttons
	.word	yCol
	.word	yOldCol
	.word	yWidth
	.word	yRow
	.word	yOldRow
	.word	yHeight
	.word	67109120
	.word	cCol
	.word	cCDel
	.word	cWidth
	.word	cHeight
	.word	cRow
	.word	collision
	.word	lHeight
	.word	lWidth
	.word	lRow
	.word	lCol
	.word	lColor
	.word	cColor
	.word	32767
	.word	21140
	.size	update, .-update
	.align	2
	.global	draw
	.syntax unified
	.arm
	.fpu softvfp
	.type	draw, %function
draw:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r5, .L36
	ldrh	r3, [r5]
	sub	sp, sp, #12
	str	r3, [sp]
	ldr	r9, .L36+4
	ldr	r8, .L36+8
	ldr	r1, .L36+12
	ldr	r0, .L36+16
	ldr	r4, .L36+20
	ldr	r3, [r9]
	ldr	r2, [r8]
	ldr	r1, [r1]
	ldr	r0, [r0]
	mov	lr, pc
	bx	r4
	ldrh	r3, [r5]
	ldr	ip, .L36+24
	str	r3, [sp]
	ldr	fp, .L36+28
	ldr	r10, .L36+32
	ldr	r5, .L36+36
	ldr	r0, [ip]
	ldr	r3, [fp]
	ldr	r2, [r10]
	ldr	r1, [r5]
	mov	lr, pc
	bx	r4
	ldr	r3, .L36+40
	ldr	r7, .L36+44
	ldrh	r1, [r3]
	ldr	r6, .L36+48
	ldr	r3, [r9]
	ldr	r2, [r8]
	ldr	r0, [r6]
	str	r1, [sp]
	ldr	r1, [r7]
	mov	lr, pc
	bx	r4
	ldr	r9, .L36+52
	ldr	r8, .L36+56
	ldr	ip, .L36+60
	ldr	r1, [r9]
	ldr	r0, [r8]
	ldr	r3, [fp]
	ldr	r2, [r10]
	str	ip, [sp]
	mov	lr, pc
	bx	r4
	ldr	r2, .L36+64
	ldrh	ip, [r2]
	ldr	r3, .L36+68
	str	ip, [sp]
	ldr	r2, .L36+72
	ldr	r1, .L36+76
	ldr	r0, .L36+80
	ldr	r3, [r3]
	ldr	r2, [r2]
	ldr	r1, [r1]
	ldr	r0, [r0]
	mov	lr, pc
	bx	r4
	ldr	r0, [r9]
	ldr	r1, [r8]
	ldr	ip, .L36+24
	ldr	r2, [r7]
	ldr	r3, [r6]
	str	r0, [r5]
	str	r1, [ip]
	ldr	r0, .L36+16
	ldr	r1, .L36+12
	str	r3, [r0]
	str	r2, [r1]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L37:
	.align	2
.L36:
	.word	bgColor
	.word	cHeight
	.word	cWidth
	.word	cOldRow
	.word	cOldCol
	.word	drawRect
	.word	yOldCol
	.word	yHeight
	.word	yWidth
	.word	yOldRow
	.word	cColor
	.word	cRow
	.word	cCol
	.word	yRow
	.word	yCol
	.word	1023
	.word	lColor
	.word	lHeight
	.word	lWidth
	.word	lRow
	.word	lCol
	.size	draw, .-draw
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
	push	{r7, lr}
	ldr	r3, .L41
	mov	lr, pc
	bx	r3
	ldr	r9, .L41+4
	ldr	r4, .L41+8
	ldr	r8, .L41+12
	ldr	r7, .L41+16
	ldr	r6, .L41+20
	ldr	r5, .L41+24
.L39:
	ldrh	r3, [r4]
	strh	r3, [r9]	@ movhi
	ldrh	r3, [r5, #48]
	strh	r3, [r4]	@ movhi
	mov	lr, pc
	bx	r8
	mov	lr, pc
	bx	r7
	mov	lr, pc
	bx	r6
	b	.L39
.L42:
	.align	2
.L41:
	.word	initialize
	.word	oldButtons
	.word	buttons
	.word	update
	.word	waitForVBlank
	.word	draw
	.word	67109120
	.size	main, .-main
	.comm	yWidth,4,4
	.comm	yHeight,4,4
	.comm	yCDel,4,4
	.comm	yRDel,4,4
	.comm	yOldCol,4,4
	.comm	yOldRow,4,4
	.comm	yCol,4,4
	.comm	yRow,4,4
	.comm	cColor,2,2
	.comm	cCDel,4,4
	.comm	cRDel,4,4
	.comm	cOldCol,4,4
	.comm	cOldRow,4,4
	.comm	cWidth,4,4
	.comm	cHeight,4,4
	.comm	cRow,4,4
	.comm	cCol,4,4
	.comm	lColor,2,2
	.comm	lWidth,4,4
	.comm	lHeight,4,4
	.comm	lCol,4,4
	.comm	lRow,4,4
	.comm	bgColor,2,2
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.ident	"GCC: (devkitARM release 53) 9.1.0"
