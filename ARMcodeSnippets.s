    ; AREA prog, CODE, READONLY
     ;ENTRY
     ;MOV  r0, #0xC
     ;MOV  r1, #0x1
     ;MOV  r2, #0x8
     ;MOV  r3, #0x20
     ;LDRB r4,[r3],-r2, ASR #2
     ;ADD  r1, r3,  r2, LSL r0
;Loop ;B    Loop   
 ;    DCB  0x11, 0x22, 0x33, 0x44, 0x55
  ;   DCB  0x66, 0x77, 0x88, 0x99, 0xAA
   ;  DCB  0xBB, 0xCC, 0xDD, 0xEE, 0xFF
    ; END
	
;	  AREA prog, CODE, READONLY
 ;     ENTRY
	;  ADD R2, #1
     ; LDR R0, =X
	 ; LSL R2, 1
;X     ;DCD 15	  
   ;
    ;  END
	
;     AREA prog, CODE, READWRITE
;     ENTRY
;     MOV r0,#51
;     MOV r1,#34
;GCD  CMP r0,r1
;     SUBLT r1,r1,r0
;     SUBGT r0,r0,r1
;     BNE GCD
;Loop B Loop
;     END

	;AREA prog, CODE, READWRITE
	;ENTRY
	;LDRBPL r4, [r5], r6, LSL #7
	;END
	
	  ;AREA prog, CODE, READWRITE
      ;ENTRY
      ;ADR  R0,C+1
      ;MOV  R1,#1
      ;LDRB R2,[R0,#5]
      ;LDRB R3,[R0],-R1,LSL#2
      ;LDRB R4,[R0,#2]!
;Loop  B Loop

;A     DCB 0x77
;B     DCD 0xAABBCCDD
;C     SPACE 1
;D     DCB 0x88
;E     SPACE 1
;F     DCD 0x11223344
;      END

;        AREA prog, CODE, READWRITE
;        ENTRY
;        LDR SP, =STACK
;        MOV r0, #0x11
;        MOV r1, #0x22
;PUSH_R0 STR R0,[SP,#-4]!
;PUSH_R1 STR R1,[SP,#-4]!
;POP_R0  LDR R0,[SP],#4
;POP_R1  LDR R1,[SP],#4
;Loop B Loop
;      space 32
;STACK DCD 0x0
;      space 32
;      END

	;AREA prog, CODE, READWRITE
	 ;    ENTRY
;the1     EQU  0x74 ; the1 is the first letter of the, 't'
;the2     EQU  0x68 ; the2 is the second letter of the, 'h'
;the3     EQU  0x65 ; the3 is the third letter of the, 'e'
;spc      EQU  0x20 ; spc equals the ascii value of a space
;ES       EQU  0x00 ; ES equals the ascii value of null/end of a string
	 
;		 LDR r2, =spc ; r2 currently holds space and is currently acting as the character before the first character in STRING1
;		 LDR r8, =EoS ; r8 will hold the adderess for the end of STRING1
;		 ADR r0, STRING1 ; r0 holds the adderess for the first character in STRING1, it will also be reffered to as where the current character is
;		 ADR r1, STRING2 ; r1 holds the adderess for STRING2
;
;START    CMP r2,#spc ; see if the character behind the character at r0 is equal to a space
;		 LDRB r2,[r0] ; make r2 equal the current character at r0
;		 BNE START3 ; if previous character is not a space then go to START3
;		 CMP r2,#the1 ; check if current character is 't'
;		 BNE START3 ; if current character is not 't' then go to START3
;		 LDRB r3,[r0, #1] ; get character after current character
;		 CMP r3,#the2 ; check if character after current character is 'h'
;		 BNE START3 ; if that character is not 'h' then go to START3
;		 LDRB r4,[r0, #2] ; get the character 2 characters after current character
;		 CMP r4,#the3 ; check if the 2nd character after the current character is 'e'
;		 BNE START3 ; if that character is not 'e' then go to START3
;		 LDRB r5,[r0, #3] ; get the 3rd character after the current character
;		 CMP r5,#ES ; check if the 3rd character after the current character is null
;		 ADDEQ r0, r0, #3 ; if that character is null then make r0 point to the character after 'the'
;		 CMP r5,#spc ; check if the 3rd character after the current character is a space
;		 ADDEQ r0, r0, #3 ; if that character is a space then make r0 point to the character after 'the'
;		 B START3 ; go to START3

;START3   CMP r0, r8 ; check if r0 points to the end of STRING1
 ;        BEQ STOP ; if r0 is at the end of STRING1 then go to STOP to stop the program
;         LDRB r2,[r0],#1 ; make r2 equal the current character in STRING1 then make the next character the current character
 ;        STRB r2,[r1],#1 ; store r2 at the current character at STRING2 then make the next character the current one
;		 B START ; go to START

;STOP     B STOP ; STOP is an infinite loop at the end of the program
; 
;STRING1  DCB "the" ; STRING1 is the string to be read from
;EoS      DCB 0x00 ;end of STRING1
;STRING2  space 0x7F ;just allocating 127 bytes and making an empty STRING2
;	     END

 ;        AREA prog, CODE, READWRITE
;	     ENTRY
;		 ADR r3, AAA
;		 MOV r0, PC
;		 STMEA r3!, {PC}
;		 STR PC, [r3]
;		 LDMFA r3, {r1,r2}
;Loop 	 B	Loop
;		 DCD 1,2
;AAA		 DCD 3
;		 DCD 4,5
;		 END

;		AREA StackTest1, CODE, READONLY
;		ENTRY
;		ADR	sp, STACK
;		LDR r1, =0x11111111
;		LDR r2, =0x22222222
;		LDR r3, =0x33333333
;		LDR r4, =0x44444444
;		STMFD sp!, {r2,r4,r1}
;		MOV r1, #0xAA
;		MOV r2, #0xBB
;		MOV r3, #0xCC
;		MOV r4, #0xDD
;		LDMED sp!, {r3,r1}
;LOOP 	B 	LOOP
		
;		DCD 0,0,0,0
;STACK   DCD 0xFFFFFFFF
;		DCD 0,0,0,0
;		END

;        AREA StackTest1, CODE, READONLY
;        ENTRY
;        ADR   sp,  STACK 
;        LDR   r1,  =0x11111111
;        LDR   r2,  =0x22222222
;        LDR   r3,  =0x33333333
;        LDR   r4,  =0x44444444
;        STMED sp!, {r2,r4,r1}
;        MOV   r1,  #0xAA
;        MOV   r2,  #0xBB
;        MOV   r3,  #0xCC
;        MOV   r4,  #0xDD
;        LDMFD sp!, {r3, r1}
;LOOP    B     LOOP
;
;        DCD   0, 0, 0, 0
;STACK   DCD   0xFFFFFFFF
;        DCD   0, 0, 0, 0
;        END

      AREA prog, CODE, READWRITE
      ENTRY
      ADR   r3,AAA
      MOV   r0,PC
      STMEA r3,{PC}
      STR   PC,[r3]
      LDMFA r3!,{r1,r2}
Loop  B     Loop
      DCD   1,2
AAA   DCD   3
      DCD   4,5
      END
