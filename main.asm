  	
	.text
	.retain

	MOVS R3,#3 ;BIRINCISAYI
	MOVS R4,#3 ;islem turu: 1->toplama 2->cikarma 3->carpma 4->bolme
	MOVS R5,#1 ;IKINCISAYI
	MOVS R6,#0 ;UCUNCUSAYI(=SONUC)
	MOVS R7,#0 ;Dongude kalıp belirli bir sure gecmesi icin -> R7 degeri 0x1 den 0X400000 e kadar gelir

;---------------------------------------------------------------------------------------------------------------------------
	ADR 	R0,SYSCTRL
	LDR 	R1,[R0]
	MOV	R2, #0x3F;R2=0X3F=0000 0000 0000 0000 001(F)1(E) 1(D)1(C)1(B)1(A)
	STR	R2, [R1];MEM[R1]=R2 => MEM[0X400FE108]=0X3F

;PORT_DIR-------------------------------------------------------------------------------------------------------------------

	;PORTA_DIR=0x40004400
	ADR 	R0,PORTA_DIR
	LDR 	R1, [R0]
	LDR 	R2, [R1]
	ORR.W  	R2, R2, #((1<<2)|(1<<3)|(1<<4)|(1<<5)|(1<<6)|(1<<7))
	STR  	R2, [R1]; MEM[R1]=R2=> MEM[0x40004400]=0000 0000 0000 0000 0000 0000 1111 1100


	;PORTB_DIR=0x40005400
	ADR 	R0,PORTB_DIR
	LDR	R1, [R0]
	LDR     R2, [R1]
	ORR.W   R2, R2, #((1<<0)|(1<<1)|(1<<2)|(1<<3)|(1<<4)|(1<<5)|(1<<6)|(1<<7))
	STR     R2, [R1]

	;PORTC_DIR=0x40006400
	ADR 	R0,PORTC_DIR
	LDR	R1, [R0]
	LDR     R2, [R1]
	ORR.W   R2, R2, #((1<<4)|(1<<5)|(1<<6)|(1<<7))
	STR     R2, [R1]

	;PORTD_DIR=0x40007400
	ADR 	R0,PORTD_DIR
	LDR	R1, [R0]
	LDR     R2, [R1]
	ORR.W   R2, R2, #((1<<0)|(1<<1)|(1<<2)|(1<<3)|(1<<6)|(1<<7))
	STR     R2, [R1]

	;PORTE_DIR=0x40024400
	ADR 	R0,PORTE_DIR
	LDR	R1, [R0]
	LDR     R2, [R1]
	ORR.W   R2, R2, #((1<<1)|(1<<2)|(1<<3)|(1<<4)|(1<<5))
	STR     R2, [R1]
	;PORTF_DIR=0x40025400
	ADR 	R0,PORTF_DIR
	LDR 	R1, [R0]
	LDR     R2, [R1]
	ORR.W   R2, R2, #((1<<0)|(1<<1)|(1<<2)|(1<<3)|(1<<4))
	STR     R2, [R1]

;PORT_DIR*******************************************************************************************************************

;PORT_DEN-------------------------------------------------------------------------------------------------------------------

	ADR 	R0,PORTA_DEN
	LDR 	R1, [R0]
	LDR 	R2, [R1]
	ORR.W  	R2, R2, #((1<<2)|(1<<3)|(1<<4)|(1<<5)|(1<<6)|(1<<7))
	STR  	R2, [R1]

	ADR 	R0,PORTB_DEN
	LDR		R1, [R0]
	LDR     R2, [R1]
	ORR.W   R2, R2, #((1<<0)|(1<<1)|(1<<2)|(1<<3)|(1<<4)|(1<<5)|(1<<6)|(1<<7))
	STR     R2, [R1]

	ADR 	R0,PORTC_DEN
	LDR	R1, [R0]
	LDR     R2, [R1]
	ORR.W   R2, R2, #((1<<4)|(1<<5)|(1<<6)|(1<<7))
	STR     R2, [R1]

	ADR 	R0,PORTD_DEN
	LDR	R1, [R0]
	LDR     R2, [R1]
	ORR.W   R2, R2, #((1<<0)|(1<<1)|(1<<2)|(1<<3)|(1<<6)|(1<<7))
	STR     R2, [R1]

	ADR 	R0,PORTE_DEN
	LDR	R1, [R0]
	LDR     R2, [R1]
	ORR.W   R2, R2, #((1<<1)|(1<<2)|(1<<3)|(1<<4)|(1<<5))
	STR     R2, [R1]

	ADR 	R0,PORTF_DEN
	LDR 	R1, [R0]
	LDR     R2, [R1]
	ORR.W   R2, R2, #((1<<0)|(1<<1)|(1<<2)|(1<<3)|(1<<4))
	STR     R2, [R1]

