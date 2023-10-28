

	AREA Lab2_1, CODE, READONLY
	ENTRY
	EXPORT __main
	
__main	PROC
	LDR r7, MAX
	LDR r2, LENGTH		; r2 = array lenght which is used as counter
	SUB r2, r2, #1		; decrement counter (r2) by 1, keep track of the # of loop
	MOV r6, #0			; initializing max =0
	LDR r5, ARRAY		; r5 set to the asress of A[0]

FOR_START
	MOV r1, #0			; Set index i = 0
	LDR r3, [R5]		; Load 1er element into r3
	
UPDATE 
	CMP r6, r3			; max < r3
	BGT FORWARD			; branch to the loop "FORWARD"
	MOV r6, r3			; MAX = NEXT
	ADD r1, #1			; Increment index i (r2) by 1
	ADD r5, #4			; Point to the next element
	B	UPDATE			; looping back to the For loop check
	
FORWARD
	ADD r5, #4			; increament POINTER + 4= Next adress
	ADD r1, #1			; Increment index by 1
	CMP r1, r2
	BNE	UPDATE
	
END_FORWARD
	STR	r6, [r7]	; Store r6 into Max
	;B	STOP
	ENDP
	
	AREA Lab2b, DATA, READWRITE
	ALIGN
MAX	DCD 0X20000000
ARRAY	DCD	5, 10,15, 20, 30, 40, -17, 28, 32, 64, 96
LENGTH	DCD 11
;STOP
	END