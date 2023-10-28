

	AREA Lab2b, CODE, READONLY
	ENTRY
	EXPORT __main
	
__main	PROC
	LDR r7, MAX
	LDR r2, LENGTH	; r2=arry lenght which is used as counter
	SUB r2, r2, #1	; decrement counter (r2) by 1, keep track of the # of loop
	MOV r6, #0			; initializing max =0
	
FOR_START
	MOV r1, #0			; index i (r1) set to 0
	ADR r5, ARRAY		; pointer pointing to A[0]
	LDR r3, [r5]		; LOAD POINTER VALUE IN NEXT
UPDATE 
	CMP r6, r3			; COMPARE r6 with Rr3 
	BGT FORWARD			; IF (r6 > r3)branch to the loop "FORWARD"
	MOV r6, r3			; Set r6 = r3
	ADD r1, #1			; Inrcrement index (r1) by 1
	ADD r5, #4			; Pointer point to the next element
	B	UPDATE			; looping back to the For loop check
	
FORWARD
	ADD r5, #4			; increament POINTER + 4= Next adress
	ADD	r1, #1			; Inecrement Index by 1
	CMP	r1, r2
	BNE	UPDATE
	
END_FORWARD
	STR	R6, [R7]		; store result into MAX
	;B	STOP
	ENDP
	
	AREA Lab2b, DATA, READWRITE
	ALIGN
MAX	DCD 0X20000000
ARRAY	DCD	5, 10,15, 20, 30,40
		DCD -17, 28, 32, 64, 96
LENGTH	DCD 11
;STOP
	END