;PORT_DEN*******************************************************************************************************************

	ADR	R0,PORTB_DAT
	LDR R1, [R0]
	LDR R2, [R1]
	ORR.W  R2,R2,#(1<<4);1. display
	STR R2, [R1]


	ADR	R0,PORTA_DAT
	LDR R1, [R0]
	LDR R2, [R1]
	ORR.W  R2,R2,#(1<<3);2. display
	STR R2, [R1]

	ADR	R0,PORTC_DAT
	LDR R1, [R0]
	LDR R2, [R1]
	ORR.W  R2,R2,#(1<<4);3. display
	STR R2, [R1]

;----------------------------------------------------------------------------------------------------------------------------

BASLANGIC:

;YANAN LEDLERI SONDURMEK ICIN

	;1. display

	ADR	R0,PORTA_DAT
	LDR R1, [R0]
	LDR R2, [R1]
	ORR.W  R2,R2,#((1<<5)|(1<<6)|(1<<7))
	STR R2, [R1]

	ADR	R0,PORTE_DAT
	LDR R1, [R0]
	LDR R2, [R1]
	ORR.W  R2,R2,#((1<<1)|(1<<2)|(1<<3)|(1<<5))
	STR R2, [R1]

	;1. display********************************

	ADR	R0,PORTD_DAT
	LDR R1, [R0]
	LDR R2, [R1]
        BIC.W  R2,R2,#(1<<3);1. ledi sondurmek icin
	STR R2, [R1]

	ADR	R0,PORTE_DAT
	LDR R1, [R0]
	LDR R2, [R1]
	BIC.W  R2, R2, #(1<<4);2. ledi sondurmek icin
	STR R2, [R1]

	ADR	R0,PORTD_DAT
	LDR R1, [R0]
	LDR R2, [R1]
        BIC.W  R2,R2,#(1<<2);3. ledi sondurmek icin
	STR R2, [R1]

	ADR	R0,PORTB_DAT
	LDR R1, [R0]
	LDR R2, [R1]
	BIC.W  R2,R2,#(1<<1);4. ledi sondurmek icin
	STR R2, [R1]

	;2. display

	ADR	R0,PORTA_DAT
	LDR R1, [R0]
	LDR R2, [R1]
	ORR.W  R2,R2,#((1<<2)|(1<<4))
	STR R2, [R1]

	ADR	R0,PORTB_DAT
	LDR R1, [R0]
	LDR R2, [R1]
	ORR.W  R2,R2,#((1<<0)|(1<<5))
	STR R2, [R1]

	ADR	R0,PORTD_DAT
	LDR R1, [R0]
	LDR R2, [R1]
	ORR.W  R2,R2,#((1<<0)|(1<<1)|(1<<6))
	STR R2, [R1]

	;2. display********************************

       ;ESITTIR
	ADR	R0,PORTF_DAT
	LDR R1, [R0]
	LDR R2, [R1]
	BIC.W  R2,R2,#(1<<1)
	STR R2, [R1]
	;ESITTIR***********************************

	;3. display

	ADR	R0,PORTB_DAT
	LDR R1, [R0]
	LDR R2, [R1]
	ORR.W  R2,R2,#((1<<2)|(1<<3))
	STR R2, [R1]

	ADR	R0,PORTC_DAT
	LDR R1, [R0]
	LDR R2, [R1]
	ORR.W  R2,R2,#((1<<5)|(1<<6)|(1<<7))
	STR R2, [R1]

	ADR	R0,PORTF_DAT
	LDR R1, [R0]
	LDR R2, [R1]
	ORR.W  R2,R2,#((1<<2)|(1<<3))
	STR R2, [R1]

	;3. display********************************


