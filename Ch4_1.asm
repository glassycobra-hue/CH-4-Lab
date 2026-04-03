.386
.model flat, stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD

.data
len WORD 10        ; rectangle length
wid WORD 20        ; rectangle width
area WORD 0        ; area of rectangle
perim WORD 0       ; perimeter of rectangle

.code
main PROC
    ; ----------------------------
    ; Calculate area using only ADD
    ; ----------------------------
    mov ax, 0          ; accumulator for area
    mov cx, wid        ; counter = width

calc_area_loop:
    add ax, len        ; add length repeatedly
    loop calc_area_loop

    mov area, ax       ; store area

    ; ----------------------------
    ; Calculate perimeter
    ; ----------------------------
    mov ax, len
    add ax, wid
    add ax, ax         ; multiply by 2
    mov perim, ax

pause_loop:
    jmp pause_loop     ; pause program for memory inspection

    push 0
    call ExitProcess
main ENDP
END main