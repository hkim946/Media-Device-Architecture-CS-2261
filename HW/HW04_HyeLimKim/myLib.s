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
	.global	setPixel3
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	setPixel3, %function
setPixel3:
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
	.size	setPixel3, .-setPixel3
	.align	2
	.global	setPixel4
	.syntax unified
	.arm
	.fpu softvfp
	.type	setPixel4, %function
setPixel4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L8
	rsb	r1, r1, r1, lsl #4
	ldr	ip, [r3]
	add	r1, r0, r1, lsl #4
	bic	r1, r1, #1
	ldrsh	r3, [ip, r1]
	tst	r0, #1
	andne	r3, r3, #255
	andeq	r3, r3, #65280
	orrne	r2, r3, r2, lsl #8
	orreq	r2, r3, r2
	strh	r2, [ip, r1]	@ movhi
	bx	lr
.L9:
	.align	2
.L8:
	.word	.LANCHOR0
	.size	setPixel4, .-setPixel4
	.align	2
	.global	drawRect3
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRect3, %function
drawRect3:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	subs	ip, r3, #0
	bxle	lr
	push	{r4, r5, lr}
	mov	lr, #0
	ldr	r5, .L19
	add	ip, r1, ip
	ldr	r3, [r5]
	rsb	r1, r1, r1, lsl #4
	rsb	ip, ip, ip, lsl #4
	add	r4, r0, r1, lsl #4
	add	ip, r0, ip, lsl #4
	ldr	r1, [r5, #4]
	orr	r0, r2, #-2130706432
	add	r2, r3, ip, lsl #1
	add	r3, r3, r4, lsl #1
.L12:
	add	ip, sp, #12
	str	lr, [r1, #44]
	str	ip, [r1, #36]
	str	r3, [r1, #40]
	add	r3, r3, #480
	cmp	r3, r2
	str	r0, [r1, #44]
	bne	.L12
	pop	{r4, r5, lr}
	bx	lr
.L20:
	.align	2
.L19:
	.word	.LANCHOR0
	.size	drawRect3, .-drawRect3
	.align	2
	.global	drawRect4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRect4, %function
drawRect4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	sub	sp, sp, #12
	ldrb	ip, [sp, #48]	@ zero_extendqisi2
	ldrb	lr, [sp, #48]	@ zero_extendqisi2
	cmp	r2, #2
	orr	ip, ip, lr, lsl #8
	strh	ip, [sp, #6]	@ movhi
	bgt	.L22
	cmp	r3, #0
	ble	.L21
	mov	r6, #0
	ldr	ip, .L53
	rsb	r1, r1, r1, lsl #4
	ldr	r5, [ip]
	lsl	r4, r1, #4
	add	r7, r2, r0
.L24:
	cmp	r2, #0
	movgt	lr, r0
	ble	.L30
.L27:
	add	r1, lr, r4
	bic	r1, r1, #1
	ldrsh	r8, [r5, r1]
	ldrb	ip, [sp, #48]	@ zero_extendqisi2
	tst	lr, #1
	and	ip, ip, #255
	and	r9, r8, #255
	add	lr, lr, #1
	andeq	r8, r8, #65280
	orrne	ip, r9, ip, lsl #8
	orreq	ip, r8, ip
	cmp	lr, r7
	strh	ip, [r5, r1]	@ movhi
	bne	.L27
.L30:
	add	r6, r6, #1
	cmp	r3, r6
	add	r4, r4, #240
	bne	.L24
.L21:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L22:
	ands	lr, r0, #1
	beq	.L52
	mov	ip, lr
	cmp	r0, #0
	rsblt	ip, lr, #0
	cmp	ip, #1
	bne	.L21
	ands	ip, r2, #1
	beq	.L37
	cmp	r3, #0
	ble	.L21
	mov	r5, #0
	ldr	ip, .L53
	sub	r8, r2, #1
	add	r3, r1, r3
	asr	r8, r8, #1
	rsb	r3, r3, r3, lsl #4
	rsb	r1, r1, r1, lsl #4
	ldm	ip, {r6, ip}
	add	r7, r0, r3, lsl #4
	orr	r8, r8, #-2130706432
	add	r0, r0, r1, lsl #4
	add	r2, sp, #6
.L40:
	bic	r1, r0, #1
	ldrsh	r4, [r6, r1]
	ldrb	r3, [sp, #48]	@ zero_extendqisi2
	cmp	lr, #0
	and	r3, r3, #255
	and	r9, r4, #255
	andeq	r4, r4, #65280
	orrne	r4, r9, r3, lsl #8
	orreq	r4, r4, r3
	add	r3, r0, #1
	add	r3, r3, r3, lsr #31
	bic	r3, r3, #1
	add	r0, r0, #240
	add	r3, r6, r3
	cmp	r7, r0
	strh	r4, [r6, r1]	@ movhi
	str	r5, [ip, #44]
	str	r2, [ip, #36]
	str	r3, [ip, #40]
	str	r8, [ip, #44]
	bne	.L40
	b	.L21
.L52:
	ands	r4, r2, #1
	bne	.L32
	cmp	r3, #0
	ble	.L21
	ldr	ip, .L53
	add	r3, r1, r3
	asr	r2, r2, #1
	rsb	r3, r3, r3, lsl #4
	rsb	r1, r1, r1, lsl #4
	ldm	ip, {r6, ip}
	add	lr, r0, r3, lsl #4
	orr	r5, r2, #-2130706432
	add	r0, r0, r1, lsl #4
	add	r2, sp, #6
.L33:
	add	r3, r0, r0, lsr #31
	bic	r3, r3, #1
	add	r0, r0, #240
	add	r3, r6, r3
	cmp	lr, r0
	str	r4, [ip, #44]
	str	r2, [ip, #36]
	str	r3, [ip, #40]
	str	r5, [ip, #44]
	bne	.L33
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L32:
	cmp	r3, #0
	ble	.L21
	mvn	r8, r0
	ldr	ip, .L53
	add	r9, r2, r0
	add	r3, r1, r3
	asr	r2, r2, #1
	rsb	r1, r1, r1, lsl #4
	rsb	r3, r3, r3, lsl #4
	sub	r7, r9, #1
	ldm	ip, {r5, ip}
	add	r6, r0, r3, lsl #4
	orr	r4, r2, #-2130706432
	add	r0, r0, r1, lsl #4
	and	r7, r7, #1
	add	r1, r8, r9
	add	r2, sp, #6
.L36:
	add	r3, r0, r0, lsr #31
	bic	r3, r3, #1
	add	r3, r5, r3
	str	lr, [ip, #44]
	add	r8, r1, r0
	str	r2, [ip, #36]
	str	r3, [ip, #40]
	str	r4, [ip, #44]
	bic	r8, r8, #1
	ldrsh	r9, [r5, r8]
	ldrb	r3, [sp, #48]	@ zero_extendqisi2
	cmp	r7, #0
	and	r3, r3, #255
	and	r10, r9, #255
	add	r0, r0, #240
	andeq	r9, r9, #65280
	orrne	r3, r10, r3, lsl #8
	orreq	r3, r9, r3
	cmp	r6, r0
	strh	r3, [r5, r8]	@ movhi
	bne	.L36
	b	.L21
.L37:
	cmp	r3, #0
	ble	.L21
	mvn	r8, r0
	ldr	r4, .L53
	add	r3, r1, r3
	sub	r9, r2, #1
	add	r2, r2, r0
	sub	r10, r2, #1
	rsb	r3, r3, r3, lsl #4
	rsb	r1, r1, r1, lsl #4
	asr	r9, r9, #1
	ldm	r4, {r5, r6}
	add	r3, r0, r3, lsl #4
	add	r8, r8, r2
	add	r0, r0, r1, lsl #4
	orr	r9, r9, #-2130706432
	and	r10, r10, #1
	add	r2, sp, #6
.L45:
	bic	r7, r0, #1
	ldrsh	r1, [r5, r7]
	ldrb	r4, [sp, #48]	@ zero_extendqisi2
	cmp	lr, #0
	and	r4, r4, #255
	and	fp, r1, #255
	andeq	r1, r1, #65280
	orreq	r4, r1, r4
	add	r1, r0, #1
	add	r1, r1, r1, lsr #31
	bic	r1, r1, #1
	orrne	r4, fp, r4, lsl #8
	add	r1, r5, r1
	strh	r4, [r5, r7]	@ movhi
	str	ip, [r6, #44]
	str	r2, [r6, #36]
	str	r1, [r6, #40]
	str	r9, [r6, #44]
	add	r1, r8, r0
	bic	r1, r1, #1
	ldrh	r7, [r5, r1]
	ldrb	r4, [sp, #48]	@ zero_extendqisi2
	cmp	r10, #0
	and	r4, r4, #255
	and	fp, r7, #255
	add	r0, r0, #240
	biceq	r7, r7, #255
	orrne	r4, fp, r4, lsl #8
	orreq	r4, r7, r4
	cmp	r3, r0
	strh	r4, [r5, r1]	@ movhi
	bne	.L45
	b	.L21
.L54:
	.align	2
.L53:
	.word	.LANCHOR0
	.size	drawRect4, .-drawRect4
	.align	2
	.global	fillScreen3
	.syntax unified
	.arm
	.fpu softvfp
	.type	fillScreen3, %function
fillScreen3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #0
	str	lr, [sp, #-4]!
	sub	sp, sp, #20
	strh	r0, [sp, #6]	@ movhi
	ldr	r2, .L57
	ldrh	lr, [sp, #6]
	ldm	r2, {r1, r3}
	ldr	r2, .L57+4
	add	r0, sp, #14
	str	ip, [r3, #44]
	str	r0, [r3, #36]
	str	r1, [r3, #40]
	str	r2, [r3, #44]
	add	sp, sp, #20
	@ sp needed
	ldr	lr, [sp], #4
	bx	lr
.L58:
	.align	2
.L57:
	.word	.LANCHOR0
	.word	-2130668032
	.size	fillScreen3, .-fillScreen3
	.align	2
	.global	fillScreen4
	.syntax unified
	.arm
	.fpu softvfp
	.type	fillScreen4, %function
fillScreen4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	lr, #0
	sub	sp, sp, #20
	strb	r0, [sp, #7]
	ldrb	r0, [sp, #7]	@ zero_extendqisi2
	ldrb	r3, [sp, #7]	@ zero_extendqisi2
	ldr	r1, .L61
	ldrb	ip, [sp, #7]	@ zero_extendqisi2
	lsl	r3, r3, #16
	ldrb	r2, [sp, #7]	@ zero_extendqisi2
	orr	r3, r3, r0, lsl #24
	orr	r3, r3, r2
	ldm	r1, {r0, r2}
	ldr	r1, .L61+4
	orr	r3, r3, ip, lsl #8
	add	ip, sp, #12
	str	r3, [sp, #12]
	str	lr, [r2, #44]
	str	ip, [r2, #36]
	str	r0, [r2, #40]
	str	r1, [r2, #44]
	add	sp, sp, #20
	@ sp needed
	ldr	lr, [sp], #4
	bx	lr
.L62:
	.align	2
.L61:
	.word	.LANCHOR0
	.word	-2063587968
	.size	fillScreen4, .-fillScreen4
	.align	2
	.global	drawImage3
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawImage3, %function
drawImage3:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	subs	lr, r3, #0
	ble	.L63
	mov	r4, #0
	ldr	r6, .L69
	add	lr, r1, lr
	ldr	r3, [r6]
	rsb	r1, r1, r1, lsl #4
	rsb	lr, lr, lr, lsl #4
	add	r5, r0, r1, lsl #4
	add	lr, r0, lr, lsl #4
	ldr	ip, [sp, #16]
	ldr	r1, [r6, #4]
	add	r0, r3, lr, lsl #1
	orr	lr, r2, #-2147483648
	add	r3, r3, r5, lsl #1
	lsl	r2, r2, #1
.L65:
	str	r4, [r1, #44]
	str	ip, [r1, #36]
	str	r3, [r1, #40]
	add	r3, r3, #480
	cmp	r3, r0
	str	lr, [r1, #44]
	add	ip, ip, r2
	bne	.L65
.L63:
	pop	{r4, r5, r6, lr}
	bx	lr
.L70:
	.align	2
.L69:
	.word	.LANCHOR0
	.size	drawImage3, .-drawImage3
	.align	2
	.global	drawImage4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawImage4, %function
drawImage4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r3, #0
	bxle	lr
	push	{r4, r5, r6, r7, lr}
	mov	r4, #0
	ldr	r7, .L79
	add	r2, r2, r2, lsr #31
	add	r3, r1, r3
	asr	lr, r2, #1
	rsb	r5, r1, r1, lsl #4
	rsb	r3, r3, r3, lsl #4
	ldr	ip, [sp, #20]
	ldr	r6, [r7]
	ldr	r2, [r7, #4]
	add	r1, r0, r3, lsl #4
	add	r0, r0, r5, lsl #4
	orr	r5, lr, #-2147483648
	lsl	lr, lr, #1
.L73:
	add	r3, r0, r0, lsr #31
	bic	r3, r3, #1
	add	r0, r0, #240
	add	r3, r6, r3
	cmp	r0, r1
	str	r4, [r2, #44]
	str	ip, [r2, #36]
	str	r3, [r2, #40]
	add	ip, ip, lr
	str	r5, [r2, #44]
	bne	.L73
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L80:
	.align	2
.L79:
	.word	.LANCHOR0
	.size	drawImage4, .-drawImage4
	.align	2
	.global	drawFullscreenImage3
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFullscreenImage3, %function
drawFullscreenImage3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, #0
	ldr	r2, .L82
	ldr	r1, .L82+4
	ldm	r2, {r2, r3}
	str	ip, [r3, #44]
	str	r0, [r3, #36]
	str	r2, [r3, #40]
	str	r1, [r3, #44]
	bx	lr
.L83:
	.align	2
.L82:
	.word	.LANCHOR0
	.word	-2147445248
	.size	drawFullscreenImage3, .-drawFullscreenImage3
	.align	2
	.global	drawFullscreenImage4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFullscreenImage4, %function
drawFullscreenImage4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, #0
	ldr	r2, .L85
	ldr	r1, .L85+4
	ldm	r2, {r2, r3}
	str	ip, [r3, #44]
	str	r0, [r3, #36]
	str	r2, [r3, #40]
	str	r1, [r3, #44]
	bx	lr
.L86:
	.align	2
.L85:
	.word	.LANCHOR0
	.word	-2147464448
	.size	drawFullscreenImage4, .-drawFullscreenImage4
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
.L88:
	ldrh	r3, [r2, #6]
	cmp	r3, #160
	bhi	.L88
	mov	r2, #67108864
.L89:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L89
	bx	lr
	.size	waitForVBlank, .-waitForVBlank
	.align	2
	.global	flipPage
	.syntax unified
	.arm
	.fpu softvfp
	.type	flipPage, %function
flipPage:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #67108864
	ldrh	r3, [r1]
	tst	r3, #16
	ldr	r2, .L96
	moveq	r2, #100663296
	ldr	r0, .L96+4
	eor	r3, r3, #16
	str	r2, [r0]
	strh	r3, [r1]	@ movhi
	bx	lr
.L97:
	.align	2
.L96:
	.word	100704256
	.word	.LANCHOR0
	.size	flipPage, .-flipPage
	.align	2
	.global	DMANow
	.syntax unified
	.arm
	.fpu softvfp
	.type	DMANow, %function
DMANow:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, #0
	ldr	ip, .L100
	ldr	lr, [ip, #4]
	add	r0, r0, r0, lsl #1
	add	ip, lr, r0, lsl #2
	orr	r3, r3, #-2147483648
	lsl	r0, r0, #2
	str	r4, [ip, #8]
	str	r1, [lr, r0]
	str	r2, [ip, #4]
	pop	{r4, lr}
	str	r3, [ip, #8]
	bx	lr
.L101:
	.align	2
.L100:
	.word	.LANCHOR0
	.size	DMANow, .-DMANow
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
	str	lr, [sp, #-4]!
	ldr	lr, [sp, #8]
	ldr	ip, [sp, #16]
	add	ip, lr, ip
	sub	ip, ip, #1
	cmp	ip, r1
	ble	.L106
	add	r1, r1, r3
	sub	r1, r1, #1
	cmp	r1, lr
	bgt	.L108
.L106:
	mov	r0, #0
	ldr	lr, [sp], #4
	bx	lr
.L108:
	ldr	r3, [sp, #4]
	ldr	r1, [sp, #12]
	add	r3, r3, r1
	sub	r3, r3, #1
	cmp	r3, r0
	ble	.L106
	ldr	r3, [sp, #4]
	add	r0, r0, r2
	sub	r0, r0, #1
	cmp	r0, r3
	movle	r0, #0
	movgt	r0, #1
	ldr	lr, [sp], #4
	bx	lr
	.size	collision, .-collision
	.global	dma
	.global	videoBuffer
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.type	dma, %object
	.size	dma, 4
dma:
	.word	67109040
	.ident	"GCC: (devkitARM release 53) 9.1.0"
