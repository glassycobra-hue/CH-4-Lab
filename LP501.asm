INCLUDE Irvine32.inc

.data
prompt BYTE "Enter a value for length: ",0

.code
main PROC
    call GetInput
    mov ebx, eax        ; pass n in EBX
    call Descending
    exit
main ENDP

GetInput PROC
    mov edx, OFFSET prompt
    call WriteString
    call ReadInt
    ret
GetInput ENDP

; EBX = n
Descending PROC
    mov ecx, ebx        ; outer loop

L1:
    push ecx
    mov eax, 1          ; inner counter

L2:
    call WriteDec
    inc eax
    cmp eax, ecx
    jle L2

    call Crlf
    pop ecx
    loop L1
    ret
Descending ENDP

END main