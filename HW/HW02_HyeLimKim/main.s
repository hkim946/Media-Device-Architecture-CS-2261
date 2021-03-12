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
	mov	r0, #0
	mov	r3, #67108864
	mov	r1, #31
	push	{r4, r5, r6, lr}
	mvn	lr, #64512
	ldr	ip, .L4
	ldr	r2, .L4+4
	strh	ip, [r3]	@ movhi
	str	r0, [r2]
	ldr	r3, .L4+8
	ldr	r2, .L4+12
	str	r0, [r3]
	ldrh	r2, [r2, #48]
	ldr	r3, .L4+16
	ldr	ip, .L4+20
	strh	r2, [r3]	@ movhi
	ldr	r2, .L4+24
	ldr	r3, .L4+28
	strh	r0, [ip]	@ movhi
	strh	r0, [r2]	@ movhi
	ldr	ip, .L4+32
	ldr	r2, .L4+36
	strh	r1, [r3]	@ movhi
	ldr	r1, .L4+40
	ldr	r3, .L4+44
	strh	lr, [ip]	@ movhi
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	mov	lr, #30
	mov	r1, #5
	mov	r3, #10
	mov	r2, #1
	ldr	r5, .L4+48
	mov	r4, #230
	str	lr, [r5]
	ldr	r5, .L4+52
	mov	ip, #80
	mov	r0, #120
	str	lr, [r5]
	ldr	lr, .L4+56
	str	r1, [lr]
	ldr	lr, .L4+60
	str	r1, [lr]
	ldr	lr, .L4+64
	str	r1, [lr]
	ldr	lr, .L4+68
	str	r1, [lr]
	ldr	r1, .L4+72
	str	r3, [r1]
	ldr	r1, .L4+76
	str	r3, [r1]
	ldr	r1, .L4+80
	str	r3, [r1]
	ldr	r1, .L4+84
	str	r3, [r1]
	ldr	r1, .L4+88
	str	r3, [r1]
	ldr	r1, .L4+92
	str	r3, [r1]
	ldr	r1, .L4+96
	str	r3, [r1]
	ldr	r3, .L4+100
	ldr	r1, .L4+104
	str	r2, [r3]
	ldr	r3, .L4+108
	str	r2, [r1]
	str	r2, [r3]
	ldr	r1, .L4+112
	ldr	r3, .L4+116
	str	r2, [r1]
	str	r2, [r3]
	ldr	r1, .L4+120
	ldr	r3, .L4+124
	str	r2, [r1]
	str	r4, [r3]
	ldr	lr, .L4+128
	ldr	r1, .L4+132
	ldr	r2, .L4+136
	ldr	r3, .L4+140
	str	ip, [lr]
	str	ip, [r1]
	str	r0, [r2]
	str	r0, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	1027
	.word	lScore
	.word	rScore
	.word	67109120
	.word	buttons
	.word	oldButtons
	.word	bgColor
	.word	bColor
	.word	rColor
	.word	lColor
	.word	32736
	.word	fillScreen
	.word	lHeight
	.word	rHeight
	.word	lWidth
	.word	rWidth
	.word	bHeight
	.word	bWidth
	.word	lRow
	.word	lCol
	.word	lOldRow
	.word	lOldCol
	.word	rRow
	.word	rOldRow
	.word	rOldCol
	.word	lRDel
	.word	lCDel
	.word	rRDel
	.word	rCDel
	.word	bRDel
	.word	bCDel
	.word	rCol
	.word	bRow
	.word	bOldRow
	.word	bCol
	.word	bOldCol
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
	ldr	r3, .L35
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r2, .L35+4
	ldrh	r1, [r3, #48]
	ldr	ip, [r2]
	tst	r1, #64
	subeq	ip, ip, #2
	streq	ip, [r2]
	sub	sp, sp, #28
	beq	.L8
	ldrh	r3, [r3, #48]
	tst	r3, #128
	addeq	ip, ip, #2
	streq	ip, [r2]
.L8:
	ldr	r1, .L35
	ldr	r6, .L35+8
	ldrh	r3, [r1, #48]
	tst	r3, #1
	ldr	r3, [r6]
	subeq	r3, r3, #2
	streq	r3, [r6]
	beq	.L10
	ldrh	r1, [r1, #48]
	tst	r1, #2
	addeq	r3, r3, #2
	streq	r3, [r6]
.L10:
	ldr	r1, .L35+12
	ldr	lr, [r1]
	cmp	lr, #0
	movlt	r0, #0
	ldrlt	r4, .L35+16
	strlt	r0, [r1]
	strlt	lr, [r4]
	movlt	lr, r0
	cmp	ip, #0
	movlt	r1, #0
	ldrlt	r0, .L35+20
	strlt	ip, [r0]
	movlt	ip, r1
	strlt	r1, [r2]
	ldr	r1, .L35+24
	ldr	r10, [r1]
	add	r1, r10, ip
	cmp	r1, #160
	ldrgt	r1, .L35+20
	ldr	r9, .L35+28
	strgt	ip, [r1]
	rsbgt	ip, r10, #160
	strgt	ip, [r2]
	ldr	r2, [r9]
	cmp	r2, #239
	ldrgt	r1, .L35+32
	strgt	r1, [sp, #20]
	ldrgt	r1, [r1]
	ldrle	r2, .L35+32
	ldrgt	r0, .L35+36
	rsbgt	r1, r1, #240
	strle	r2, [sp, #20]
	strgt	r1, [r9]
	strgt	r2, [r0]
	cmp	r3, #0
	movlt	r2, #0
	ldrlt	r1, .L35+40
	strlt	r3, [r1]
	movlt	r3, r2
	strlt	r2, [r6]
	ldr	r2, .L35+44
	ldr	r2, [r2]
	add	r1, r2, r3
	cmp	r1, #160
	ldrgt	r1, .L35+40
	ldr	r4, .L35+48
	strgt	r3, [r1]
	ldr	r1, [r4]
	rsbgt	r2, r2, #160
	ldr	r3, .L35+52
	strgt	r2, [r6]
	cmp	r1, #0
	ldr	r8, .L35+56
	ldr	r3, [r3]
	ble	.L17
	add	r2, r1, r3
	cmp	r2, #160
	bgt	.L17
.L18:
	ldr	r5, .L35+60
	ldr	r0, [r5]
	ldr	r2, .L35+64
	cmp	r0, #0
	ldr	r2, [r2]
	ble	.L19
	add	r7, r0, r2
	cmp	r7, #235
	ble	.L34
.L19:
	ldr	r7, .L35+68
	ldr	fp, [r7]
	rsb	fp, fp, #0
	str	fp, [r7]
.L20:
	ldr	fp, .L35+72
	ldr	fp, [fp]
	str	r10, [sp, #12]
	str	ip, [sp, #4]
	str	lr, [sp]
	str	fp, [sp, #8]
	ldr	r10, .L35+76
	mov	lr, pc
	bx	r10
	cmp	r0, #0
	beq	.L21
	ldr	r3, [r7]
	rsb	r3, r3, #0
	str	r3, [r7]
	ldr	r0, [r5]
.L22:
	ldr	r3, .L35+44
	ldr	ip, [r3]
	ldr	r3, [sp, #20]
	ldr	r2, [r6]
	ldr	r1, [r3]
	ldr	r3, [r9]
	str	r2, [sp, #4]
	str	r3, [sp]
	str	ip, [sp, #12]
	str	r1, [sp, #8]
	ldr	r3, .L35+52
	ldr	r2, .L35+64
	ldr	r3, [r3]
	ldr	r2, [r2]
	ldr	r1, [r4]
	mov	lr, pc
	bx	r10
	cmp	r0, #0
	ldr	r3, [r5]
	beq	.L25
	ldr	r1, [r8]
	cmp	r3, #120
	rsbgt	r1, r1, #0
	strgt	r1, [r8]
.L26:
	ldr	r2, [r4]
	ldr	r0, [r7]
	add	r2, r2, r1, lsl #1
	add	r3, r3, r0, lsl #1
	str	r3, [r5]
	str	r2, [r4]
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L17:
	ldr	r2, [r8]
	rsb	r2, r2, #0
	str	r2, [r8]
	b	.L18
.L25:
	cmp	r3, #230
	ldr	r1, [r8]
	bne	.L26
	ldr	r0, .L35+80
	ldr	ip, .L35+84
	ldrh	r2, [r0]
	cmp	r2, ip
	ldreq	r2, .L35+88
	strheq	r2, [r0]	@ movhi
	beq	.L28
	ldr	lr, .L35+88
	cmp	r2, lr
	strheq	ip, [r0]	@ movhi
.L28:
	ldr	r0, .L35+92
	ldr	r2, [r0]
	add	r2, r2, #1
	str	r2, [r0]
	b	.L26
.L21:
	ldr	r0, [r5]
	cmp	r0, #0
	bne	.L22
	ldr	r2, .L35+96
	ldr	r1, .L35+100
	ldrh	r3, [r2]
	cmp	r3, r1
	moveq	r3, #992
	mvn	r1, #64512
	strheq	r3, [r2]	@ movhi
	beq	.L24
	cmp	r3, #992
	strheq	r1, [r2]	@ movhi
.L24:
	ldr	r2, .L35+104
	ldr	r3, [r2]
	add	r3, r3, #1
	str	r3, [r2]
	b	.L22
.L34:
	ldr	r7, .L35+68
	b	.L20
.L36:
	.align	2
.L35:
	.word	67109120
	.word	lRow
	.word	rRow
	.word	lCol
	.word	lOldCol
	.word	lOldRow
	.word	lHeight
	.word	rCol
	.word	rWidth
	.word	rOldCol
	.word	rOldRow
	.word	rHeight
	.word	bRow
	.word	bHeight
	.word	bRDel
	.word	bCol
	.word	bWidth
	.word	bCDel
	.word	lWidth
	.word	collision
	.word	lColor
	.word	32736
	.word	31775
	.word	lScore
	.word	rColor
	.word	1023
	.word	rScore
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
	ldr	r9, .L39
	ldrh	r3, [r9]
	sub	sp, sp, #12
	str	r3, [sp]
	ldr	r8, .L39+4
	ldr	r7, .L39+8
	ldr	r1, .L39+12
	ldr	r0, .L39+16
	ldr	r4, .L39+20
	ldr	r3, [r8]
	ldr	r2, [r7]
	ldr	r1, [r1]
	ldr	r0, [r0]
	mov	lr, pc
	bx	r4
	ldrh	r3, [r9]
	ldr	ip, .L39+24
	str	r3, [sp]
	ldr	r6, .L39+28
	ldr	r5, .L39+32
	ldr	r10, .L39+36
	ldr	r1, [ip]
	ldr	r3, [r6]
	ldr	r2, [r5]
	ldr	r0, [r10]
	mov	lr, pc
	bx	r4
	ldrh	r3, [r9]
	ldr	fp, .L39+40
	str	r3, [sp]
	ldr	r10, .L39+44
	ldr	r9, .L39+48
	ldr	r0, .L39+52
	ldr	r3, [fp]
	ldr	r2, [r10]
	ldr	r1, [r9]
	ldr	r0, [r0]
	mov	lr, pc
	bx	r4
	ldr	r3, .L39+56
	ldrh	r1, [r3]
	ldr	r2, [r7]
	ldr	r3, [r8]
	ldr	r9, .L39+60
	str	r1, [sp]
	ldr	r7, .L39+64
	ldr	r0, [r9]
	ldr	r1, [r7]
	mov	lr, pc
	bx	r4
	ldr	r3, .L39+68
	ldrh	r1, [r3]
	ldr	r2, [r5]
	ldr	r3, [r6]
	ldr	r8, .L39+72
	str	r1, [sp]
	ldr	r7, .L39+76
	ldr	r1, [r8]
	ldr	r0, [r7]
	mov	lr, pc
	bx	r4
	ldr	r3, .L39+80
	ldrh	r1, [r3]
	ldr	r2, [r10]
	ldr	r6, .L39+84
	str	r1, [sp]
	ldr	r5, .L39+88
	ldr	r3, [fp]
	ldr	r1, [r6]
	ldr	r0, [r5]
	mov	lr, pc
	bx	r4
	ldr	r3, .L39+64
	ldr	r4, .L39+12
	ldr	lr, [r3]
	ldr	ip, [r9]
	str	lr, [r4]
	ldr	lr, .L39+16
	ldr	r0, [r8]
	str	ip, [lr]
	ldr	ip, .L39+24
	ldr	r1, [r7]
	ldr	r2, [r6]
	ldr	r3, [r5]
	str	r0, [ip]
	ldr	r10, .L39+36
	ldr	r9, .L39+48
	ldr	r0, .L39+52
	str	r1, [r10]
	str	r2, [r9]
	str	r3, [r0]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L40:
	.align	2
.L39:
	.word	bgColor
	.word	lHeight
	.word	lWidth
	.word	lOldRow
	.word	lOldCol
	.word	drawRect
	.word	rOldRow
	.word	rHeight
	.word	rWidth
	.word	rOldCol
	.word	bHeight
	.word	bWidth
	.word	bOldRow
	.word	bOldCol
	.word	lColor
	.word	lCol
	.word	lRow
	.word	rColor
	.word	rRow
	.word	rCol
	.word	bColor
	.word	bRow
	.word	bCol
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
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, .L49
	mov	lr, pc
	bx	r3
	ldr	r9, .L49+4
	ldr	r5, .L49+8
	ldr	r4, .L49+12
	ldr	r8, .L49+16
	ldr	r7, .L49+20
	ldr	fp, .L49+24
	ldr	r6, .L49+28
	ldr	r10, .L49+32
.L43:
	ldrh	r3, [r5]
	strh	r3, [r9]	@ movhi
	ldrh	r3, [r6, #48]
	strh	r3, [r5]	@ movhi
	mov	lr, pc
	bx	r4
	mov	lr, pc
	bx	r8
	mov	lr, pc
	bx	r4
	mov	lr, pc
	bx	r7
	ldr	r3, [fp]
	cmp	r3, #3
	beq	.L42
	ldr	r3, [r10]
	cmp	r3, #3
	bne	.L43
.L42:
	mov	r0, #0
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L50:
	.align	2
.L49:
	.word	initialize
	.word	oldButtons
	.word	buttons
	.word	waitForVBlank
	.word	update
	.word	draw
	.word	lScore
	.word	67109120
	.word	rScore
	.size	main, .-main
	.text
	.align	2
	.global	endGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	endGame, %function
endGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L54
	ldr	r3, [r3]
	cmp	r3, #3
	beq	.L53
	ldr	r3, .L54+4
	ldr	r0, [r3]
	sub	r3, r0, #3
	rsbs	r0, r3, #0
	adc	r0, r0, r3
	bx	lr
.L53:
	mov	r0, #1
	bx	lr
.L55:
	.align	2
.L54:
	.word	lScore
	.word	rScore
	.size	endGame, .-endGame
	.comm	bColor,2,2
	.comm	bCDel,4,4
	.comm	bRDel,4,4
	.comm	bOldCol,4,4
	.comm	bOldRow,4,4
	.comm	bWidth,4,4
	.comm	bHeight,4,4
	.comm	bCol,4,4
	.comm	bRow,4,4
	.comm	rColor,2,2
	.comm	rCDel,4,4
	.comm	rRDel,4,4
	.comm	rOldCol,4,4
	.comm	rOldRow,4,4
	.comm	rWidth,4,4
	.comm	rHeight,4,4
	.comm	rCol,4,4
	.comm	rRow,4,4
	.comm	lColor,2,2
	.comm	lCDel,4,4
	.comm	lRDel,4,4
	.comm	lOldCol,4,4
	.comm	lOldRow,4,4
	.comm	lWidth,4,4
	.comm	lHeight,4,4
	.comm	lCol,4,4
	.comm	lRow,4,4
	.comm	rScore,4,4
	.comm	lScore,4,4
	.comm	bgColor,2,2
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.ident	"GCC: (devkitARM release 53) 9.1.0"
