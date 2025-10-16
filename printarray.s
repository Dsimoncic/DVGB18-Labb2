	.data
		
newline:	.asciiz "\n"
arr:		.asciiz "%d"

	.text
	.globl printarray
	
printarray:
	
	subu $sp, $sp, 16
	sw $ra, 12($sp)
	sw $s0, 8($sp)
	sw $s1, 4($sp)
	sw $s2, 0($sp)
	
	
	move $s0, $a0	#vek
	move $s1, $a1	#antal
	li $s2, 0	# int i = 0
	
	
	subu $sp, $sp, 16
	la $a0, newline
	jal print
	nop
	addu $sp, $sp, 16
	
loop:	
	beq $s1, $s2, backmain	# i < antal
	sll $s3, $s2, 2		# vek[i]
	addi $s2, $s2, 1	# i++
	
	addu $t0, $s3, $s0	# få rätt adress till vek[i]
	lw $t1, 0($t0)		# hämta värdet från vek[i]
	
	subu $sp, $sp, 16
	la $a0, arr
	move $a1, $t1
	jal print
	nop
	addu $sp, $sp, 16
	
	subu $sp, $sp, 16
	la $a0, newline
	jal print
	nop
	addu $sp, $sp, 16
	
	j loop
	
	
	
	
backmain:
	lw $s2, 0($sp)
	lw $s1, 4($sp)
	lw $s0, 8($sp)
	lw $ra, 12($sp)
	addu $sp, $sp, 16
	
	jr $ra
















