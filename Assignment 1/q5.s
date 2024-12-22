.global product

product:
    # %rdi has arr, %rsi has n
    movq $0, %rcx   # rcx is i
    movq $0, %rdx   # rdx is count
    movq $1, %r9   # r9 is result
    
.L4:    
    cmpq %rsi, %rcx     #while condition check
    jl .L1

.L5:
    # all 0 condition
    movq $0, %rcx       # i again made 0
    cmpq $1, %rdx       # if(count > 1)
    jg .L6
    jmp .L7     #else
    

.L6:
    cmpq %rsi, %rcx     #while condition check for all 0
    jg .L8
    movq $0, (%rdi, %rcx, 8)        #arr[i] made 0
    incq %rcx
    jmp .L6

.L7:
    cmpq %rsi, %rcx     #while condition inside else part
    jge .L8          #to end loop and return from the if condition 
    cmpq $0, (%rdi, %rcx, 8)
    je .L9
    cmpq $1, %rdx       #count == 1
    je .L10
    jmp .L11


.L9:
    movq %r9 , (%rdi, %rcx, 8)      #arr[i] == result
    incq %rcx
    jmp .L7

.L10:
    movq $0, (%rdi, %rcx, 8)        #arr[i] == 0
    incq %rcx
    jmp .L7


.L11:
    movq %r9, %rax                  #result into rax to do div
    movq (%rdi, %rcx, 8), %r8       # r8 only for holding
    divq %r8, %rax
    movq %rax, (%rdi, %rcx, 8)
    incq %rcx
    jmp .L7


.L1:
    movq (%rdi, %rcx, 8), %r10      # arr[i] in r10
    cmpq $0, %r10   
    je .L2
    imulq %r10, %r9
    jmp .L3


.L2:
    incq %rdx       # count ++
    jmp .L3


.L3:
    incq %rcx       # i++
    jmp .L4


.L8:
    #return
    movq (%rdi), %rax 
    ret
