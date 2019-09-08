.model small
.stack 100h
.code
	main proc
	Mov AH, 2
	Mov DL, '?'
	Int 21h
	XOR CX, CX
	Mov AH, 1
	L1:
		Int 21h
		Cmp AL, 0dh
		JE E1
		Push AX
		Inc CX
		Jmp L1
	E1:
		Mov AH, 2
		Mov DL, 0dh
		Int 21h
		Mov DL, 0ah
		Int 21h
		JCXZ E2 ;CX is used to count characters

	TOP:

		POP DX
		Int 21h
		Loop TOP

	E2:
		Mov AH, 76
		Int 21h

	main endp
end main

