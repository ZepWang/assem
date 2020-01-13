; create a procedure that will take plaintext and an encryption key
; AUTHOR: ZEPING WANG  ID: ZZW0057
; LAST MODIFIED DATE: 2019/4/26
.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data 
	input byte	"MEMORY"					; input array
	key byte "BAD"							; key array 
	options byte 1
	
	output byte lengthof input DUP(?)
	

.code


part1 proc
mov esi, 0
mov ebx, 0
mov eax, 0
mov edx, 0
mov ecx, lengthof input
L1:

  mov ax, lengthof input		;calculate remainder of  lengthof input/lengthof key
  mov bl, lengthof key
  div bl						;remainder of them equals to the position of the rest of letters of key array
  movzx edi, ah					;ah has the remainder of them
  mov edx, 0
  mov eax, 0
mov dl, key[edi]
mov al, input[esi]
sub al, 65
sub dl, 65
add dl, al						;dl=(key-65)+(input-65)

mov ax, dx						;ah=((key-65)+(input-65))%26+65
mov bl, 26
div bl
add ah, 65




mov output[esi],ah				;send ah to right position of output
inc esi							

LOOP L1
part1 endp


part2 proc
mov esi, 0
mov ebx, 0
mov eax, 0
mov ecx, lengthof input

L2:

mov dl, key[esi]				;(output-key)%26+65
mov al, input[esi]
sub al, dl
mov edx, 0

mov dx, ax					;
mov bl, 26
div bl
add dh, 65
mov output[esi],dh
inc esi

LOOP L2

part2 endp


main proc

cmp options, 1					;compare option with 1
jz par1							;if equal to 1, go to part 1
jmp par2						;else, jump to part 2

par1:
call part1
jmp EX

par2:
call part2


EX:
invoke ExitProcess, 0

		main endp
	end main

