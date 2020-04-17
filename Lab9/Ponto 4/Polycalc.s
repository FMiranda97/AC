		.data
		.text
		.globl	Polycalc

Polycalc:
	#Codigo da função oddnumber aqui!
	#divir por 2^i é o mesmo que fazer shift right i
	li $v0, 0 #resultado
	li $t0, 0 #variável i

	while:
	lw $t1, 0($a0) #lê valor do array
	srl $t1, $t1, $t0 #t1 = t1 >> i
	add $v0, $v0, $t1

	addi $t0, $t0, 1
	addi $a0, $a0, 4 #ponteiro de array avança para proximo elemento
	blt $t0, 6, while
	
	jr	$ra

