INCLUDE Irvine32.inc

.data
prompt BYTE "Enter a value for length: ",0

.code
main PROC
    call GetInput
    push eax            ; pass via stack
    call Ascending
    exit
main ENDP

GetInput PROC
    mov edx, OFFSET prompt
    call WriteString
    call ReadInt
    ret
GetInput ENDP

; parameter passed on stack
Ascending PROC
    pop ebx             ; get return addr
    pop ecx             ; get n
    push ebx

    mov eax, 1          ; row = 1

L1:
    push eax
    mov edx, 1          ; counter

L2:
    mov eax, edx
    call WriteDec
    inc edx
    cmp edx, [esp]
    jle L2

    call Crlf
    pop eax
    inc eax
    cmp eax, ecx
    jle L1
    ret
Ascending ENDP

END main