;-----------------------------------------------------------------------------------

     ;BIRINCI SAYI
	 CMP R3,#0
	 BLT HATA
	 CMP R3,#9
	 BGT HATA

	 ;ISLEM
	 CMP R4,#1
	 BLT HATA
	 CMP R4,#4
	 BGT HATA

	 ;IKINCISAYI
	 CMP R5,#0
	 BLT HATA
	 CMP R5,#9
	 BGT HATA


;BIRINCISAYI
BIRINCISAYI:

BIRINCISAYI_SIFIR:

	CMP R3,#0
	BNE BIRINCISAYI_BIR

	ADR	R0,PORTA_DAT
	LDR R1, [R0]
	LDR R2, [R1]
        BIC.W  R2,R2,#((1<<5)|(1<<6)|(1<<7))
	STR R2, [R1]

	ADR	R0,PORTE_DAT
	LDR R1, [R0]
	LDR R2, [R1]
        BIC.W  R2,R2,#((1<<1)|(1<<2)|(1<<3))
	STR R2, [R1]

	B IKINCISAYI

BIRINCISAYI_BIR:

	CMP R3,#1
	BNE BIRINCISAYI_IKI

	ADR	R0,PORTE_DAT
	LDR R1, [R0]
	LDR R2, [R1]
        BIC.W  R2,R2,#((1<<1)|(1<<3))
	STR R2, [R1]

	B IKINCISAYI

BIRINCISAYI_IKI:

	CMP R3,#2
	BNE BIRINCISAYI_UC

	ADR	R0,PORTA_DAT
	LDR R1, [R0]
	LDR R2, [R1]
        BIC.W  R2,R2,#((1<<5)|(1<<6))
	STR R2, [R1]

	ADR	R0,PORTE_DAT
	LDR R1, [R0]
	LDR R2, [R1]
        BIC.W  R2,R2,#((1<<2)|(1<<3)|(1<<5))
	STR R2, [R1]

	B IKINCISAYI

BIRINCISAYI_UC:

	CMP R3,#3
	BNE BIRINCISAYI_DORT

	ADR	R0,PORTA_DAT
	LDR R1, [R0]
	LDR R2, [R1]
        BIC.W  R2,R2,#(1<<6)
	STR R2, [R1]

	ADR	R0,PORTE_DAT
	LDR R1, [R0]
	LDR R2, [R1]
        BIC.W  R2,R2,#((1<<1)|(1<<2)|(1<<3)|(1<<5))
	STR R2, [R1]

	B IKINCISAYI

BIRINCISAYI_DORT:

	CMP R3,#4
	BNE BIRINCISAYI_BES

	ADR	R0,PORTA_DAT
	LDR R1, [R0]
	LDR R2, [R1]
        BIC.W  R2,R2,#(1<<7)
	STR R2, [R1]

	ADR	R0,PORTE_DAT
	LDR R1, [R0]
	LDR R2, [R1]
        BIC.W  R2,R2,#((1<<1)|(1<<3)|(1<<5))
	STR R2, [R1]

	B IKINCISAYI

BIRINCISAYI_BES:

	CMP R3,#5
	BNE BIRINCISAYI_ALTI

	ADR	R0,PORTA_DAT
	LDR R1, [R0]
	LDR R2, [R1]
        BIC.W  R2,R2,#((1<<6)|(1<<7))
	STR R2, [R1]

	ADR	R0,PORTE_DAT
	LDR R1, [R0]
	LDR R2, [R1]
        BIC.W  R2,R2,#((1<<1)|(1<<2)|(1<<5))
	STR R2, [R1]

	B IKINCISAYI

