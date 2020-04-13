		.data

		.text
		.globl	programa
programa:

	# Codigo da função aqui
  lw $t1, 0($a0)
  lw $t2, 4($a0)
  lw $t3, 8($a0)
  lw $t4, 12($a0)
  lw $t5, 16($a0)
  add $s0, $t1, $t2
  mul $s2, $t4, $t5
  mul $s2, $s2, 3
  sub $s1, $t3, $s2
  mul $s0, $s0, $s1
  mul $v0, $s0, 5
	jr	$ra
