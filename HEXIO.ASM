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
        Mov CL, 4                                       
        Mov AH, 1

        WHILE_:
            Int 21h
            Cmp AL, 0dh
            JE END_WHILE
            Cmp AL, 65
            JGE LETTER
            And AL, 0fh
            Jmp SHIFT

        LETTER:
            Sub AL, 55

        SHIFT:
            SHL BX, CL
            OR BL, AL
            Jmp WHILE_

        END_WHILE:

        Lea DX, msg2
        Mov AH, 9
        Int 21h
        Mov CH, 4
        Mov AH, 2

        FOR_:
            Sub CH, 1
            Mov DL, BH
            SHR DL, CL
            Cmp DL, 9
            JLE DIGIT
            Add DL, 55
            Jmp SHIFT_P
        DIGIT:
            Add DL, 48
        SHIFT_P:
            Int 21h
            ROL BX, CL
            Cmp CH, 0
            JNE FOR_

        Mov AH, 76
        Int 21h

    main endp 
end main