BIRINCISAYI_ALTI:

	CMP R3,#6
	BNE BIRINCISAYI_YEDI

	ADR	R0,PORTA_DAT
	LDR R1, [R0]
	LDR R2, [R1]
        BIC.W  R2,R2,#((1<<5)|(1<<6)|(1<<7))
	STR R2, [R1]

	ADR	R0,PORTE_DAT
	LDR R1, [R0]
	LDR R2, [R1]
        BIC.W  R2,R2,#((1<<1)|(1<<2)|(1<<5))
	STR R2, [R1]

	B IKINCISAYI

BIRINCISAYI_YEDI:

	CMP R3,#7
	BNE BIRINCISAYI_SEKIZ

	ADR	R0,PORTA_DAT
	LDR R1, [R0]
	LDR R2, [R1]
        BIC.W  R2,R2,#(1<<6)
	STR R2, [R1]

	ADR	R0,PORTE_DAT
	LDR R1, [R0]
	LDR R2, [R1]
        BIC.W  R2,R2,#((1<<1)|(1<<3))
	STR R2, [R1]

	B IKINCISAYI

BIRINCISAYI_SEKIZ:

	CMP R3,#8
	BNE BIRINCISAYI_DOKUZ

	ADR	R0,PORTA_DAT
	LDR R1, [R0]
	LDR R2, [R1]
        BIC.W  R2,R2,#((1<<5)|(1<<6)|(1<<7))
	STR R2, [R1]

	ADR	R0,PORTE_DAT
	LDR R1, [R0]
	LDR R2, [R1]
        BIC.W  R2,R2,#((1<<1)|(1<<2)|(1<<3)|(1<<5))
	STR R2, [R1]

	B IKINCISAYI

BIRINCISAYI_DOKUZ:

	ADR	R0,PORTA_DAT
	LDR R1, [R0]
	LDR R2, [R1]
        BIC.W  R2,R2,#((1<<6)|(1<<7))
	STR R2, [R1]

	ADR	R0,PORTE_DAT
	LDR R1, [R0]
	LDR R2, [R1]
        BIC.W  R2,R2,#((1<<1)|(1<<2)|(1<<3)|(1<<5))
	STR R2, [R1]

;BIRINCISAYI------------------------------------------------------------------------

;IKINCISAYI
IKINCISAYI:

IKINCISAYI_SIFIR:

	CMP R5,#0
	BNE IKINCISAYI_BIR

	ADR	R0,PORTA_DAT
	LDR R1, [R0]
	LDR R2, [R1]
        BIC.W  R2,R2,#(1<<2)
	STR R2, [R1]

	ADR	R0,PORTB_DAT
	LDR R1, [R0]
	LDR R2, [R1]
        BIC.W  R2,R2,#((1<<0)|(1<<5))
	STR R2, [R1]

	ADR	R0,PORTD_DAT
	LDR R1, [R0]
	LDR R2, [R1]
        BIC.W  R2,R2,#((1<<0)|(1<<1)|(1<<6))
	STR R2, [R1]

	B ISLEM

IKINCISAYI_BIR:

	CMP R5,#1
	BNE IKINCISAYI_IKI

	ADR	R0,PORTD_DAT
	LDR R1, [R0]
	LDR R2, [R1]
        BIC.W  R2,R2,#((1<<0)|(1<<6))
	STR R2, [R1]

	B ISLEM

IKINCISAYI_IKI:

	CMP R5,#2
	BNE IKINCISAYI_UC

	ADR	R0,PORTA_DAT
	LDR R1, [R0]
	LDR R2, [R1]
        BIC.W  R2,R2,#((1<<2)|(1<<4))
	STR R2, [R1]

	ADR	R0,PORTB_DAT
	LDR R1, [R0]
	LDR R2, [R1]
        BIC.W  R2,R2,#((1<<0)|(1<<5))
	STR R2, [R1]

	ADR	R0,PORTD_DAT
	LDR R1, [R0]
	LDR R2, [R1]
        BIC.W  R2,R2,#(1<<0)
	STR R2, [R1]

	B ISLEM

