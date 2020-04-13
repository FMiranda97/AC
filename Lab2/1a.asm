
li $t0, 0x10010000
li $s0, 0x00FFFF00

li $t1, 0 
li $t2, 0 

loop:
	sw $s0, 0($t0) 
	addi $t0, $t0, 4 
	addi $t1, $t1, 1 
	blt $t1, 30, loop 
	
li $t1, 0 
addi $t0, $t0, 136 
addi $t2, $t2, 1 
blt $t2, 20, loop 
