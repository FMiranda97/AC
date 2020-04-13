.data

A: .word 0x3
B: .word 0x4
resultado: .word

.text
la $t0, A #load A into argument
lw $a0, 0($t0)
la $t0, B #load B into argument
lw $a1, 0($t0)

jal soma #call function

la $t0, resultado #store return value into variable
sw $v0, 0($t0)

la $t0, resultado #load resultado into argument and print it
lw $a0, 0($t0)
li $v0, 1
syscall

li $v0, 10 #exit
syscall

soma:
add $v0, $a0, $a1
jr $ra
