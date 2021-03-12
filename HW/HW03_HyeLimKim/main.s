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
	.global	drawChar
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawChar, %function
drawChar:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	rsb	r1, r1, r1, lsl #4
	push	{r4, r5, lr}
	ldr	lr, .L12
	add	r4, r0, r1, lsl #4
	lsl	r4, r4, #1
	add	r2, r2, r2, lsl #1
	add	r4, r4, #100663296
	add	lr, lr, r2, lsl #4
	add	r5, r0, #6
.L2:
	mov	r1, r4
	sub	r2, lr, #48
.L4:
	ldrb	ip, [r2]	@ zero_extendqisi2
	add	r2, r2, #6
	cmp	ip, #0
	strhne	r3, [r1]	@ movhi
	cmp	r2, lr
	add	r1, r1, #480
	bne	.L4
	add	r0, r0, #1
	cmp	r0, r5
	add	lr, r2, #1
	add	r4, r4, #2
	bne	.L2
	pop	{r4, r5, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	fontdata_6x8+48
	.size	drawChar, .-drawChar
	.align	2
	.global	startState
	.syntax unified
	.arm
	.fpu softvfp
	.type	startState, %function
startState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L23
	ldrh	r3, [r3]
	tst	r3, #4
	bxeq	lr
	ldr	r3, .L23+4
	ldrh	r3, [r3]
	tst	r3, #4
	bxne	lr
	push	{r4, lr}
	ldr	r0, .L23+8
	ldr	r3, .L23+12
	mov	lr, pc
	bx	r3
	mov	r1, #1
	ldr	r2, .L23+16
	ldr	r3, .L23+20
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L24:
	.align	2
.L23:
	.word	oldButtons
	.word	buttons
	.word	30304
	.word	fillScreen
	.word	state
	.word	initGame
	.size	startState, .-startState
	.align	2
	.global	goToStart
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L67
	mov	r0, #31744
	mov	lr, pc
	bx	r3
	mov	r2, #0
	mov	r1, #105
	mov	lr, #3840
	mvn	r4, #32768
	ldr	r3, .L67+4
	ldr	ip, .L67+8
	str	r2, [r3]
	sub	r5, ip, #105
.L26:
	add	r2, r5, r1
	sub	r3, lr, #3840
.L28:
	ldrb	r0, [r2, #3984]	@ zero_extendqisi2
	cmp	r0, #0
	ldrne	r0, .L67+12
	addne	r0, r3, r0
	add	r3, r3, #480
	strhne	r4, [r0, #2]	@ movhi
	cmp	r3, lr
	add	r2, r2, #6
	bne	.L28
	add	r1, r1, #1
	cmp	r1, #111
	add	lr, r3, #2
	bne	.L26
	mov	lr, #3840
	mvn	r4, #32768
	sub	r5, ip, #111
.L29:
	add	r2, r5, r1
	sub	r3, lr, #3840
.L31:
	ldrb	r0, [r2, #4032]	@ zero_extendqisi2
	cmp	r0, #0
	ldrne	r0, .L67+12
	addne	r0, r3, r0
	add	r3, r3, #480
	strhne	r4, [r0, #14]	@ movhi
	cmp	r3, lr
	add	r2, r2, #6
	bne	.L31
	add	r1, r1, #1
	cmp	r1, #117
	add	lr, r3, #2
	bne	.L29
	mov	lr, #3840
	mvn	r4, #32768
	sub	r5, ip, #117
.L32:
	add	r2, r5, r1
	sub	r3, lr, #3840
.L34:
	ldrb	r0, [r2, #3120]	@ zero_extendqisi2
	cmp	r0, #0
	ldrne	r0, .L67+16
	addne	r0, r3, r0
	add	r3, r3, #480
	strhne	r4, [r0, #10]	@ movhi
	cmp	r3, lr
	add	r2, r2, #6
	bne	.L34
	add	r1, r1, #1
	cmp	r1, #123
	add	lr, r3, #2
	bne	.L32
	mov	lr, #3840
	mvn	r4, #32768
	sub	r5, ip, #123
.L35:
	add	r2, r5, r1
	sub	r3, lr, #3840
.L37:
	ldrb	r0, [r2, #3936]	@ zero_extendqisi2
	cmp	r0, #0
	ldrne	r0, .L67+20
	addne	r0, r3, r0
	add	r3, r3, #480
	strhne	r4, [r0, #6]	@ movhi
	cmp	r3, lr
	add	r2, r2, #6
	bne	.L37
	add	r1, r1, #1
	cmp	r1, #129
	add	lr, r3, #2
	bne	.L35
	mov	lr, #3840
	mvn	r4, #32768
	sub	ip, ip, #129
.L38:
	add	r2, ip, r1
	sub	r3, lr, #3840
.L40:
	ldrb	r0, [r2, #4032]	@ zero_extendqisi2
	cmp	r0, #0
	addne	r0, r3, #100663296
	addne	r0, r0, #38656
	add	r3, r3, #480
	strhne	r4, [r0, #2]	@ movhi
	cmp	lr, r3
	add	r2, r2, #6
	bne	.L40
	add	r1, r1, #1
	cmp	r1, #135
	add	lr, lr, #2
	bne	.L38
	pop	{r4, r5, r6, lr}
	bx	lr
.L68:
	.align	2
.L67:
	.word	fillScreen
	.word	state
	.word	fontdata_6x8
	.word	100701904
	.word	100701920
	.word	100701936
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	ldr	r2, .L70
	strh	r2, [r3]	@ movhi
	b	goToStart
.L71:
	.align	2
.L70:
	.word	1027
	.size	initialize, .-initialize
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	winState.part.0, %function
winState.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L74
	ldrh	r3, [r3]
	tst	r3, #4
	bxne	lr
	b	goToStart
.L75:
	.align	2
.L74:
	.word	buttons
	.size	winState.part.0, .-winState.part.0
	.set	loseState.part.0,winState.part.0
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L78
	ldr	r0, .L78+4
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L78+8
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L79:
	.align	2
.L78:
	.word	fillScreen
	.word	30304
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	pauseState
	.syntax unified
	.arm
	.fpu softvfp
	.type	pauseState, %function
pauseState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L89
	ldrh	r3, [r3]
	tst	r3, #4
	bxeq	lr
	ldr	r3, .L89+4
	ldrh	r3, [r3]
	tst	r3, #4
	bxne	lr
	push	{r4, lr}
	ldr	r3, .L89+8
	ldr	r0, .L89+12
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L89+16
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L90:
	.align	2
.L89:
	.word	oldButtons
	.word	buttons
	.word	fillScreen
	.word	30304
	.word	state
	.size	pauseState, .-pauseState
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L133
	ldr	r0, .L133+4
	mov	lr, pc
	bx	r3
	mov	r2, #2
	mov	r1, #105
	mov	lr, #3840
	mvn	r4, #32768
	ldr	r3, .L133+8
	ldr	ip, .L133+12
	str	r2, [r3]
	sub	r5, ip, #105
.L92:
	add	r2, r5, r1
	sub	r3, lr, #3840
.L94:
	ldrb	r0, [r2, #3840]	@ zero_extendqisi2
	cmp	r0, #0
	ldrne	r0, .L133+16
	addne	r0, r3, r0
	add	r3, r3, #480
	strhne	r4, [r0, #2]	@ movhi
	cmp	r3, lr
	add	r2, r2, #6
	bne	.L94
	add	r1, r1, #1
	cmp	r1, #111
	add	lr, r3, #2
	bne	.L92
	mov	lr, #3840
	mvn	r4, #32768
	sub	r5, ip, #111
.L95:
	add	r2, r5, r1
	sub	r3, lr, #3840
.L97:
	ldrb	r0, [r2, #3120]	@ zero_extendqisi2
	cmp	r0, #0
	ldrne	r0, .L133+16
	addne	r0, r3, r0
	add	r3, r3, #480
	strhne	r4, [r0, #14]	@ movhi
	cmp	r3, lr
	add	r2, r2, #6
	bne	.L97
	add	r1, r1, #1
	cmp	r1, #117
	add	lr, r3, #2
	bne	.L95
	mov	lr, #3840
	mvn	r4, #32768
	sub	r5, ip, #117
.L98:
	add	r2, r5, r1
	sub	r3, lr, #3840
.L100:
	ldrb	r0, [r2, #4080]	@ zero_extendqisi2
	cmp	r0, #0
	ldrne	r0, .L133+20
	addne	r0, r3, r0
	add	r3, r3, #480
	strhne	r4, [r0, #10]	@ movhi
	cmp	r3, lr
	add	r2, r2, #6
	bne	.L100
	add	r1, r1, #1
	cmp	r1, #123
	add	lr, r3, #2
	bne	.L98
	mov	lr, #3840
	mvn	r4, #32768
	sub	r5, ip, #123
.L101:
	add	r2, r5, r1
	sub	r3, lr, #3840
.L103:
	ldrb	r0, [r2, #3984]	@ zero_extendqisi2
	cmp	r0, #0
	ldrne	r0, .L133+24
	addne	r0, r3, r0
	add	r3, r3, #480
	strhne	r4, [r0, #6]	@ movhi
	cmp	r3, lr
	add	r2, r2, #6
	bne	.L103
	add	r1, r1, #1
	cmp	r1, #129
	add	lr, r3, #2
	bne	.L101
	mov	lr, #3840
	mvn	r4, #32768
	sub	ip, ip, #129
.L104:
	add	r2, ip, r1
	sub	r3, lr, #3840
.L106:
	ldrb	r0, [r2, #3312]	@ zero_extendqisi2
	cmp	r0, #0
	addne	r0, r3, #100663296
	addne	r0, r0, #38656
	add	r3, r3, #480
	strhne	r4, [r0, #2]	@ movhi
	cmp	lr, r3
	add	r2, r2, #6
	bne	.L106
	add	r1, r1, #1
	cmp	r1, #135
	add	lr, lr, #2
	bne	.L104
	pop	{r4, r5, r6, lr}
	bx	lr
.L134:
	.align	2
.L133:
	.word	fillScreen
	.word	31775
	.word	state
	.word	fontdata_6x8
	.word	100701904
	.word	100701920
	.word	100701936
	.size	goToPause, .-goToPause
	.align	2
	.global	winState
	.syntax unified
	.arm
	.fpu softvfp
	.type	winState, %function
winState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L137
	ldrh	r3, [r3]
	tst	r3, #4
	bxeq	lr
	b	winState.part.0
.L138:
	.align	2
.L137:
	.word	oldButtons
	.size	winState, .-winState
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r0, .L165
	ldr	r3, .L165+4
	mov	lr, pc
	bx	r3
	mov	r2, #3
	mov	r0, #110
	mov	ip, #3840
	mvn	lr, #32768
	ldr	r4, .L165+8
	ldr	r3, .L165+12
	add	r5, r4, #4064
	str	r2, [r3]
	add	r5, r5, #2
.L140:
	add	r2, r5, r0
	sub	r3, ip, #3840
.L142:
	ldrb	r1, [r2]	@ zero_extendqisi2
	cmp	r1, #0
	ldrne	r1, .L165+16
	addne	r1, r3, r1
	add	r3, r3, #480
	strhne	lr, [r1, #12]	@ movhi
	cmp	r3, ip
	add	r2, r2, #6
	bne	.L142
	add	r0, r0, #1
	cmp	r0, #116
	add	ip, r3, #2
	bne	.L140
	mov	ip, #3840
	mvn	lr, #32768
	sub	r5, r4, #116
.L143:
	add	r2, r5, r0
	sub	r3, ip, #3840
.L145:
	ldrb	r1, [r2, #3504]	@ zero_extendqisi2
	cmp	r1, #0
	ldrne	r1, .L165+20
	addne	r1, r3, r1
	add	r3, r3, #480
	strhne	lr, [r1, #8]	@ movhi
	cmp	r3, ip
	add	r2, r2, #6
	bne	.L145
	add	r0, r0, #1
	cmp	r0, #122
	add	ip, r3, #2
	bne	.L143
	mov	ip, #3840
	mvn	lr, #32768
	sub	r4, r4, #122
.L146:
	add	r2, r4, r0
	sub	r3, ip, #3840
.L148:
	ldrb	r1, [r2, #3744]	@ zero_extendqisi2
	cmp	r1, #0
	ldrne	r1, .L165+24
	addne	r1, r3, r1
	add	r3, r3, #480
	strhne	lr, [r1, #4]	@ movhi
	cmp	r3, ip
	add	r2, r2, #6
	bne	.L148
	add	r0, r0, #1
	cmp	r0, #128
	add	ip, r3, #2
	bne	.L146
	pop	{r4, r5, r6, lr}
	bx	lr
.L166:
	.align	2
.L165:
	.word	4839
	.word	fillScreen
	.word	fontdata_6x8
	.word	state
	.word	100701904
	.word	100701920
	.word	100701936
	.size	goToWin, .-goToWin
	.align	2
	.global	loseState
	.syntax unified
	.arm
	.fpu softvfp
	.type	loseState, %function
loseState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	winState
	.size	loseState, .-loseState
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L202
	mov	r0, #31
	mov	lr, pc
	bx	r3
	mov	r2, #4
	mov	r1, #107
	mov	lr, #3840
	mvn	r4, #32768
	ldr	r3, .L202+4
	ldr	ip, .L202+8
	str	r2, [r3]
	sub	r5, ip, #107
.L169:
	add	r2, r5, r1
	sub	r3, lr, #3840
.L171:
	ldrb	r0, [r2, #3648]	@ zero_extendqisi2
	cmp	r0, #0
	ldrne	r0, .L202+12
	addne	r0, r3, r0
	add	r3, r3, #480
	strhne	r4, [r0, #6]	@ movhi
	cmp	r3, lr
	add	r2, r2, #6
	bne	.L171
	add	r1, r1, #1
	cmp	r1, #113
	add	lr, r3, #2
	bne	.L169
	mov	lr, #3840
	mvn	r4, #32768
	sub	r5, ip, #113
.L172:
	add	r2, r5, r1
	sub	r3, lr, #3840
.L174:
	ldrb	r0, [r2, #3792]	@ zero_extendqisi2
	cmp	r0, #0
	ldrne	r0, .L202+16
	addne	r0, r3, r0
	add	r3, r3, #480
	strhne	r4, [r0, #2]	@ movhi
	cmp	r3, lr
	add	r2, r2, #6
	bne	.L174
	add	r1, r1, #1
	cmp	r1, #119
	add	lr, r3, #2
	bne	.L172
	mov	lr, #3840
	mvn	r4, #32768
	sub	r5, ip, #119
.L175:
	add	r2, r5, r1
	sub	r3, lr, #3840
.L177:
	ldrb	r0, [r2, #3984]	@ zero_extendqisi2
	cmp	r0, #0
	ldrne	r0, .L202+16
	addne	r0, r3, r0
	add	r3, r3, #480
	strhne	r4, [r0, #14]	@ movhi
	cmp	r3, lr
	add	r2, r2, #6
	bne	.L177
	add	r1, r1, #1
	cmp	r1, #125
	add	lr, r3, #2
	bne	.L175
	mov	lr, #3840
	mvn	r4, #32768
	sub	ip, ip, #125
.L178:
	add	r2, ip, r1
	sub	r3, lr, #3840
.L180:
	ldrb	r0, [r2, #3312]	@ zero_extendqisi2
	cmp	r0, #0
	ldrne	r0, .L202+20
	addne	r0, r3, r0
	add	r3, r3, #480
	strhne	r4, [r0, #10]	@ movhi
	cmp	lr, r3
	add	r2, r2, #6
	bne	.L180
	add	r1, r1, #1
	cmp	r1, #131
	add	lr, lr, #2
	bne	.L178
	pop	{r4, r5, r6, lr}
	bx	lr
.L203:
	.align	2
.L202:
	.word	fillScreen
	.word	state
	.word	fontdata_6x8
	.word	100701904
	.word	100701920
	.word	100701936
	.size	goToLose, .-goToLose
	.align	2
	.global	gameState
	.syntax unified
	.arm
	.fpu softvfp
	.type	gameState, %function
gameState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L215
	mov	lr, pc
	bx	r3
	ldr	r3, .L215+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L215+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L215+12
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L205
	ldr	r3, .L215+16
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L212
.L205:
	ldr	r3, .L215+20
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L213
.L206:
	ldr	r3, .L215+24
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L214
	pop	{r4, lr}
	bx	lr
.L214:
	pop	{r4, lr}
	b	goToLose
.L213:
	bl	goToWin
	b	.L206
.L212:
	bl	goToPause
	b	.L205
.L216:
	.align	2
.L215:
	.word	updateGame
	.word	waitForVBlank
	.word	drawGame
	.word	oldButtons
	.word	buttons
	.word	reachLand
	.word	reachLog
	.size	gameState, .-gameState
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
	ldr	r2, .L231
	ldr	r6, .L231+4
	ldr	r10, .L231+8
	push	{r4, r7, fp, lr}
	strh	r2, [r3]	@ movhi
	ldr	r3, .L231+12
	mov	lr, pc
	bx	r3
	ldr	r5, .L231+16
	ldr	r2, [r6]
	ldrh	r0, [r10]
	ldr	r9, .L231+20
	ldr	r8, .L231+24
	ldr	r7, .L231+28
	ldr	fp, .L231+32
	ldr	r4, .L231+36
.L219:
	strh	r0, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r10]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L227
.L221:
	.word	.L225
	.word	.L224
	.word	.L223
	.word	.L222
	.word	.L220
.L220:
	tst	r0, #4
	beq	.L227
	ldr	r3, .L231+40
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [r10]
	b	.L219
.L222:
	tst	r0, #4
	beq	.L227
	mov	lr, pc
	bx	fp
	ldr	r2, [r6]
	ldrh	r0, [r10]
	b	.L219
.L223:
	mov	lr, pc
	bx	r7
	ldr	r2, [r6]
	ldrh	r0, [r10]
	b	.L219
.L224:
	mov	lr, pc
	bx	r8
	ldr	r2, [r6]
	ldrh	r0, [r10]
	b	.L219
.L225:
	mov	lr, pc
	bx	r9
	ldr	r2, [r6]
	ldrh	r0, [r10]
	b	.L219
.L227:
	mov	r0, r3
	b	.L219
.L232:
	.align	2
.L231:
	.word	1027
	.word	state
	.word	buttons
	.word	goToStart
	.word	oldButtons
	.word	startState
	.word	gameState
	.word	pauseState
	.word	winState.part.0
	.word	67109120
	.word	loseState.part.0
	.size	main, .-main
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
