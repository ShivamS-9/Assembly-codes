.global rotate

rotate:
    # %rdi has array, %rsi has n
    movq $0, %rax           #rax initialized to 0
    # movq (%rdi), %rax         #for returning
    movq $0, %rcx           #%rcx is i, i initialized to 0
    decq %rsi               # we need n-1 and not n so this
    jmp .L1                 # while loop jump

.L2:
    movq (%rdi, %rcx, 8), %rdx      #rdx is temp, temp = arr[i]
    incq %rcx                       # i++ to get next element
    movq (%rdi, %rcx, 8), %r10      # arr[i] = arr[i+1]emp storage for swapping
    movq %rdx, (%rdi, %rcx, 8)      #arr[i+1] = temp
    decq %rcx                       # i-- to get prev element
    movq %r10, (%rdi, %rcx, 8)      # swap back
    incq %rcx                       #for next element swap i++
    jmp .L1                         #back to loop

.L1:
    cmpq %rsi, %rcx                 # i < n-1 check
    jl .L2                          # swap 
    movq (%rdi), %rax               # final result in rax
    ret                             #return

