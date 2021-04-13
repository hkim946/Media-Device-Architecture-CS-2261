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
	push	{r4, r5, r6, lr}
	mov	r2, #768
	mov	r5, #67108864
	ldr	r4, .L4
	strh	r2, [r5]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L4+4
	mov	lr, pc
	bx	r4
	mov	r2, #23552
	mov	r3, #2560
	strh	r2, [r5, #10]	@ movhi
	mov	r0, #3
	mov	r2, #100663296
	ldr	r1, .L4+8
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L4+12
	ldr	r1, .L4+16
	mov	lr, pc
	bx	r4
	ldr	r2, .L4+20
	mov	r3, #976
	strh	r2, [r5, #8]	@ movhi
	mov	r0, #3
	ldr	r2, .L4+24
	ldr	r1, .L4+28
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L4+32
	ldr	r1, .L4+36
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r1, #0
	ldr	r3, .L4+40
	ldr	r2, .L4+44
	strh	r1, [r3]	@ movhi
	ldr	r3, .L4+48
	ldrh	r2, [r2, #48]
	pop	{r4, r5, r6, lr}
	strh	r2, [r3]	@ movhi
	bx	lr
.L5:
	.align	2
.L4:
	.word	DMANow
	.word	cloudsPal
	.word	cloudsTiles
	.word	100720640
	.word	cloudsMap
	.word	6660
	.word	100679680
	.word	grassTiles
	.word	100716544
	.word	grassMap
	.word	hOff
	.word	67109120
	.word	buttons
	.size	initialize, .-initialize
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
	ldr	r3, .L12
	ldrh	r3, [r3, #48]
	push	{r4, lr}
	ldr	r4, .L12+4
	tst	r3, #32
	ldrheq	r3, [r4]
	subeq	r3, r3, #1
	strheq	r3, [r4]	@ movhi
	ldr	r3, .L12
	ldrh	r3, [r3, #48]
	tst	r3, #16
	ldrheq	r3, [r4]
	addeq	r3, r3, #1
	strheq	r3, [r4]	@ movhi
	ldr	r3, .L12+8
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	ldrh	r2, [r4]
	lsr	r1, r2, #2
	strh	r2, [r3, #16]	@ movhi
	pop	{r4, lr}
	strh	r1, [r3, #20]	@ movhi
	bx	lr
.L13:
	.align	2
.L12:
	.word	67109120
	.word	hOff
	.word	waitForVBlank
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
	push	{r7, lr}
	ldr	r3, .L17
	mov	lr, pc
	bx	r3
	ldr	r7, .L17+4
	ldr	r6, .L17+8
	ldr	r4, .L17+12
	ldr	r5, .L17+16
.L15:
	mov	lr, pc
	bx	r7
	ldrh	r3, [r4]
	strh	r3, [r6]	@ movhi
	ldrh	r3, [r5, #48]
	strh	r3, [r4]	@ movhi
	b	.L15
.L18:
	.align	2
.L17:
	.word	initialize
	.word	game
	.word	oldButtons
	.word	buttons
	.word	67109120
	.size	main, .-main
	.comm	hOff,2,2
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.ident	"GCC: (devkitARM release 53) 9.1.0"