IKINCISAYI_UC:

	CMP R5,#3
	BNE IKINCISAYI_DORT

	ADR	R0,PORTA_DAT
	LDR R1, [R0]
	LDR R2, [R1]
        BIC.W  R2,R2,#((1<<2)|(1<<4))
	STR R2, [R1]

	ADR	R0,PORTB_DAT
	LDR R1, [R0]
	LDR R2, [R1]
        BIC.W  R2,R2,#(1<<0)
	STR R2, [R1]

	ADR	R0,PORTD_DAT
	LDR R1, [R0]
	LDR R2, [R1]
        BIC.W  R2,R2,#((1<<0)|(1<<6))
	STR R2, [R1]

	B ISLEM

IKINCISAYI_DORT:

	CMP R5,#4
	BNE IKINCISAYI_BES

	ADR	R0,PORTA_DAT
	LDR R1, [R0]
	LDR R2, [R1]
        BIC.W  R2,R2,#(1<<4)
	STR R2, [R1]

	ADR	R0,PORTD_DAT
	LDR R1, [R0]
	LDR R2, [R1]
        BIC.W  R2,R2,#((1<<0)|(1<<1)|(1<<6))
	STR R2, [R1]

	B ISLEM

IKINCISAYI_BES:

	CMP R5,#5
	BNE IKINCISAYI_ALTI

	ADR	R0,PORTA_DAT
	LDR R1, [R0]
	LDR R2, [R1]
        BIC.W  R2,R2,#((1<<2)|(1<<4))
	STR R2, [R1]

	ADR	R0,PORTB_DAT
	LDR R1, [R0]
	LDR R2, [R1]
        BIC.W  R2,R2,#(1<<0)
	STR R2, [R1]

	ADR	R0,PORTD_DAT
	LDR R1, [R0]
	LDR R2, [R1]
        BIC.W  R2,R2,#((1<<1)|(1<<6))
	STR R2, [R1]

	B ISLEM

IKINCISAYI_ALTI:

	CMP R5,#6
	BNE IKINCISAYI_YEDI

	ADR	R0,PORTA_DAT
	LDR R1, [R0]
	LDR R2, [R1]
        BIC.W  R2,R2,#((1<<2)|(1<<4))
	STR R2, [R1]

	ADR	R0,PORTB_DAT
	LDR R1, [R0]
	LDR R2, [R1]
        BIC.W  R2,R2,#((1<<0)|(1<<5))
	STR R2, [R1]

	ADR	R0,PORTD_DAT
	LDR R1, [R0]
	LDR R2, [R1]
        BIC.W  R2,R2,#((1<<1)|(1<<6))
	STR R2, [R1]

	B ISLEM

IKINCISAYI_YEDI:

	CMP R5,#7
	BNE IKINCISAYI_SEKIZ

	ADR	R0,PORTB_DAT
	LDR R1, [R0]
	LDR R2, [R1]
        BIC.W  R2,R2,#(1<<0)
	STR R2, [R1]

	ADR	R0,PORTD_DAT
	LDR R1, [R0]
	LDR R2, [R1]
        BIC.W  R2,R2,#((1<<0)|(1<<6))
	STR R2, [R1]

	B ISLEM

IKINCISAYI_SEKIZ:

	CMP R5,#8
	BNE IKINCISAYI_DOKUZ

	ADR	R0,PORTA_DAT
	LDR R1, [R0]
	LDR R2, [R1]
        BIC.W  R2,R2,#((1<<2)|(1<<4))
	STR R2, [R1]

	ADR	R0,PORTB_DAT
	LDR R1, [R0]
	LDR R2, [R1]
        BIC.W  R2,R2,#((1<<0)|(1<<5))
	STR R2, [R1]

	ADR	R0,PORTD_DAT
	LDR R1, [R0]
	LDR R2, [R1]
        BIC.W  R2,R2,#((1<<0)|(1<<1)|(1<<6))
	STR R2, [R1]

	B ISLEM

