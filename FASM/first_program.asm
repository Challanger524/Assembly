format PE64 NX GUI 6.0
entry start

section '.text' code readable executable ; indicates the beginning of a new section in a Portable Executable file
start:
        int3 ; debug breakpoint
        ret