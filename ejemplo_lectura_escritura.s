.data									# Reserva de espacio para datos en memoria.
	string: .space 100	# Variables.

.text									# Texto obligatorio para iniciar
.globl main						# un programa.
	main:
		la $a0, string		# Direcci�n en memoria donde empieza "string".
		addi $a1, $0, 100	# Tama�o total de "string".
		addi $v0, $0, 8		# Syscall lee el c�digo 8 de $v0 "leer de teclado"
		syscall 					# y almacena lo le�do a partir de $a0 hasta $a1.

		addi $t0, $0, 2		# Para el siguiente salto condicional.

	salida:
		addi $v0, $0, 4		# Syscall con c�digo 4 imprime por pantalla
		syscall 					# el texto almacenado a partir de $a0.
		addi $t0, $t0, -1
		bne $t0, $0, salida # Salto condicional, imprime 2 veces por pantalla.

		addi $v0, $0, 10	# Syscall con c�digo 10 finaliza el programa.
		syscall