li $t0, 0x10010000 

li $t1, 0 
li $t2, 0 


li $v0, 5
syscall
move $s2, $v0 #s2 é coordenada x

li $v0, 5
syscall
move $s1, $v0 #s1 é coordenada y

blt $s1, 0, fim
blt $s2, 0, fim
bge $s1, 24, fim
bge $s2, 56, fim

loop:
	jal decide_color 
	sw $s0, 0($t0) 
	addi $t0, $t0, 4 
	addi $t1, $t1, 1 
	blt $t1, 64, loop 
li $t1, 0 

addi $t2, $t2, 1 
blt $t2, 32, loop 
j fim

decide_color:
	addi $t5, $s1, 0
	blt $t2, $t5, blue
	 
	addi $t5, $s1, 8
	bgt $t2, $t5, blue
	
	addi $t5, $s2, 0
	blt $t1, $t5, blue
	
	addi $t5, $s2, 8 
	bgt $t1, $t5, blue 
	j magenta
	blue:
		li $s0, 0x000000FF 
		jr $ra
	magenta:
		li $s0, 0x00FF00FF
		jr $ra

fim: