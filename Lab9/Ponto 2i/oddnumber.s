	.data
	
	.text
	.globl	oddnumber

	
oddnumber:

	#Codigo da função oddnumber aqui!
	li $v0, 0 #conta impares / resultado
	li $t0, 0 #contador iteracoes
	while:
	beq $t0, $a1, out #termina quando iteracoes igual a dimensao array
	lw $t1, 0($a0) #carrega para t1 elemento do array
	andi $t1, $t1, 1 #aplica mascara isolando o bit mais à direita
	# se numero for impar t1 = 1, se for para t1 = 0
	add $v0, $v0, $t1 #adiciona valor ao resultado, ver comentario acima
	addi $t0, $t0, 1 #incrementa contador iteracoes
	addi $a0, $a0, 4 #passa para o elemento seguinte, reparar que é array de int
	j while
	out:
	
	jr	$ra

