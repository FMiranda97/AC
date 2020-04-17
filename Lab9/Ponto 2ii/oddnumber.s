	.data
	
	.text
	.globl	oddnumber

	
oddnumber:

	#Codigo da função oddnumber aqui!
	li $v0, 0 #conta impares / resultado
	li $t0, 0 #contador iteracoes
	while:
	beq $t0, $a3, out #termina quando iteracoes igual a dimensao array
	lw $t1, 0($a0) #carrega para t1 elemento do array
	andi $t2, $t1, 1 #aplica mascara isolando o bit mais à direita
	# se numero for impar t2 = 1, se for par t2 = 0
	add $v0, $v0, $t2 #adiciona valor ao resultado, ver comentario acima
	
	beqz $t2, par
	sw $t1, 0($a1) #escreve na posicao atual do array tabodd
	addi $a1, $a1, 4 #incrementa posicao do array tabodd
	j endif
	par:
	sw $t1, 0($a2) #escreve na posicao atual do array tabeven
	addi $a2, $a2, 4 #incrementa posicao do array tabeven
	endif:
	

	addi $t0, $t0, 1 #incrementa contador iteracoes
	addi $a0, $a0, 4 #passa para o elemento seguinte, reparar que é array de int
	j while
	out:
	
	jr	$ra

