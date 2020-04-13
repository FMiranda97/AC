.data 
str:  .asciiz "Uma frase!" 
comp:  .word 0

.text
la $a0, str #load string pointer into argument

jal len #call function

la $t0, comp #store return value into variable
sw $v0, 0($t0)

la $t0, comp #load resultado into argument and print it
lw $a0, 0($t0)
li $v0, 1
syscall

li $v0, 10 #exit
syscall

len:
	li $t0, -1 #counter
	while:
		lb $t1, 0($a0)
		addi $a0, $a0, 1
		addi $t0, $t0, 1
		bnez $t1, while
	move $v0, $t0 
jr $ra
