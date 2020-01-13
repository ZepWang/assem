; CHECK IF TWO ARRAY ARE ANAGRAM
; AUTHOR: ZEPING WANG  ID: ZZW0057
; LAST MODIFIED DATE: 2019/4/13
.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
s1 byte "CODE"
s2 byte "DOGS"
c1 byte 26 dup(0) ;counter for each alphabetic letter in s1
c2 byte 26 dup(0) ;counter for each alphabetic  letter in s2.code

.code
	main proc
		mov eax, 1							;we will assume that we do have an anagram
		mov ebx, 0							;(1) iterate lengthof s1 times
		mov edx, 0
		mov esi, 0							;start at the first byte of s1 and s2
		mov ecx, lengthof s1				;(1) iterate lengthof s1 times
											;this will increment the proper 'elements' of c1 and c2

		CounterLoop1:

		movzx edi, s1[esi]					;move the value from s1 into edi
		sub edi, 65							;(2) increment the counter at the value - 65. 
		inc c1[edi]							;subtract 65 because the ASCII value of A is 65, B is 66, C is 67...
		inc esi								;when you subtract 65 then the sum of all the As will be stored in 'index' 0
		loop CounterLoop1
											;Bs in 'index' 1, Cs in 'index' 2...
											
											
										
		
		

		mov esi, 0
		mov ecx, lengthof s2				;(3)Do the same procedure for s2
		CounterLoop2:
		movzx edi, s2[esi]
		sub edi, 65							;(4) increment the counter at the value - 65
		inc c2[edi]
		inc esi								;increment esi
		loop CounterLoop2




											;after this loop terminates our couter arrays will have the proper values
											;(5)start checking the counter arrays at 'index'
		mov esi, 0									;(6) iterate lengthof c1 times
		mov ecx, 26
		VerifyLoop:       
			mov bl, c1[esi]							;(7) move value of c1 into bl
			mov dl, c2[esi]
			cmp bl, dl								;(8)check bl vs the value of c2

			 
			
		
			jnz L1
			
											;(9) if they are not equal then we do not have an anagram.  jump to NoAna
			inc esi							;increment esi

			LOOP VerifyLoop

			jmp L2

			L1:
			mov eax, 0

			

			L2:


							;if the loop terminates and we have not jumped then we know we have an anagram

			
			invoke ExitProcess, 0

		main endp
	end main