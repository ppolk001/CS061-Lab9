;=================================================
; Name: Patrick Polk
; Email: ppolk001@ucr.edu
; 
; Lab: lab 9, ex1
; Lab section: 025
; TA: James Luo
; 
;=================================================
;this stack lab computes the polish notation of a set of calls
;upload to github through git (after opening git, enter: cd ~  to gain access to computer files like OneDrive)
; test harness
.orig x3000
                ;load the stack into R6
                LD          R6, STACK_ADDR
                ;initialize a pointer to the top of the stack
                ;AND         R3, R3, x0
                ;ADD         R3, R3, R6
    
;push_val(4) pushes the value 4 onto the stack [4]
                AND         R2, R2, x0
                ADD         R2, R2, #4
                ;go to subroutine
                ;ADD         R6, R3, #0                                          ;update the top of the stack pointer
                LD          R5, PUSH_ADDR
                JSRR        R5

;push_val(3) pushes the value 3 onto the stack [4,3]
                AND         R2, R2, x0
                ADD         R2, R2, #3
                ;go to subroutine
                ;ADD         R6, R3, #0                                          ;update the top of the stack pointer
                LD          R5, PUSH_ADDR
                JSRR        R5

;push_val(2) pushes the value 2 onto the stack [4,3,2]
                AND         R2, R2, x0
                ADD         R2, R2, #2                
                ;go to subroutine
                ;ADD         R6, R3, #0                                          ;update the top of the stack pointer
                LD          R5, PUSH_ADDR
                JSRR        R5

;add_val() pop 3,2 and push the result of 3+2 onto the stack [4,5]
              
                ;go to subroutine
                LD          R5, ADD_ADDR
                JSRR        R5

;add_val() pop 4,5 and push the result of 4+5 onto the stack[9]
                
                ;go to subroutine
                LD          R5, ADD_ADDR
                JSRR        R5

;move the top value of the stack into r4

                LDR         R4, R6, #0

				 
halt
;---------------------------------------------------
; test harness local data:
PUSH_ADDR       .FILL       x3400
ADD_ADDR        .FILL       x3800
REM_DATA        .FILL       x4200      

STACK_ADDR      .FILL       xFE00
;===================================================
.end

;===================================================
;--------------------subroutines--------------------
;===================================================

;subroutine1: pass in the value in R2 and store it in the stack, RETURN IN R3 TOP OF THE STACK ADDR
.orig x3400 ;;push_val(int val)implement your push function that will push a value onto the stack

            ADD         R6, R6, #-1
            STR         R2, R6, #0
            RET
.end
;subroutine2:
.orig x3800 ;; add_val() pops two values from the top of the stack and pushes the result of adding the poppped value into the stack

            ;LDR         R0, R6, #0
            ;BRz         BELOW
;BELOW       LDR         R0, R6, #1
            ;BRz         QUIT
            
            AND         R0, R0, x0
            ADD         R0, R0, #0
    
            LDR         R3, R6, #0
            STR         R0, R6, #0
            
            ADD         R6, R6, #1
            LDR         R5, R6, #0
            
            ADD         R3, R3, R5
            STR         R3, R6, #0
QUIT        RET     


            
.end


;-----------
;remote data
;-----------
.orig x4200 ;;data you might need

.end


