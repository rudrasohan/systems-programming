.model small
.stack 100h
.data
	Arr db 5 DUP(4 DUP(?))
.code
arrinput proc
	PUSH BX
	PUSH CX
	PUSH SI

	Mov AH, 1
	Mov BX, 0
Loop1:
	Mov CX, 4
	Mov SI, 0
Loop2:
	Int 21h
	Mov Arr[BX][SI], AL
	Add SI, 1
	Loop Loop2
	Add BX, 4
	Cmp BX, 16
	JLE Loop1

	POP SI
	POP CX
	POP BX
	RET

arrinput endp

main proc	
	Mov AX, @data
	Mov DS, AX
	Call arrinput
	Mov AH, 2
	Mov DL, Arr[2][1]
	Int 21h
	Mov AH, 76
	Int 21h
main endp

end main