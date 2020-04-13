li $v0, 5 #syscall leitura de inteiro
syscall

move $t0, $v0 #$t0 contém inteiro lido
li $t1, 1 #initial factorial
loop:
	mul $t1, $t1, $t0 #multiply number by counter
	subi $t0, $t0, 1 #decrement counter
	bgt $t0, 0, loop #while counter greater than 0, repeat
	
move $a0, $t1 #put result on argument to print
jal print_int
li      $v0, 10  # Exit the program 
syscall


print_int:
	li $v0,1
	syscall 
	jr $ra 