IKINCISAYI_DOKUZ:

	ADR	R0,PORTA_DAT
	LDR R1, [R0]
	LDR R2, [R1]
        BIC.W  R2,R2,#((1<<2)|(1<<4))
	STR R2, [R1]

	ADR	R0,PORTB_DAT
	LDR R1, [R0]
	LDR R2, [R1]
        BIC.W  R2,R2,#(1<<0)
	STR R2, [R1]

	ADR	R0,PORTD_DAT
	LDR R1, [R0]
	LDR R2, [R1]
        BIC.W  R2,R2,#((1<<0)|(1<<1)|(1<<6))
	STR R2, [R1]

;IKINCISAYI------------------------------------------------------------------------

ISLEM:

	CMP R4,#1
	BEQ TOPLAMA

	CMP R4,#2
	BEQ CIKARMA

	CMP R4,#3
	BEQ CARPMA

	CMP R4,#4
	BEQ BOLME

TOPLAMA:

	ADR	R0,PORTD_DAT
	LDR R1, [R0]
	LDR R2, [R1]
        ORR.W  R2,R2,#(1<<3)
 	STR R2, [R1]

	ADD R6,R3,R5

	B ESITTIR

CIKARMA:

	ADR	R0,PORTE_DAT
	LDR R1, [R0]
	LDR R2, [R1]
	ORR.W  R2, R2, #(1<<4)
	STR R2, [R1]

	SUB R6,R3,R5

	B ESITTIR

CARPMA:

	ADR	R0,PORTD_DAT
	LDR R1, [R0]
	LDR R2, [R1]
        ORR.W  R2,R2,#(1<<2)
	STR R2, [R1]

	MUL R6,R3,R5

	B ESITTIR

BOLME:

	ADR	R0,PORTB_DAT
	LDR R1, [R0]
	LDR R2, [R1]
	ORR.W  R2,R2,#(1<<1)
	STR R2, [R1]

	UDIV R6,R3,R5

;ESITTIR
ESITTIR:

	ADR	R0,PORTF_DAT
	LDR R1, [R0]
	LDR R2, [R1]
	ORR.W  R2,R2,#(1<<1)
	STR R2, [R1]

;ESITTIR------------------------------------------------------------------------

UCUNCUSAYI:

	CMP R6,#0
	BLT HATA2
	CMP R6,#9
	BGT HATA2

UCUNCUSAYI_SIFIR:

	CMP R6,#0
	BNE UCUNCUSAYI_BIR

	ADR	R0,PORTB_DAT
	LDR R1, [R0]
	LDR R2, [R1]
	BIC.W  R2,R2,#(1<<3)
	STR R2, [R1]

	ADR	R0,PORTC_DAT
	LDR R1, [R0]
	LDR R2, [R1]
	BIC.W  R2,R2,#((1<<5)|(1<<6)|(1<<7))
	STR R2, [R1]

	ADR	R0,PORTF_DAT
	LDR R1, [R0]
	LDR R2, [R1]
	BIC.W  R2,R2,#((1<<2)|(1<<3))
	STR R2, [R1]

	B SON

UCUNCUSAYI_BIR:

	CMP R6,#1
	BNE UCUNCUSAYI_IKI

	ADR	R0,PORTB_DAT
	LDR R1, [R0]
	LDR R2, [R1]
	BIC.W  R2,R2,#(1<<3)
	STR R2, [R1]

	ADR	R0,PORTC_DAT
	LDR R1, [R0]
	LDR R2, [R1]
	BIC.W  R2,R2,#(1<<6)
	STR R2, [R1]

	B SON

UCUNCUSAYI_IKI:

	CMP R6,#2
	BNE UCUNCUSAYI_UC

	ADR	R0,PORTB_DAT
	LDR R1, [R0]
	LDR R2, [R1]
	BIC.W  R2,R2,#(1<<2)
	STR R2, [R1]

	ADR	R0,PORTC_DAT
	LDR R1, [R0]
	LDR R2, [R1]
	BIC.W  R2,R2,#((1<<5)|(1<<6))
	STR R2, [R1]

	ADR	R0,PORTF_DAT
	LDR R1, [R0]
	LDR R2, [R1]
	BIC.W  R2,R2,#((1<<2)|(1<<3))
	STR R2, [R1]

	B SON

