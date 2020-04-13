	.data
	
	.text
	.globl	max
	.globl	min
	
max:

	#Codigo da função max aqui!
  move $v0, $a0
  ble $a1, $v0, max1
  move $v0, $a1
  max1:
  ble $a2, $v0, max2
  move $v0, $a2
  max2:
  ble $a3, $v0, max3
  move $v0, $a3
  max3:
	jr	$ra

min:

	#Codigo da função min aqui!
  move $v0, $a0
  bge $a1, $v0, min1
  move $v0, $a1
  min1:
  bge $a2, $v0, min2
  move $v0, $a2
  min2:
  bge $a3, $v0, min3
  move $v0, $a3
  min3:
	jr	$ra
