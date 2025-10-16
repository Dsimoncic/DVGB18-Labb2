
	.text
	.globl merge
merge:
	
	
	move $t0, $a0 		# A Array t0
	move $t1, $a1 		# Size t1
	
	sll $t6, $t1, 2       # bytes = size * 4
	li $t7, 8		# kolla delbarhet med 8
	divu $t6, $t7
	mfhi $t8
	beq $t8, $zero, norest
	subu $t9, $t7, $t8
	addu $t6, $t6, $t8
	
norest:
    	subu $sp, $sp, $t6     # allokera b[size] på stacken
    	move $t5, $sp          # t5 = b-bas  b[i] t5
	
	srl $t2, $t1, 1		# Half t2
	
	
	li $t3, 0		#int i t3
	li $t4, 0		#int k t4
	addu $t9, $t2, $zero	#int j t9
	
for:	
	bge $t3, $t1, beforewhile
	
	sll $t6, $t3, 2
	addu $t7, $t6, $t0
	lw $t8, 0($t7)
	
	addu $t7, $t5, $t6
	sw $t8, 0($t7)
	
	addu $t3, $t3, 1
	
	j for
	
beforewhile:

	li $t3, 0		# i = 0
	
while:	
	
	
	ble $t2, $t3, while2
	
	ble $t1, $t9, while2
	
	sll  $t6, $t3, 2
    	addu $t7, $t5, $t6
    	lw   $t7, 0($t7) 	#b[i]
	
	
	
	sll $t6, $t9, 2
	addu $t6, $t5, $t6	# offset för j
	lw   $t8, 0($t6)   	# b[j]
	
	sll $t6, $t4, 2
	addu $t6, $t6,$t0 	# a[k]
	
	#if
	bgt $t7, $t8, else
	
	
	sw $t7,0($t6)
	
	addi $t3,$t3,1		#i++
	
	addi $t4,$t4,1		#k++
	j while
	
	
else:

	sw $t8,0($t6)
	
	
	addi $t9,$t9,1		#j++
	
	addi $t4,$t4,1		#k++
	j while
	
	
	
	
while2:
	bge $t3, $t2, while3
	
	
	
	sll  $t6, $t4, 2               # t6 = k*4
    	addu $t6, $t0, $t6             # &a[k]
    	sll  $t7, $t3, 2               # t7 = i*4
    	addu $t7, $t5, $t7             # &b[i]
    	lw   $t7, 0($t7)               # t7 = b[i]	
	sw $t7,0($t6)
	
	addi $t3,$t3,1		#i++
	addi $t4,$t4,1		#k++
	
	j while2

while3:
	bge $t9, $t1, end
	
	
	sll  $t6, $t4, 2               # t6 = k*4
    	addu $t6, $t0, $t6             # &a[k]
    	sll  $t7, $t9, 2               # t7 = i*4
    	addu $t7, $t5, $t7             # &b[i]
    	lw   $t8, 0($t7)               # t8 = b[i]
	
	
	
	sw $t8,0($t6)
	
	addi $t9,$t9,1		#j++
	addi $t4,$t4,1		#k++
	
	j while3
	
end:
	sll  $t6, $t1, 2
  	
  	
  	li $t7, 8
	divu $t6, $t7
	mfhi $t8
	beq $t8, $zero, norest2
	subu $t9, $t7, $t8
	addu $t6, $t6, $t8
	

norest2:
	addu $sp, $sp, $t6
  	jr   $ra
	



	
