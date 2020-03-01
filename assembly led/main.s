;This is the first ARM Assembly language program you see in the lab
;This program template was created by Airs Lin @ 2017 California State University of Los Angeles.
;When you write your program, you could have your info at the top document block
;For Example:  Your Name, Student Number, what the program is for, and what it does etc.
 
; Constant Variable Here
STACK_ADDR_123G EQU     0x20008000
 
            THUMB
 
; Vector Table Mapped to Address 0 at Reset
; Linker requires __Vectors to be exported
 
            AREA    RESET, DATA, READONLY
            EXPORT  __Vectors
__Vectors
            DCD     STACK_ADDR_123G         ; stack pointer value when stack is empty
            DCD     Reset_Handler           ; reset vector
 
            ALIGN
 
; The program
; Linker requires Reset_Handler
 
            AREA    |.text|, CODE, READONLY
            ENTRY                           ; mark first instruction to execute
            EXPORT Reset_Handler
Reset_Handler
;;;;;;;;;; Your Main Code Starts from the next line ;;;;;;;;;;;;
 
        LDR R1,=0x400FE608  ;GPIO_RCGC     
		LDR R0,[R1]
		ORR R0,R0,#0x20
		STR R0,[R1]
		NOP
		NOP
		NOP
		
		LDR R1,= 0x40025520  ;Lock
		MOV R0,#0
		ORR R0,R0,#0x4C000000
		ORR R0,R0,#0x004F0000
		ORR R0,R0,#0x00004300
		ORR R0,R0,#0x0000004B
		STR R0,[R1]
		
		LDR R1,= 0x40025524  ;Commit
		LDR R0,[R1]
		ORR R0,R0,#0x1F 
		STR R0,[R1]
		
		LDR R1,= 0x40025400  ;Direction
		LDR R0,[R1]
		ORR R0,R0,#0x0E
		STR R0,[R1]
		
		LDR R1, = 0x4002551C  ;Digital Enable
		LDR R0,[R1]
		ORR R0,R0,#0x1F
		STR R0,[R1]
		
		LDR R1, = 0x40025510  ;Pull up
		LDR R0,[R1]
		ORR R0,R0,#0x11
		STR R0,[R1]
		
		LDR R1,= 0x400253FC	  ;Data
		LDR R0,[R1]
		ORR R0,R0,#0x06
		STR R0,[R1]	
 
 
            ADD     R0, R0, #4
DeadLoop    B       DeadLoop
 
; The constant variable area
; The value will be stored on ROM segment
            AREA    ConstantVariables, DATA, READONLY
 
; The variables area
; The variables will be assigned to RAM area
            AREA    Variables, DATA, READWRITE
 
            END     ; End of the program