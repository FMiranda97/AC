		.data

		.text
		.globl	manipula_array
manipula_array:
	# carregar argumentos para registos
	move $s0, $a0
	move $s1, $a1
	
	# duplicar todos elementos do array
	li $t0, 0
	while:
	beq $t0, $a1, end
	lw $t1, 0($s0)
	add $t1, $t1, $t1
	sw $t1, 0($s0)
	addi $s0, $s0, 4
	addi $t0, $t0, 1
	j while
	end:
	#chamar funcao inverte_array
	#argumentos ainda estão nos registos $a0 e $a1
	addi $sp, $sp, -4 #expandir stack
	sw $ra, 0($sp) # guardar $ra
	jal inverte_array
	lw $ra, 0($sp) # recuperar $ra
	addi $sp, $sp, 4 # reduzir stack

	jr	$ra
