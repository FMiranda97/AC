# O cabeçalho da função bin_img em C é
#
# void bin_img(unsigned char *ptr, int w, int h, unsigned char limiar);

	.data
	
	.text
	.globl	bin_img
	
bin_img:
	
	

	# chamar funcao que calcula limiar
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	jal average
	lw $ra, 0($sp)
	addi $sp, $sp, 4

	move $s0, $a0 # pointer to pixel
	mul $s1, $a1, $a2
	add $s1, $s0, $s1 # pointer after final pixel

	move $s2, $v0 # limiar vem do retorno de average

	li $t3, 255 # constante
	while:
		beq $s0, $s1, fim
		lbu $t0, 0($s0) # unsigned
		sgt $t0, $t0, $s2 # s0 fica a 0 se s0 =< limiar ou 1 se > limiar
		mul $t0, $t0, $t3 # 0*255 ou 1*255
		sb $t0, 0($s0) # substituir valor
		addi $s0, $s0, 1 # incrementa ponteiro
		j while
	fim:
	
	jr	$ra

average:
	#same arguments as bin_img since they were not changed on that function
	move $s0, $a0 # pointer to pixel
	mul $s1, $a1, $a2
	add $s1, $s0, $s1 # pointer after final pixel

	li $t1, 0 # sum
	while2:
		beq $s0, $s1, fim2
		lbu $t0, 0($s0) # unsigned
		add $t1, $t1, $t0
		addi $s0, $s0, 1 # incrementa ponteiro
		j while2
	fim2:
	#average = sum divided by number of pixels
	mul $t2, $a1, $a2 # t2 = number of pixels
	div $v0, $t1, $t2
	jr $ra
