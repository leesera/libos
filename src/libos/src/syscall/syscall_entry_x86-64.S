#define __ASSEMBLY__
#include "task.h"

    .file "syscall_entry_x86-64.S"
    .global __occlum_syscall
    .type __occlum_syscall, @function
__occlum_syscall:
    push %rbp
    movq %rsp, %rbp

    movq %gs:(TD_TASK_OFFSET), %rax
    movq TASK_SYSCALL_STACK_OFFSET(%rax), %rsp
    call dispatch_syscall

    movq %rbp, %rsp
    popq %rbp
    ret