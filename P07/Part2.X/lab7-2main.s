
.global main # define main as a global label
.set noreorder # don't let the assembler reorder instructions
main: addi $a0,$0,10 # n = 5 (find 5th fib number)
 jal fibr # call fibr(4)
addi $0, $0, 0 # branch delay slot
 # expand to test at least fibr(10), fibr(1), fibr(2)
done: j done # infinite loop
 add $0, $0, $0 # branch delay slot
# fib(n) function


fibr:
    
    addi $sp, $sp, -12
    sw $ra, 0($sp)
    sw $a0, 4($sp)
    sw $s0, 8($sp)
    addi $t1, $0, 2
    
    
    slt $t0, $a0, $t1
    beq $t0, $0, L1
    add $0, $0, $0
    addi $v0, $a0, 0
    lw $ra, 0($sp)
    lw $a0, 4($sp)
    lw $s0, 8($sp)
    addi $sp, $sp, 12
    jr $ra
    add $0, $0, $0
    
 L1: 
    sub $a0, $a0, 1
    jal fibr
    add $0, $0, $0
    add $s0, $v0, $0
    sub $a0, $a0, 1
    jal fibr
    add $0, $0, $0
    add $v0, $v0, $s0
    
    lw $ra, 0($sp)
    lw $a0, 4($sp)
    lw $s0, 8($sp)
    addi $sp, $sp, 12
    jr $ra
    add $0, $0, $0
    


