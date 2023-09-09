format PE64 NX console 6.0
include 'win64ax.inc'

section '.text' code executable
start:
        cinvoke printf,  "Hello World!%c", 10

        cinvoke printf, <10, "Press any key to exit..."> ; https://board.flatassembler.net/topic.php?p=99362
        call [getch] ;invoke getch ; (same); https://board.flatassembler.net/topic.php?t=20575

        call [ExitProcess]

section '.idata' data readable import
        library kernel32, 'kernel32.dll', \
                msvcrt,   'msvcrt.dll'
        import kernel32, ExitProcess, 'ExitProcess'
        import msvcrt, printf, 'printf'  , \
                       scanf,  'scanf'   , \
                       getch,  '_getch'