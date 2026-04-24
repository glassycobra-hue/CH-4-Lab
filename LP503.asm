INCLUDE Irvine32.inc

.data
prompt BYTE "Enter a value for length: ",0
num DWORD ?

.code
main PROC
    call GetInput
    mov num, eax        ; pass via memory
    call Repeated
    exit
main ENDP

GetInput PROC
    mov edx, OFFSET prompt
    call WriteString
    call ReadInt
    ret
GetInput ENDP

Repeated PROC
    mov ecx, num        ; outer loop
    mov ebx, 1          ; current number

L1:
    push ecx
    mov ecx, num        ; inner loop

L2:
    mov eax, ebx
    call WriteDec
    loop L2

    call Crlf
    inc ebx
    pop ecx
    loop L1
    ret
Repeated ENDP

END main