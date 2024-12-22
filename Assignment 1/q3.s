.global pali_check

pali_check:
    # %rdi has string, %rsi has n
    movq  $0 ,%rdx                  # rdx = i, which is counter from index 0
    movq %rsi , %rcx                # rcx = j + 1
    subq $1, %rcx                   # rcx = j, which is counter from n-1 index
    jmp .L1                         # jump to loop part

.L1:
    shrq $1, %rsi                   # right shift to divide by 2
    cmpq %rsi, %rdx                 # if i > n/2 then exit
    jg .L3
    cmpq %rsi, %rcx                 # if j < n/2 then exit
    jl .L3    
    movb (%rdi, %rdx), %al          # str[i] in al     

    movb (%rdi, %rcx), %bl #str[j]  # str[j] in bl
    
    cmpb %al, %bl                   # compare the 2 string elements
    jne .L2                         # if not equal exit 
    incq %rdx                       # i++
    decq %rcx                       # j--
    jmp .L1                         # back to loop

.L2:
    movq $0, %rax                   # ret 0 for not palindrome
    ret

.L3:
    movq $1, %rax                   # ret 1 for palindrome
    ret 

