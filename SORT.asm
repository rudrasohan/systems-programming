.model small
.stack 100h
.data
	nums dw 48, 50, 49, 51, 52, '$'
.code
	Lim EQU 10
	Mov AX, @data
	Mov DS, AX
	Mov CX, 0
Loop1:
	LEA SI, nums
	Mov BX, Lim
	Sub BX, CX
	Sub BX, 2
Loop2:
	Cmp SI, BX
	JGE E
	Mov DH, [SI+2]
	Cmp [SI], DH
	JLE Skip
	Mov DL, [SI+2]
	XCHG DL, [SI]
	Mov [SI+2], DL
Skip:
	Inc SI
	Inc SI
	Jmp Loop2
E:
	Add CX, 2
	Cmp	CX, 10
	JLE Loop1

	Mov AH, 9
	LEA DX, nums
	Int 21h

	Mov AH, 76
	Int 21h
end