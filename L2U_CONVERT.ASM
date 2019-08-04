.model small
.stack 100h
.data
CR EQU 0DH
LF EQU 0AH
msg1 DB 'Enter Lowercase letter:$'
msg2 DB CR, LF, 'In uppercase it is:'
char DB ?, '$'
.code
main proc
Mov AX, @data
Mov DS, AX
Mov AH, 9
Lea DX, msg1
Int 21h
Mov AH, 1
Int 21h
Sub AL, 20h
Mov CHAR, AL
Lea DX, msg2
Mov AH, 9
Int 21h
Mov AH, 76
Int 21h
main endp
end main
