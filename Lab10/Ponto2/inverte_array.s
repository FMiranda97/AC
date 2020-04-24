		.data

		.text
		.globl	inverte_array
inverte_array:

	move $s0, $a0
	move $s1, $a1
	
	#calcular ponteiro ultimo elemento do array
	addi $s1, $s1, -1
	sll $s1, $s1, 2 # multiplicar tamanho do array - 1 por 4
	add $s1, $s0, $s1 #endereço ultimo elemento do array

	# inverter elementos do array
	while:
	bge $s0, $s1, end # para quando ponteiros para elemento da esquerda e da direita se cruzam
	lw $t0, 0($s0) # ler posicoes a trocar
	lw $t1, 0($s1)
	sw $t1, 0($s0) # escrever nas posicoes trocadas
	sw $t0, 0($s1)
	addi $s0, $s0, 4  # avancar ponteiro da esquerda
	addi $s1, $s1, -4 # recuar ponteiro da direita
	j while
	end:

	jr	$ra
