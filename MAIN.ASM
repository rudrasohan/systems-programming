.model small
.stack 100h
.code

main proc
	Mov AX, 32655
	Call outdec
	Mov AH, 4CH
	Int 21h
main endp
Include OUTDEC.ASM
end main