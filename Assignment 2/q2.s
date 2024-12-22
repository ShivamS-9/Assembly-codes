.global nCr

nCr: 
    # rdi has n, rsi has r
    cmpq $0, %rsi           # Compare %rsi with 0
    jl .L1                  # Jump if less than 0
    cmpq %rdi, %rsi         # Compare %rsi with %rdi
    jg .L1                  # Jump if greater than %rdi

    movq %rdi, %rax         # r8 has n now
    subq %rsi, %rax
    cmpq %rax, %rsi         # r > n-r
    jg .L2
    jmp .L3

.L1:
    movq $1, %rax           #set ret value to 1
    ret

.L2:
    movq %rax ,%rsi         # r = n-r
    jmp .L3

.L3:
    movq $1, %r8            #result = 1, r8 = result 
    movq $0, %r9            #i = 0 for loop
    jmp .L5

.L4:
    movq %rdi,%rax 
    subq %r9, %rax
    mulq %r8        # here we have rax holing result produnt thing
    movq %rax, %r8      #result holds result now
    incq %r9        # i++
    divq %r9
    movq %rax, %r8      #final result in r8
    jmp .L5


.L5:
    cmpq %rsi, %r9          # i < r
    jl .L4
    movq %r8, %rax
    ret
