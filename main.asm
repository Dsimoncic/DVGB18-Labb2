	.data
antal: 	.word 10
vek:	.word 4,5,2,2,1,6,7,9,5,10
 
	.text
	.globl main
main:
	
	subu $sp,$sp,16
	la $a0, vek
	lw $a1, antal
	jal printarray
	nop
	addu $sp,$sp,16
	
	subu $sp,$sp,16
	la $a0, vek
	lw $a1, antal
	jal mergesort
	nop
	addu $sp,$sp,16
	
	
	subu $sp,$sp,16
	la $a0, vek
	lw $a1, antal
	jal printarray
	nop
	addu $sp,$sp,16
	li $v0, 10
	syscall
	
	
	
