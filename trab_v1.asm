	sub r0, r0  ; zera registradores
	mov r1, r0
	mov r2, r0
	mov r3, r0

	addi 1
	mov r2, r0  ; salva 1 em r2
	
	addi 4
	slr r0, r0  ; calcula endereco base de memoria
	mov r1, r0  ; salva em r1

	st r3, r1  ; salva iterador na memoria no endereco base
	gpci 7      ; calcula endereco do comeco do laco
	addi 6
	add r1, r2  
	st r0, r1   ; salva no endereco base + 1
	add r1, r2
	addi 7       ; calcula endereco do fim do laco
	addi 7
	addi 7
	addi 5

	st r0, r1   ; salva em endereco base + 2
	sub r1, r2
	mov r0, r1
	sub r1, r2  ; deixa de novo o endereco base em r1

loop:
	addi 1
	ld r3, r0   ; recupera o endereco do fim do laco
	ld r0, r1   ; recupera o iterador
	addi -5
	addi -5     ; calcula iteracao atual
	brzr r0, r3 

	mov r0, r1  ; coloca o endereco base em r0
	ld r3, r0   ; resgata o iterador e coloca em r3
	addi 3      ; desloca ate a primeira posicao do vetor A
	add r0, r3

	slr r3, r2  ; r3 = iterador * 2

	st r3, r0   ; salva em memoria em A[0]

	addi 5
	addi 5      ; desloca na memoria

	add r3, r2  ; r3 = ()iterador * 2) + 1

	st r3, r0   ; salva em B[]0]

	addi 5
	addi 5      ; desloca na memoria

	sub r3, r3  ; zera r3

	st r3, r0   ; salva em R[0]

	ld r0, r1   ; recupera iterador da memoria
	addi 1      ; incrementa iterador em 1
	st r0, r1   ; salva na memoria
	mov r0, r1  
	addi 1
	ld r3, r0   ; recupera enderaco do comeco do laco

	jr r3

fim_loop:

	add r1, r2   
	gpci 7
	addi 7
	st r0, r1  ; salva endereco do comeco do laco da soma em na memoria
	add r1, r2 
	addi 7
	addi 7
	addi 7
	addi 2
	st r0, r1  ; salva endereco do fim do laco da soma na memoria
	sub r1, r2
	mov r0, r1 ; deixa endereco base + 1 em r0
	sub r1, r2

	sub r3, r3
	st r3, r1  ; reinicia iterador

loopS:
	addi 1
	ld r3, r0  ; resgata endereco do fim do laco da memoria
	ld r0, r1  ; resgata iterador
	addi -5
	addi -5    ; calcula interacao atual
	brzr r0, r3

	mov r0, r1 ; carrega endereco base de memoria em r0
	addi 3     ; desloca ate a primeira posicao do vetor A

	ld r3, r1  ; carrega iterador em r3
	add r0, r3 

	ld r2, r0  ; carrega A[i] em r2

	addi 5
	addi 5     ; desloca ate o vetor B

	ld r3, r0  ; carrega B[i] em r3

	add r2, r3 ; A[i] + B[i]

	addi 5
	addi 5     ; desloca ate o vetor R

	st r2, r0  ; R[i] = A[i] + B[i]

	ld r0, r1  
	addi 1	   ; incrementa iterador em 1
	st r0, r1  ; salva na memoria

	mov r0, r1 
	addi 1
	ld r3, r0  ; recupera o endereco do comeco do laco da memoria

	jr r3
	
fim_loopS:
