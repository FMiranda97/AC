li $v0, 5 #syscall leitura de inteiro
syscall

move $t0, $v0 #$t0 contém inteiro lido
mul $t0, $t0, 3 #$t0 contem triplo do inteiro lido


li $a0, 1 #counter de naturais
loop:
	jal print_int
	addi $a0, $a0, 1
	blt $a0, $t0, loop
	
li      $v0, 10  # Exit the program 
syscall

print_int:
	li $v0,1
	syscall 
	jr $ra 
