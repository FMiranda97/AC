.data
values: .byte 0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F, 0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71 #representacoes hexadecimais dos numeros de 0 a F de acordo com o exercicio 1b

.text

li $s0, 0xFFFF0010 #endereço do display direito
la $s1, values #guarda endereço de values
li $t1, 0 #serve de contador

loop:
	lb $t0, 0($s1) #obtem valor para escrever valor t1 no display
	sb $t0, 0($s0) #guarda byte no endereco s0
	addi $s1, $s1,1 #incrementa endereço
	addi $t1, $t1,1 #incrementa contador
	blt $t1,16,loop
