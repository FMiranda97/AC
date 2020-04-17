		.data
		.text
		.globl	codificastring

codificastring:
	#Codigo da função codificastring aqui!
	while:
	lb $t0, 0($a0)
	beqz $t0, out #corre até '\0'
	xor $t0, $t0, $a1
	sb $t0, 0($a0)
	
	addi $a0, $a0, 1
	j while
	out:
	
	
	jr	$ra

