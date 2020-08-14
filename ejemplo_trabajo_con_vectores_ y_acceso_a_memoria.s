.data													# Reserva de espacio para datos en memoria.
	numeros: .word 8, 7, 3, 29	# Vector de 4 enteros.

.text													# Texto obligatorio para iniciar
.globl main										# un programa.
	main:
		la $a0, numeros						# Carga la dirección de inicio en $a0.
		lw $t0, 0($a0)						# Carga los elementos del vector en
		lw $t1, 4($a0)						# registros temporales.
		lw $t2, 8($a0)
		lw $t3, 12($a0)

		addi $t0, $0, 3						# Modificación de los valores almacenados
		addi $t1, $t1, -8					# en los registros temporales con sumas
		addi $t2, $t2, 12					# inmediatas (permiten especificar un número).
		addi $t3, $0, 0

		sw $t0, 0($a0)						# Escribe los valores de los registros
		sw $t1, 4($a0)						# temporales en memoria (a partir de $a0).
		sw $t2, 8($a0)
		sw $t3, 12($a0)

		addi $v0, $0, 10					# Fin del programa.
		syscall
