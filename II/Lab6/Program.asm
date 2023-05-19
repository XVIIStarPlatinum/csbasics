ORG 0x027
X:	WORD ?
CACHE:	WORD ?
L:	WORD 0xFFEA
R:	WORD 0x0014
ORG 0x0
V0:	WORD 	$DEF, 0x180
V1: 	WORD 	$INT1, 0x180
V2: 	WORD 	$INT2, 0x180
V3: 	WORD 	$DEF, 0x180
V4: 	WORD 	$DEF, 0x180
V5: 	WORD 	$DEF, 0x180
V6: 	WORD 	$DEF, 0x180
V7: 	WORD 	$DEF, 0x180
DEF:	IRET
ORG 0x100
START:	DI
 	CLA
 	OUT 0x1
 	OUT 0x7
 	OUT 0xB
 	OUT 0xD
 	OUT 0x11
 	OUT 0x15
 	OUT 0x19
 	OUT 0x1D
	LD #0x9
 	OUT 3
 	LD #0xA
 	OUT 5
 	JUMP $PROG
PROG:	EI
	CLA
SLP:	EI
	LD $X
	DI
	INC
	CMP $L
	BLT MIN
	CMP $R
	BGE MIN
	ST $X
	JUMP SLP
MIN:	LD $L
	ST $X
	JUMP SLP
INT1:	DI
	LD $X
	ASL
	ASL
	ADD $X
	ADD $X
	NEG
	SUB #5
	OUT 2
	HLT
	IRET
INT2:	DI
	CLA
	IN 4
	ST $CACHE
	SUB $X
	CMP $L
	BLT INF
	CMP $R
	BGE INF
	ST $X
	HLT
	IRET
INF:	LD $L
	ST $X
	HLT
	IRET
