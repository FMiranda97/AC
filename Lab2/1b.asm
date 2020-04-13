li $t0, 0x10010000 
li $s0, 0x00FFFF00 

li $t1, 0 
li $t2, 0 

loop:
	li $s0, 0 
	sll $t3, $t2, 18 
	add $s0, $s0, $t3 
	sll $t3, $t1, 10 
	add $s0, $s0, $t3 
	
	sw $s0, 0($t0) 
	addi $t0, $t0, 4 
	addi $t1, $t1, 1 
	blt $t1, 64, loop 

li $t1, 0 

addi $t2, $t2, 1 
blt $t2, 32, loop 