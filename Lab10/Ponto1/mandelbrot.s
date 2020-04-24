	.data
	
	.text
	.globl	Mandelbrot

	
Mandelbrot:

	#Codigo da função Mandelbrot aqui!
	#move values from arguments so argument registers are free for a new function call
	move $s0, $a0 # initial value
	move $s1, $a1 # n_iterations

	li $s2, 0 #counter
	move $s3, $s0 # final result initialization

	while:
	beq $s2, $s1, end
		#all steps required to call a function
		move $a0, $s0 # load arguments for function z (initial value and last iteration result)
		move $a1, $s3 
		# save $ra on stack
		addi $sp, $sp, -4 
		sw $ra, 0($sp)
		jal z #call function
		#retrieve $ra
		lw $ra, 0($sp)
		addi $sp, $sp, 4
	move $s3, $v0 #update result with return value
	addi $s2, $s2, 1 #increment iteration counter
	j while
	end:
	move $v0, $s3 #load final result to return register
	jr	$ra

z:
	mul $a1, $a1, $a1
	add $v0, $a1, $a0 # z^2 + z0 moved to return register
	jr $ra
