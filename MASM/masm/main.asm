.code
mainCRTStartup  proc
	mov rax, -1 ; turn whole `rax` register into `F`
	
	mov al, 5   ; observe only register change (byte)
	mov ax, 10  ; observe only register change (word)

	mov eax, 1  ; observe BS (by changing quad-word register)

	ret

mainCRTStartup  endp
end
