.model small
.stack 100h
.code

multiply proc
	; conventional mult code
	Push AX
	Push BX
	XOR DX, DX

	REPEAT_:
		TEST BX, 1 ; AND without bit setting
		JZ END_IF
		Add DX, AX

	END_IF:
		SHL AX, 1
		SHR BX, 1

		JNZ REPEAT_
		POP BX
		POP AX
		RET
	multiply endp

main proc
	Call multiply
	Mov AH, 76
	Int 21h
	main endp 
end main