.data

valor: .word 0x03
resultado: .word

.text
la $t0, valor #load valor into argument
lw $a0, 0($t0)

jal paridade #call function

la $t0, resultado #store return value into variable
sw $v0, 0($t0)

la $t0, resultado #load resultado into argument and print it
lw $a0, 0($t0)
li $v0, 1
syscall

li $v0, 10 #exit
syscall

paridade:
	li $t0, 0 #contador
	while:
		andi $t1, $a0, 1
		add $t0, $t0, $t1
		srl $a0, $a0, 1
	bnez $a0, while
	andi $v0, $t0, 1
jr $ra
