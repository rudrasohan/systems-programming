.model small
.stack 1000h
.data
     NUM DW 12bch
     RES DB 10 DUP('$')
.code
main proc      
    MOV AX, @data
    MOV DS,AX
   
    MOV AX,NUM
      
    LEA SI,RES
    CALL HEX2DEC
   
    LEA DX,RES
    MOV AH,9
    INT 21H 
            
    MOV AH,4CH
    INT 21H        
main endp

HEX2DEC proc
    MOV CX,0
    MOV BX,10
   
LOOP1: MOV DX,0
       DIV BX
       ADD DL,30H
       PUSH DX
       INC CX
       CMP AX,9
       JG LOOP1
     
       ADD AL,30H
       MOV [SI],AL
     
LOOP2: POP AX
       INC SI
       MOV [SI],AL
       LOOP LOOP2
       RET
HEX2DEC endp           
   
END main