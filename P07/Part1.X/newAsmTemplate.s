
.global main # define main as a global label
.set noreorder # don't let the assembler reorder instructions
main: addi $a0,$0,4 # n = 4 (find 8th fib number)
 jal fib # call fib(8)
addi $0, $0, 0 # branch delay slot
  # expand to test at least fib(10), fib(1), fib(2)
done: j done # infinite loop
 add $0, $0, $0 # branch delay slot

# fib(n)
fib: 

    add $t0, $a0, $0
    addi $t1, $0, 1 # t1 is first
    addi $t2, $0, 0 # t2 is next
  
    
    
    addi $t3, $0, 0 # t3 is i for loop
    
 for: slt $t4, $t3, $t0
    beq $t4, $0, L1
    add $0, $0, $0
    add $t5, $t1, $t2  # new no = first + next
    add $t1, $t2, $0
    add $t2, $t5, $0
    addi $t3, $t3, 1
    j for
    add $0, $0, $0
    
 L1: add $v0, $t5, $0

    jr $ra
    
    


