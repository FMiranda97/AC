
li $s0, 0xFFFF0010 #endere�o do display direito

li $t0, 1 #valor inicial 00000001
loop:
	sb $t0, 0($s0) #guardar byte no endere�o de forma a afetar o display (reparar que usa-se store byte e n�o store word)
	sll $t0, $t0, 1 #mover bit a 1 uma casa para a esquerda (ex: 00000001 -> 00000010)
blt $t0, 256, loop #quando excede a dimens�o do byte termina