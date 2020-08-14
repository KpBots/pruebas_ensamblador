.data
	pregunta:	.asciiz "Introduce la temperatura en ºC"
	respuesta:	.asciiz "La temperatura en Fahrenheit es "

.text
.globl main
	main:
		la $a0, pregunta
		li $v0, 4
		syscall

		li $v0, 5
		syscall

		addi $t1, $t1, 9
		mult $v0, $t1
		mflo $t1
		addi $t0, $t0, 5
		div $t1, $t0
		mflo $t1
		addi $t0, $t1, 32

		la $a0, respuesta
		li $v0, 4
		syscall

		add $a0, $t0, $0
		li $v0, 1
		syscall

		li $v0, 10
		syscall