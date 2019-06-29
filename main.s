/* register base */
.equ	gpioa,	0x48000000
.equ	rcc,	0x40021000

/* rcc offsets */
.equ	ahbenr_offset,	0x14

/* gpio offsets */
.equ	moder_offset, 	0x00
.equ	ospeed_offset, 	0x08
.equ	pupdr_offset, 	0x0c
.equ	odr_offset, 	0x14

.thumb
.section    isr_vector
.word       0
.word       _start + 1
.text
.global 	_start

setup:
		/* turn on rcc gpioa */
		ldr		r1, =rcc
		mov		r0, #0x0014
		movt	r0, #0x0002
		str		r0, [r1, #ahbenr_offset]
		
		/* set r1 to gpioa mem address */
		ldr		r1, =gpioa
		
		/* set gpioa 9 to output */
		mov		r0, #0x0000
		movt	r0, #0xa804
		str		r0, [r1, #moder_offset]
		
		/* set pull-down resistor on gpioa9 */
		movt	r0, #0x0002
		str		r0, [r1, #pupdr_offset]
		
		/* set speed to very high speed */
		movt	r0,	#0x000c
		mov		r0,	#0x0000
		str		r0, [r1, #ospeed_offset]
		
		/* prepare two registers for switching gpioa9 */
		mov		r3, #0x0000
		movt	r3, #0x0000
		movt	r4, #0x0000
		movw	r4, #0x0200
	
main:
		/* set gpioa 9 output to high */
		str		r4, [r1, #odr_offset]
		str		r3, [r1, #odr_offset]
		bl		main
	
_start:
	bl setup
	bl main

stop:
    b stop
	