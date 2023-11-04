extrn ExitProcess : proc        ; Declare external function ExitProcess

.DATA                           ; Directive; Enter .data section

; Data here

.CODE                           ; Directive: Enter .code section

main PROC                       ; Directive: Begin function labeled `main`

    sub rsp, 28h                ; Bump 8 bytes to ensure 16 byte alignment. Reserve 32 bytes shadow space.
    ; -------------------- /\ PROLOGUE /\ --------------------

    ; Code here

    ; -------------------- \/ EPILOGUE \/ --------------------
    xor rcx, rcx                ; Clear RCX
    call ExitProcess            ; Use Windows API to exit the process

main ENDP                       ; Directive: End function labeled `main`

END
