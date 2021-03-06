
; Syscall : write (ID: 1)
; ===========================
; Arugment Type   |  Proper Register   | Argument Description
; -----------------------------------------------------------
; Syscall ID      |         rax        |  1 (the syscall ID no.)
; File descriptor |         rdi        |  0, 1, or 2 (standard input, output, and error streams respectively)
; Buffer          |         rsi        |  Location of string to write
; Count           |         rdx        |  Length of string

section .data
    text db "Hello, world!",0    ; Define a single-byte char pointer to 'H' (the first character in the char array)
                                 ; ',0' null-terminates the string
                                 ; 'text' length: 13 (don't count the ',0' on the end
                                 
section .bss
; Empty! No unknown variables.

section .text
        global main
        
main:
        ; write (ID: 1)
        mov     rax, 1          ; Move the ID of sys_write (1) into rax
        mov     rdi, 1          ; Write to stream 1 (stdout, the screen)
        mov     rsi, text       ; Use the 'text' pointer as the source of the text
        mov     rdx, 13         ; The amount of characters to read
        syscall                 ; Make the syscall (print 'Hello, world!')


        ; exit (ID: 60)
        mov     rax, 60         ; Move the ID of sys_exit (60) into rax
        mov     rdi, 0          ; The status code of EXIT_SUCCESS (0)
        syscall                 ; Make the syscall (exit with status code 0)

