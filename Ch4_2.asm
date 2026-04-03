.386
.model flat, stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD

.data
fibArray DWORD 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; 15 integers

.code
main PROC
mov ecx, 2; start from index 2 (third element)

calc_loop:
cmp ecx, 15
jge done; stop when we reach 15 elements

mov eax, fibArray[ecx * 4 - 4]; Fib(n - 1)
add eax, fibArray[ecx * 4 - 8]; +Fib(n - 2)
mov fibArray[ecx * 4], eax; store result in array

inc ecx
jmp calc_loop

done :
pause_loop:
jmp pause_loop; pause program for memory inspection

push 0
call ExitProcess
main ENDP
END main