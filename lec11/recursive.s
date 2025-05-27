#### Recursive factorial
.globl factorial

.text
main:
    li a0 3
    jal ra, factorial

    addi a1, a0, 0
    addi a0, x0, 1
    ecall # Print Result

    addi a1, x0, '\n'
    addi a0, x0, 11
    ecall # Print newline
    
    li a0 3
    jal ra, factorial

    addi a1, a0, 0
    addi a0, x0, 1
    ecall # Print Result

    addi a1, x0, '\n'
    addi a0, x0, 11
    ecall # Print newline

    addi a0, x0, 10
    ecall # Exit

# factorial takes one argument:
# a0 contains the number which we want to compute the factorial of
# The return value should be stored in a0
factorial:
    # Prologue
    addi sp sp -8
    sw ra 0(sp)
    sw s0 4(sp)
    
    # Body
    mv s0 a0
    li t0 1
    
    bne s0 t0 recurse
    
    # Base Case
    li a0 1
    j epilogue
    
recurse:
    addi a0 s0 -1
    jal ra factorial
    mul a0 s0 a0

epilogue:
    lw ra 0(sp)
    lw s0 4(sp)
    addi sp sp 8
    jr ra