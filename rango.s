# Muestra los numeros del array que están dentro del rango pasado por teclado.
.data									# Reserva de espacio para datos en memoria.
numeros: .word 1, 4, 14, 5, 9, 6, 8, 12, 13, 15, 26, 8, 2, 0, 4, 7

.text									# Texto obligatorio para iniciar
.globl main						# un programa.
	main:
		addi $v0, $0, 5		# Lee el valor minimo desde teclado.
		syscall
		add $t0, $v0, $0
		
		addi $v0, $0, 5		# Lee el valor maximo desde teclado.
		syscall
		add $t1, $v0, $0

		la $t2, numeros		# Carga la dirección de "numeros" en t2.
		addi $a1, $0, 7


	bucle:
		beq $a0, $a1, finprograma	# Comprueba si llegó al ultimo numero.
		lb $a0, ($t2)
		addi $t2, $t2, 4	# Pasa al siguiente numero.
		slt $t3, $a0 ,$t0	# Comprueba cual es menor.
		beq $t3, $0, mayor # y manda a imprimir.
		j bucle


	mayor:
		slt $t4, $t1, $a0
		beq $t4, $0, imprime
		j bucle


	imprime:
		addi $v0, $0, 1		# Imprime por pantalla.
		syscall
		j bucle


	finprograma:	
		addi $v0, $0, 10	# Fin del programa.
		syscall