UCUNCUSAYI_UC:

	CMP R6,#3
	BNE UCUNCUSAYI_DORT

	ADR	R0,PORTB_DAT
	LDR R1, [R0]
	LDR R2, [R1]
	BIC.W  R2,R2,#((1<<2)|(1<<3))
	STR R2, [R1]

	ADR	R0,PORTC_DAT
	LDR R1, [R0]
	LDR R2, [R1]
	BIC.W  R2,R2,#((1<<5)|(1<<6))
	STR R2, [R1]

	ADR	R0,PORTF_DAT
	LDR R1, [R0]
	LDR R2, [R1]
	BIC.W  R2,R2,#(1<<3)
	STR R2, [R1]

	B SON

UCUNCUSAYI_DORT:

	CMP R6,#4
	BNE UCUNCUSAYI_BES

	ADR	R0,PORTB_DAT
	LDR R1, [R0]
	LDR R2, [R1]
	BIC.W  R2,R2,#((1<<2)|(1<<3))
	STR R2, [R1]

	ADR	R0,PORTC_DAT
	LDR R1, [R0]
	LDR R2, [R1]
	BIC.W  R2,R2,#((1<<6)|(1<<7))
	STR R2, [R1]

	B SON

UCUNCUSAYI_BES:

	CMP R6,#5
	BNE UCUNCUSAYI_ALTI

	ADR	R0,PORTB_DAT
	LDR R1, [R0]
	LDR R2, [R1]
	BIC.W  R2,R2,#((1<<2)|(1<<3))
	STR R2, [R1]

	ADR	R0,PORTC_DAT
	LDR R1, [R0]
	LDR R2, [R1]
	BIC.W  R2,R2,#((1<<5)|(1<<7))
	STR R2, [R1]

	ADR	R0,PORTF_DAT
	LDR R1, [R0]
	LDR R2, [R1]
	BIC.W  R2,R2,#(1<<3)
	STR R2, [R1]

	B SON

UCUNCUSAYI_ALTI:

	CMP R6,#6
	BNE UCUNCUSAYI_YEDI

	ADR	R0,PORTB_DAT
	LDR R1, [R0]
	LDR R2, [R1]
	BIC.W  R2,R2,#((1<<2)|(1<<3))
	STR R2, [R1]

	ADR	R0,PORTC_DAT
	LDR R1, [R0]
	LDR R2, [R1]
	BIC.W  R2,R2,#((1<<5)|(1<<7))
	STR R2, [R1]

	ADR	R0,PORTF_DAT
	LDR R1, [R0]
	LDR R2, [R1]
	BIC.W  R2,R2,#((1<<2)|(1<<3))
	STR R2, [R1]

	B SON

UCUNCUSAYI_YEDI:

	CMP R6,#7
	BNE UCUNCUSAYI_SEKIZ

	ADR	R0,PORTB_DAT
	LDR R1, [R0]
	LDR R2, [R1]
	BIC.W  R2,R2,#(1<<3)
	STR R2, [R1]

	ADR	R0,PORTC_DAT
	LDR R1, [R0]
	LDR R2, [R1]
	BIC.W  R2,R2,#(1<<6)
	STR R2, [R1]

	ADR	R0,PORTF_DAT
	LDR R1, [R0]
	LDR R2, [R1]
	BIC.W  R2,R2,#(1<<3)
	STR R2, [R1]

	B SON

UCUNCUSAYI_SEKIZ:

	CMP R6,#8
	BNE UCUNCUSAYI_DOKUZ

	ADR	R0,PORTB_DAT
	LDR R1, [R0]
	LDR R2, [R1]
	BIC.W  R2,R2,#((1<<2)|(1<<3))
	STR R2, [R1]

	ADR	R0,PORTC_DAT
	LDR R1, [R0]
	LDR R2, [R1]
	BIC.W  R2,R2,#((1<<5)|(1<<6)|(1<<7))
	STR R2, [R1]

	ADR	R0,PORTF_DAT
	LDR R1, [R0]
	LDR R2, [R1]
	BIC.W  R2,R2,#((1<<2)|(1<<3))
	STR R2, [R1]

	B SON

