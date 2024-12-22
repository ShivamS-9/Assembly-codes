.global calculate

calculate:
    # %rdi has arr, % rsi has n
    movq $0, %rcx   #rcx is i which is initaillzed to 0
    movq $0, %rdx   #rdx for val
    jmp .L1         # for the loop

.L2:
    xorq (%rdi, %rcx, 8), %rdx      #xor to get the only element
    incq %rcx          # i increment
    jmp .L1             # continuing the loop

.L1:
    cmpq %rsi, %rcx     #compare i and n (loop start)
    jl .L2              # do he xor operation
    movq %rdx, %rax     # move result to rax to return it
    ret
