.data

num: .word 0x10203040

.text
la $t0, num #load num into argument
lw $a0, 0($t0)
jal switch #call function

move $a0, $v0 #print hexa
li $v0, 34
syscall

li $v0, 10 #exit
syscall

switch:
li $t0, 0

andi $t1, $a0, 0xFF000000
srl $t1, $t1, 24
or $t0, $t1, $t0

andi $t1, $a0, 0x00FF0000
srl $t1, $t1, 8
or $t0, $t1, $t0

andi $t1, $a0, 0x0000FF00
sll $t1, $t1, 8
or $t0, $t1, $t0

andi $t1, $a0, 0x000000FF
sll $t1, $t1, 24
or $t0, $t1, $t0

move $v0, $t0
jr $ra
