.data
values: .byte 0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F, 0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71 #representacoes hexadecimais dos numeros de 0 a F de acordo com o exercicio 1b

.text

li $s0, 0xFFFF0010 #endereço do display direito
la $s1, values #guarda endereço de values
restart:
li $t2, 0 #serve de contador
move $s2, $s1 #s2 vai ser endereço de valor a escrever no lado esquerdo
loope:
	li $t1, 0 #serve de contador
	lb $t0, 0($s2) #obtem valor para escrever valor t1 no display
	sb $t0, 1($s0) #escreve no display
	loopi:
		lb $t0, 0($s1) #obtem valor para escrever valor t1 no display
		sb $t0, 0($s0) #escreve no display
		addi $s1, $s1,1 #endereco++
		addi $t1, $t1,1 #cnti++
		blt $t1,10,loopi #trocar para 10 para valores decimais, 8 para valores octais 
	la $s1, values
	addi $s2,$s2,1
	addi $t2,$t2,1
	blt $t2,10,loope #trocar para 10 para valores decimais, 8 para valores octais 
j restart