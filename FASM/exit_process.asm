format PE64 NX GUI 6.0
entry start

section '.text' code readable executable ; indicates the beginning of a new section in a Portable Executable file
start:
        int3 ; debug breakpoint
        sub rsp, 40; = 8 * 5  ; adjust stack ptr and allocate shadow space.
        xor rcx, rcx    ; The first and only argument is the return code - passed in rcx.
        call [ExitProcess]  ; call through [label]


section '.idata' import readable writeable
idt: ; import directory table starts here
     ; entry for KERNEL32.DLL
     dd rva kernel32_iat   ; 4 Import Lookup Table RVA (Characteristics)
     dd 0                  ; 4 Time/Date Stamp
     dd 0                  ; 4 Forwarder Chain
     dd rva kernel32_name  ; 4 Name RVA
     dd rva kernel32_iat   ; 4 Import Address Table RVA (Thunk Table)
     ; NULL entry - end of IDT
     dd 5 dup(0) ; 5 x 4(bytes) iniziallized with 0
name_table: ; hint/name table
        _ExitProcess_Name dw 0
                          db "ExitProcess", 0, 0

kernel32_name db "KERNEL32.DLL", 0
kernel32_iat: ; import address table for KERNEL32.DLL
        ExitProcess dq rva _ExitProcess_Name
        dq 0 ; end of KERNEL32's IAT