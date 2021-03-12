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
	push	{r4, lr}
	mov	r3, #16384
	ldr	r4, .L4
	mov	r0, #3
	ldr	r2, .L4+4
	ldr	r1, .L4+8
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L4+12
	ldr	r1, .L4+16
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+24
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L4+28
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r2, #4096
	pop	{r4, lr}
	strh	r2, [r3]	@ movhi
	bx	lr
.L5:
	.align	2
.L4:
	.word	DMANow
	.word	100728832
	.word	spritesheetTiles
	.word	83886592
	.word	spritesheetPal
	.word	hideSprites
	.word	waitForVBlank
	.word	shadowOAM
	.size	initialize, .-initialize
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
	push	{r4, r7, fp, lr}
	ldr	r4, .L9
	ldr	r3, .L9+4
	mov	r7, r4
	mov	lr, pc
	bx	r3
	ldr	r6, .L9+8
	ldr	r5, .L9+12
.L7:
	mov	r3, #50
	mov	r2, #70
	strh	r3, [r4]	@ movhi
	strh	r3, [r4, #8]	@ movhi
	strh	r3, [r4, #16]	@ movhi
	strh	r3, [r4, #24]	@ movhi
	strh	r3, [r4, #32]	@ movhi
	strh	r3, [r4, #40]	@ movhi
	strh	r3, [r4, #48]	@ movhi
	strh	r3, [r4, #56]	@ movhi
	mov	r8, #28
	mov	lr, #26
	mov	ip, #12
	mov	r0, #66
	mov	r3, #0	@ movhi
	mov	fp, #4
	mov	r10, #68
	mov	r9, #128
	ldr	r1, .L9+16
	strh	r8, [r4, #12]	@ movhi
	strh	r1, [r4, #2]	@ movhi
	strh	lr, [r4, #20]	@ movhi
	strh	ip, [r4, #28]	@ movhi
	ldr	lr, .L9+20
	ldr	ip, .L9+24
	strh	r0, [r4, #36]	@ movhi
	strh	r3, [r4, #44]	@ movhi
	ldr	r0, .L9+28
	strh	r2, [r4, #52]	@ movhi
	strh	r2, [r4, #64]	@ movhi
	ldr	r3, .L9+32
	ldr	r2, .L9+36
	ldr	r8, .L9+40
	add	r1, r1, #16
	strh	r1, [r4, #10]	@ movhi
	add	r1, r1, #80
	strh	r0, [r4, #42]	@ movhi
	strh	r1, [r4, #50]	@ movhi
	strh	r2, [r4, #58]	@ movhi
	strh	r3, [r4, #66]	@ movhi
	strh	fp, [r4, #4]	@ movhi
	strh	r10, [r4, #60]	@ movhi
	strh	r9, [r4, #68]	@ movhi
	strh	r8, [r4, #18]	@ movhi
	strh	lr, [r4, #26]	@ movhi
	strh	ip, [r4, #34]	@ movhi
	mov	lr, pc
	bx	r6
	mov	r3, #512
	mov	r2, #117440512
	mov	r1, r7
	mov	r0, #3
	mov	lr, pc
	bx	r5
	b	.L7
.L10:
	.align	2
.L9:
	.word	shadowOAM
	.word	initialize
	.word	waitForVBlank
	.word	DMANow
	.word	16440
	.word	16488
	.word	16504
	.word	16520
	.word	-32664
	.word	16552
	.word	16472
	.size	main, .-main
	.comm	shadowOAM,1024,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
