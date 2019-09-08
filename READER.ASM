.model small
.stack 100h
.code
	CR EQU 0dh
	Mov AH, 1
	Mov BH, 1
	L1:
		Int 21h
		Cmp AL, CR
		JE E1
		Cmp AL, 65
		JL E2
		Cmp AL, 90
		JG E2
		Cmp BH, 0
		JE E3
		Mov CL, AL
		Mov BH, 0
		Jmp E2
		E3:
			Mov CH, AL 
		E2:
			Jmp L1
	E1:
	Mov AH, 2
	Mov DL, CL
	Int 21h
	Mov DL, CH
	Int 21h
	Mov AH, 4ch
	Int 21h
end