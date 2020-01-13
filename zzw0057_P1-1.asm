.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data

input BYTE 01h,02h,03h,04h,05h,06h,07h,08h
shift BYTE 02h
.code
main PROC
	MOV EAX, 0
	MOV EBX, 0
	MOV ECX, 0
	MOV EDX, 0
	MOV AH, input
	ADD AH, shift
	MOV AL, input+1
	ADD AL, shift
	MOV BH, input+2
	ADD BH, shift
	MOV BL, input+3
	ADD BL, shift	
	MOV CH, input+4
	ADD CH, shift
	MOV CL, input+5
	ADD CL, shift
	MOV DH, input+6
	ADD DH, shift
	MOV DL, input+7
	ADD DL, shift
	INVOKE ExitProcess,0

main ENDP
END main