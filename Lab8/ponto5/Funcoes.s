	.data
	
	.text
	.globl	max
	.globl	min
	
max:

	#Codigo da função max aqui!
  lw $v0, 0($a0)
  li $t0, 1
  while_max:
  bge $t0, $a1, max_end
  lw $t1, 0($a0)
  ble $t1, $v0, nosub_max
  move $v0, $t1
  nosub_max:
  addi $t0, $t0, 1
  addi $a0, $a0, 4
  j while_max
  max_end:
	jr	$ra

min:

	#Codigo da função min aqui!
  lw $v0, 0($a0)
  li $t0, 1
  while_min:
  bge $t0, $a1, min_end
  lw $t1, 0($a0)
  bge $t1, $v0, nosub_min
  move $v0, $t1
  nosub_min:
  addi $t0, $t0, 1
  addi $a0, $a0, 4
  j while_min
  min_end:
	jr	$ra
