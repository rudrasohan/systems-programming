.model small
.stack 100h
.data
    msg1 DB 'Enter a binary string < 16-bit: $'
    msg2 DB 0Dh, 0Ah, 'The given String is : $'
.code
    main proc
        Mov AX, @DATA
        Mov DS, AX
        Lea DX, msg1
        Mov AH, 9
        Int 21h

        XOR BX, BX                                       
        Mov AH, 1

        W1:
            Int 21h
            CMP AL, 0DH
            JE E1
            AND AL, 0FH
            SHL BX, 1
            OR BL, AL
            JMP W1

        E1:
            Lea DX, msg2
            Mov AH, 9
            Int 21h
            Mov AH, 2
            Mov CX, 16
            W2:
                SHL BX, 1
                JNC Z
                Mov DL, 49
                JMP D

                Z:
                    Mov DL, 48
                D:
                    Int 21h
                    Sub CX, 1
                CMP CX, 0
                JG W2
            Mov AH, 76
            Int 21h
    main endp
end main


