.global binSearch        

binSearch:
    movq $0,%r9                  # Initialize r9 (low)
    movq %rsi,%r8                # Initialize r8 (high)
    movq $1,%r11                 # Initialize r11 to 1
    movq $0,%r13                 # Initialize flag to 0

.L1:
    movq %r8,%r10               # Store high in r10
    cmpq %r9,%r8                # Compare low and high   

    jl .L5                      # If low > high, jump 
    subq %r9,%r10               # Find high - low
    shrq  $1,%r10               # Find (high - low) / 2 and store in r10
    addq %r9,%r10               # Add low to r10 to find mid index
    movq (%rdi,%r10,8),%r12     # Store mid value of array in r12
    cmpq %r12,%rdx              # Compare r12 with target
    je .L2                      # If equal, jump to .L2
    jl .L3                      # If r12 < target, jump to .L3
    jg .L4                      # If r12 > target, jump to .L4

.L3:
    inc %r11                    # Increment count
    dec %r10                    # Decrement mid index
    movq %r10,%r8               # Update high index
    jmp .L1                     # Jump to .L1

.L2:
    movq %r10,(%rcx)            # Store mid index in result
    movq %r11,8(%rcx)           # Store count in result
    movq $1,%r13                # Set flag to 1
    jmp .L3                     # Jump to .L3

.L4: 
    inc %r11                    # Increment count
    inc %r10                    # Increment mid index
    movq %r10,%r9               # Update low index
    jmp .L1                     # Jump to .L1

.L5:
    cmpq $1,%r13                # Check if flag is set
    je .L6                      # If set, jump to .L6
    movq $-1,(%rcx)             # Set result to -1 
    movq %r11,8(%rcx)           # Store count in result
    ret                         # Return

.L6:
    ret                         # Return
