.data 
str:  .asciiz "socorro" 
c1:  .ascii "o"
c2:  .ascii "u"

.text
la $a0, str #load string pointer into argument

la $t0, c1 #load value to argument
lb $a1, 0($t0)

la $t0, c2 #load value to argument
lb $a2, 0($t0)

jal troca #call function

la $a0, str #load string pointer into argument and print it
li $v0, 4
syscall

li $v0, 10 #exit
syscall

troca:
	while:
		lb $t1, 0($a0)
		bne $t1, $a1, skip
		sb $a2, 0($a0)
		skip:
		addi $a0,$a0, 1
		bnez $t1, while
	move $v0, $t0 
jr $ra
