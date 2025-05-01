.globl f # this allows other files to find the function f

# f takes in two arguments:
# a0 is the value we want to evaluate f at
# a1 is the address of the "output" array (read the lab spec for more information).
# The return value should be stored in a0
f:
    # Your code here
    # t1 save index 
    addi t1 a0 3
    slli t1 t1 2

    # t2 save address of array 
    add t2 t1 a1
    
    # t3 save result
    lw t3 0(t2)
    
    mv a0 t3
    
    # This is how you return from a function. You'll learn more about this later.
    # This should be the last line in your program.
    jr ra
