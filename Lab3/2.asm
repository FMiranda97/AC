.data
values: .byte 0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F, 0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71 #representacoes hexadecimais dos numeros de 0 a F de acordo com o exercicio 1b

.text

li $s0, 0xFFFF0010 #endereço do display direito
li $s1, 0xFFFF0012 #endereço do selector de linhas
li $s2, 0xFFFF0014 #endereço do identificador de tecla

start:
li $t0, 1 #t0 escolhe a linha a testar
loop:
	la $s3, values #get initial address of values
	sb $t0, 0($s1) #choose line
	sll $t0, $t0, 1 #get ready to select next line
	lb $t1, 0($s2) #t1 will have pressed key value
	andi $t1, $t1, 0xFF #make sure remaining bits on the register are at 0
	jal write2 #go write found key
	bgt $t0, 16, start #if chosen line is bigger than line 4, restart
	j loop




write:
	beqz $t1, nothing #if $t1 is 0 no key was pressed, so end function
	lb $t2, 0($s3) #load code to write 1 on the display
	addi $s3, $s3, 1 #skip to next element on array
	beq $t1, 0x11, fim #if pressed key was 1, go to end of function
	lb $t2, 0($s3) #previous 3 lines are repeated for every key
	addi $s3, $s3, 1
	beq $t1, 0x21, fim
	lb $t2, 0($s3)
	addi $s3, $s3, 1
	beq $t1, 0x41, fim
	lb $t2, 0($s3)
	addi $s3, $s3, 1
	beq $t1, 0x81, fim
	
	lb $t2, 0($s3)
	addi $s3, $s3, 1
	beq $t1, 0x12, fim
	lb $t2, 0($s3)
	addi $s3, $s3, 1
	beq $t1, 0x22, fim
	lb $t2, 0($s3)
	addi $s3, $s3, 1
	beq $t1, 0x42, fim
	lb $t2, 0($s3)
	addi $s3, $s3, 1
	beq $t1, 0x82, fim
	
	lb $t2, 0($s3)
	addi $s3, $s3, 1
	beq $t1, 0x14, fim
	lb $t2, 0($s3)
	addi $s3, $s3, 1
	beq $t1, 0x24, fim
	lb $t2, 0($s3)
	addi $s3, $s3, 1
	beq $t1, 0x44, fim
	lb $t2, 0($s3)
	addi $s3, $s3, 1
	beq $t1, 0x84, fim
	
	lb $t2, 0($s3)
	addi $s3, $s3, 1
	beq $t1, 0x18, fim
	lb $t2, 0($s3)
	addi $s3, $s3, 1
	beq $t1, 0x28, fim
	lb $t2, 0($s3)
	addi $s3, $s3, 1
	beq $t1, 0x48, fim
	lb $t2, 0($s3)
	addi $s3, $s3, 1
	beq $t1, 0x88, fim
	fim:
	sb $t2, 0($s0)  #write on display
	nothing:
jr $ra



write2:
	beqz $t1, nothing2 #if $t1 is 0 no key was pressed, so end function
	srl $t3, $t1, 4 #get leftmost 4 bits
	andi $t4, $t1, 0x0F #get rightmost 4 bits
	li $t5, -5 #initial value of array element, loops will always do first iteration, therefore must decrement the result of first operation
	loop_right:
		addi $t5, $t5, 4
		srl $t4, $t4, 1
		bnez $t4, loop_right
	loop_left:
		addi $t5, $t5, 1
		srl $t3, $t3, 1
		bnez $t3, loop_left
	
	add $s3, $s3, $t5
	lb $t2, 0($s3)
	sb $t2, 0($s0)  #write on display
	nothing2:
jr $ra
