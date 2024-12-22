.global findSum

findSum:
    # %rdi has array, %rsi has n
    movq (%rdi), %r9        # r9 = min
    movq (%rdi), %r10       # r10 = max
    movq $1, %rcx           # rcx = i
    jmp .L1                 # jump to loop


.L2:
    movq (%rdi, %rcx, 8), %rdx      # temp storage

.L3:    
    cmpq %r10, %rdx         # temp and max compare
    jle  .L4                # if temp < max then this step
    movq %rdx, %r10         # update temp

.L4:
    cmpq %r9, %rdx          # temp and min compare
    jge .L5                 # if temp > min then this
    movq %rdx, %r9          # update temp    

.L5:
    incq %rcx               #i++
    jmp .L1   

.L1:    
    cmpq %rsi, %rcx         # while loop
    jl .L2
    movq $0, %rax       
    addq %r9, %rax          # final sum in rax
    addq %r10, %rax         # final sum in rax    
    ret