UCUNCUSAYI_DOKUZ:

	ADR	R0,PORTB_DAT
	LDR R1, [R0]
	LDR R2, [R1]
	BIC.W  R2,R2,#((1<<2)|(1<<3))
	STR R2, [R1]

	ADR	R0,PORTC_DAT
	LDR R1, [R0]
	LDR R2, [R1]
	BIC.W  R2,R2,#((1<<5)|(1<<6)|(1<<7))
	STR R2, [R1]

	ADR	R0,PORTF_DAT
	LDR R1, [R0]
	LDR R2, [R1]
	BIC.W  R2,R2,#(1<<3)
	STR R2, [R1]

	B SON
;UCUNCUSAYI------------------------------------------------------------------------

HATA:

    ;1. display
	ADR	R0,PORTE_DAT
	LDR R1, [R0]
	LDR R2, [R1]
	BIC.W  R2,R2,#(1<<5)
	STR R2, [R1]

	;1. led
	ADR	R0,PORTD_DAT
	LDR R1, [R0]
	LDR R2, [R1]
        ORR.W  R2,R2,#(1<<3)
	STR R2, [R1]

	;2. led
	ADR	R0,PORTE_DAT
	LDR R1, [R0]
	LDR R2, [R1]
	ORR.W  R2, R2, #(1<<4)
	STR R2, [R1]

	;3. led
	ADR	R0,PORTD_DAT
	LDR R1, [R0]
	LDR R2, [R1]
        ORR.W  R2,R2,#(1<<2)
	STR R2, [R1]

	;4. led
	ADR	R0,PORTB_DAT
	LDR R1, [R0]
	LDR R2, [R1]
	ORR.W  R2,R2,#(1<<1)
	STR R2, [R1]

	;2. display
	ADR	R0,PORTA_DAT
	LDR R1, [R0]
	LDR R2, [R1]
	BIC.W  R2,R2,#(1<<4)
	STR R2, [R1]

	;ESITTIR
	ADR	R0,PORTF_DAT
	LDR R1, [R0]
	LDR R2, [R1]
	ORR.W  R2,R2,#(1<<1)
	STR R2, [R1]

	;3. display
	ADR	R0,PORTB_DAT
	LDR R1, [R0]
	LDR R2, [R1]
	BIC.W  R2,R2,#(1<<2)
	STR R2, [R1]

	B SON2
	
HATA2:

	ADR	R0,PORTB_DAT
	LDR R1, [R0]
	LDR R2, [R1]
	BIC.W  R2,R2,#(1<<2)
	STR R2, [R1]
	B SON2

SON:
	ADD R7,R7,#1
	CMP R7,#0X400000
	BNE SON

	ADD R3,R3,#1
	ADD R5,R5,#1
	MOVS R6,#0
	MOVS R7,#0
	B BASLANGIC

SON2:

SYSCTRL	.word	0x400FE108

PORTA_DIR	.word	0x40004400
PORTA_DAT	.word	0x400043FC
PORTA_DEN	.word	0x4000451C


PORTB_DIR	.word	0x40005400
PORTB_DAT	.word	0x400053FC
PORTB_DEN	.word	0x4000551C


PORTC_DIR	.word	0x40006400
PORTC_DAT	.word	0x400063FC
PORTC_DEN	.word	0x4000651C


PORTD_DIR	.word	0x40007400
PORTD_DAT	.word	0x400073FC
PORTD_DEN	.word	0x4000751C

PORTE_DIR	.word	0x40024400
PORTE_DAT	.word	0x400243FC
PORTE_DEN	.word	0x4002451C

PORTF_DIR	.word	0x40025400
PORTF_DAT	.word	0x400253FC
PORTF_DEN	.word	0x4002551C
