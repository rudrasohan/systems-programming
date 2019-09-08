outdec proc
	Push AX
	Push BX
	Push CX
	Push DX

	OR AX, AX ; (Cmp AX, 0)
	JGE END_IF1

	Push AX
	Mov DL, '-'
	Mov AH, 2
	Int 21h
	Pop AX
	NEG AX

	END_IF1:
		XOR CX, CX
		Mov BX, 10d

	REPEAT1:
		XOR DX, DX
		Div BX
		Push DX
		Inc CX

		OR AX, AX ;(Cmp AX, 0)
		JNE REPEAT1

	Mov AH, 2

	PRINT_LOOP:
		POP DX
		OR DL, 48
		Int 21h
		LOOP PRINT_LOOP

	POP DX
	POP CX
	POP BX
	POP AX
	RET

outdec endp
