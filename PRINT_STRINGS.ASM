.model small
.stack 100h
.data
msg DB 'HELLO!$'
.code
main proc
Mov AX, @data
Mov DS, AX
Mov AH, 9
Lea DX, MSG
Int 21h
Mov AH, 76
Int 21h
main endp
end main                                      
