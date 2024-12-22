.global max_subarray_sum
.text

#arr   = %rdi
#n     = %rsi
#l     = %rdx
#r     = %rcx
#deque = %r8

pop_back:
    decq %r10
    jmp .loop2

pop_front:
    incq %r9
    jmp .check2

push_back:
    movq %r11, (%r8, %r10, 8)
    incq %r10
    jmp .check3


max_subarray_sum:
    movq $0, %r9
    .prefix_sum:                    # use prefix_sum from indexing 1 to n+1
        cmpq %rsi, %r9              #i<n
        je .copy
        movq (%rdi, %r9, 8), %r10   # arr[i]
        movq (%r8, %r9, 8), %r11    # prefix_sum[i]
        addq %r11, %r10
        incq %r9
        movq %r10, (%r8, %r9, 8)    # prefix_sum[i+1]
        jmp .prefix_sum
    .copy:                          # copy prefix_sum array from %r8 to %rdi
        movq $0, %r9                
        movq $0, (%rdi, %r9)
        .loop:
            incq %r9
            cmpq %rsi, %r9
            jg .continue
            movq (%r8, %r9, 8), %r11
            movq %r11, (%rdi, %r9, 8)
            jmp .loop
.continue:
    movq $-9223372036854775808, %rax # set ans as int_min
    xorq %r9, %r9                    # front of deque
    xorq %r10, %r10                  # rear of deque
    movq %rdx, %r11                  # index j = L for main loop
    movq %rsi, %r12 
    addq %rcx, %r12
    subq %rdx, %r12                  # compute N+R-L
    decq %r11
    .main:
        incq %r11
        cmpq %r12, %r11              # j<= N+R-L
        jg .done                     # break loop if j > N+R-L
        .check1:                     # if deque is not empty && dq.front() < j - R + L, pop_front
            cmpq %r9, %r10
            je .check2
            movq %rdx, %r13
            addq %r11, %r13
            subq %rcx, %r13
            cmpq (%r8, %r9, 8), %r13
            jle .check2
            jmp pop_front
        .check2:                     # if j<=N
            cmpq %rsi, %r11
            jg .check3
            .loop2:                  # while deque is not empty && prefix_sum[j] >= prefix_sum[dq.back()]
                cmpq %r9, %r10
                je .do
                decq %r10
                movq (%r8, %r10, 8), %r14  #dq.back()
                incq %r10
                movq (%rdi, %r14, 8), %r15 #prefix_sum[dq.back()]
                cmpq (%rdi, %r11, 8), %r15
                jg .do               # break out of .loop if prefix_sum[j] < prefix_sum[dq.back()]
                jmp pop_back         # pop_back if all conditions met
            .do:
                jmp push_back        # push_back(j) in deque
        .check3:                     # if deque is not empty && j>=R
            cmpq %r9, %r10
            je .main
            cmpq %r11, %rcx
            jg .main
            movq (%r8, %r9, 8), %r13    # dq.front
            movq (%rdi, %r13, 8), %r14  # prefix_sum[dq.front]
            movq %r11, %r15
            subq %rcx, %r15
            movq (%rdi, %r15, 8), %r13  # prefix_sum[j-r]
            subq %r13, %r14             # prefix_sum[j-r] - prefix_sum[dq.front]
            cmpq %rax, %r14             # update ans if ans < prefix_sum[j-r] - prefix_sum[dq.front]
            jl .main
            movq %r14, %rax
            jmp .main
    .done:
        ret
