format PE64 NX console 6.0
include 'win64ax.inc'

; Of these, ?%rax?, ?%rcx?, ?%rdx?, ?%rdi?, ?%rsi?, ?%rsp?, and ?%r8-r11? are
; considered caller-save registers, meaning that they are not necessarily saved across function
; calls. By convention, ?%rax? is used to store a function’s return value, if it exists and is no more
; than 64 bits long. (Larger return types like structs are returned using the stack.) Registers ?%rbx?,
; %rbp?, and ?%r12-r15? are callee-save registers, meaning that they are saved across function calls.

section '.text' code executable
start:
        ;int3
        mov [var], 0
        mov r12, 0

cycle:
        cinvoke printf,  "Loop: %lld%c", [var], 10
        cinvoke printf,  <"Loop: %d", 10>, r12
        call [getch]

        inc [var]
        inc r12

        jmp cycle

        ;cinvoke printf, <10, "Press any key to exit..."> ; https://board.flatassembler.net/topic.php?p=99362
        ;call [getch] ;invoke getch ; (same); https://board.flatassembler.net/topic.php?t=20575

        ;call [ExitProcess]

section '.bss' data readable writeable
        var dq ?

section '.idata' data readable import
        library kernel32, 'kernel32.dll', \
                msvcrt,   'msvcrt.dll'
        import kernel32, ExitProcess, 'ExitProcess'
        import msvcrt, printf, 'printf'  , \
                       scanf,  'scanf'   , \
                       getch,  '_getch'