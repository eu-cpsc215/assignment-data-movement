extrn ExitProcess : proc        ; Declare external function ExitProcess

.DATA                           ; Directive: enter .data section

; Data here

.CODE                           ; Directive: enter .code section

_main PROC                      ; Directive: Begin function labeled `_main`

    sub rsp, 28h                ; Bump 8 bytes to ensure 16 byte alignment. Reserve 32 bytes shadow space.
    ; ----------------------------------------

    ; Code here

    ; ----------------------------------------
    xor rcx, rcx                ; Clear RCX
    call ExitProcess            ; Use Windows API to exit the process

_main ENDP                      ; Directive: End function labeled `_main`

END                             ; Directive: End of module
