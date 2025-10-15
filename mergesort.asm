
	.text
	.globl mergesort
	
mergesort:
	
	subu $sp, $sp, 16
    	sw    $ra, 12($sp)
    	sw    $s0, 8($sp)
   	sw    $s1, 4($sp)
   	sw    $s2, 0($sp)
	
	
	move $s0, $a0	# vek a
	move $s1, $a1	# antal size
	
	ble $s1, 1, backmain 
	
	
	srl $s2, $s1, 1 	#half
	
	move $a1,$s2
	move $a0, $s0
	jal mergesort
	
	sll $t1, $s2, 2 
	addu $a0, $s0, $t1	# a + half
	subu $a1, $s1, $s2	# size - half
	jal mergesort
	
	
	move $a0, $s0	# vek a
	move $a1, $s1	# antal size
	jal merge
	
		
backmain:
	
	
	lw $s2,  0($sp)
	lw $s1,  4($sp)
	lw $s0,  8($sp)
	lw $ra, 12($sp)
	addu $sp, $sp, 16
	
	jr $ra
