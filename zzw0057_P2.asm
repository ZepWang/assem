; place INPUT value in OUTPUT array with the location shifted by a certain amount
; AUTHOR: ZEPING WANG  ID: ZZW0057
; LAST MODIFIED DATE: 2019/3/28
.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data

input BYTE 01h,02h,03h,04h,05h,06H,07H
output BYTE LENGTHOF input DUP(?)
shift DWORD 4
.code
main PROC

	;lOOP l: MOVE "SHIFTED" VALUES TO AL, THEN PUSH AX ONE BY ONE
	MOV EAX, 0
	MOV EBX, 0
	MOV ECX, shift ;VALUE OF shift = how many times this loop should exicute = ECX
	MOV EBX, LENGTHOF input

	L:
	MOV EAX, 0 
	MOV EDX, 0
	MOV EDX, EBX
	SUB EDX, ECX ;EDX+1 AFTER EACH TIME THIS LOOP EXCICUTED
	MOV AL, input[EDX] ;input[EDX]=first shifted value, push it first. then EDX+1 NEXT TIME
	PUSH AX
	LOOP L



	;LOOP O: MOVE OTHER VALUES TO AL, THEN PUSH AX ONE BY ONE
	MOV EDX, 0
	SUB EBX, shift ;((LENGTHOF INPUT) - SHIFT)= HOW MANY TIMES THIS LOOP SHOULD GO = EBX
	MOV ECX, EBX ; MOVE EBX TO ECX
	
	O:
	MOV EAX, 0  
	MOV EDX, EBX ;EDX=0 IN FIRST TIME.
	SUB EDX, ECX ;EDX+1 AFTER EACH TIME THIS LOOP EXICUTED, EDX=0,1,2,3,4,5......
	MOV AL, input[EDX]
	


;LOOP P: POP VALUES TO DX, THEN SEND DX TO EACH POSITION IN OUTPUT
	PUSH AX ; MOVE VALUE TO AL, THEN PUSH AX
	LOOP O
	MOV ECX, LENGTHOF input
	
	P:
	MOV EAX, 0
	MOV EDX, 0
	mov EAX, ECX
	DEC EAX
	
 	POP DX
	MOV output[EAX], DL
	LOOP P
	

	;TEST LOOP: MOVE THE VALUES FROM OUTPUT TO AL ONE BY ONE
	MOV EAX, 0
	MOV CL, LENGTHOF output
	MOV ESI, offset output

	test1:
	MOV AL, [ESI] 
	ADD ESI, type output
	loop test1

	
	INVOKE ExitProcess,0

main ENDP
END main