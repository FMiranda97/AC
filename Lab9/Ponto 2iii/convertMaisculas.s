	.data
	
	.text
	.globl	convertMaisculas

	
convertMaisculas:
	#A = 0x41 = 0b 0100 0001
	#a = 0x61 = 0b 0110 0001	
	#passar para maisculas implica por 3º bit a 0 mantendo os restantes no seu estado atual
	#0b 0110 0001
	#&
	#0b 1101 1111
	#=
	#0b 0100 0001

	#0b 1101 1111 = 0xDF
	#Codigo da função convertMaisculas aqui!
	while:
	lb $t0, 0($a0) #carrega caracter para t0
	beqz $t0, out #corre até encontrar '\0'

	blt $t0, 0x61, not_minuscula
	bgt $t0, 0x7A, not_minuscula
	andi $t0, $t0, 0xDF #converte em maiuscula
	sb $t0, 0($a0) #guarda no array na posicao anterior
	
	not_minuscula:		
	addi $a0, $a0, 1 #array aponta para posicao seguinte, char ocupa 1 byte
	j while
	out:
	
	jr	$ra

