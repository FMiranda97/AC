	.data
	
	.text
	.globl	conta_char
	
conta_char:

	#Codigo da função aqui!
  li $v0, 0
  do:
  lb $t0, 0($a0)
  bne $t0, $a1, no_count
  addi $v0, $v0, 1
  no_count:
  addi $a0, $a0, 1
  bnez $t0, do
	jr	$ra
