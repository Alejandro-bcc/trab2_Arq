	sub r0, r0  ; zera registradores
	mov r1, r0
	mov r2, r0
	mov r3, r0

	addi 1      ; salva 1 em r2
	mov r2, r0  ; auxilia em varios calculos
	
	addi 4
	slr r0, r0  ; calcula endereco base de memoria (160)
	mov r1, r0  ; salva em r1

	st r3, r1   ; salva iterador na memoria no endereco base

	add r1, r2
	gpci 7      ; calcula endereco do comeco do laco
	addi 5  
	st r0, r1   ; salva no endereco base + 1

	add r1, r2

	addi 7      ; calcula endereco do fim do laco
	addi 7
	addi 7
	addi 6
	st r0, r1   ; salva em endereco base + 2

	sub r1, r2
	mov r0, r1  ; deixa endereco base + 1 em r0 para facilitar a iteracao no laco
	sub r1, r2  ; r1 volta a conter o endereco base

loop:
	addi 1      ; r0 guarda endereco base + 2
	ld r3, r0   ; recupera o endereco do fim do laco
	ld r0, r1   ; recupera o iterador
	addi -5
	addi -5     ; calcula iteracao atual
	brzr r0, r3 ; se iterador == 10 vai para o fim do laco

	mov r0, r1  ; coloca o endereco base em r0
	ld r3, r0   ; resgata o iterador e coloca em r3
	addi 3      ; desloca ate a primeira posicao do vetor A
	add r0, r3  ; desloca ate a posicao do vetor com base na iteracao atual

	slr r3, r2  ; r3 = iterador * 2

	st r3, r0   ; salva r3 na memoria em A[i]

	addi 5
	addi 5      ; desloca na memoria ate o vetor B

	add r3, r2  ; r3 = (iterador * 2) + 1

	st r3, r0   ; salva r3 em B[i]

	addi 5
	addi 5      ; desloca na memoria ate o vetor R

	sub r3, r3  ; zera r3

	st r3, r0   ; salva r3 em R[i]

	ld r0, r1   ; recupera iterador da memoria
	addi 1      ; incrementa iterador em 1
	st r0, r1   ; salva iterador atualizado na memoria
	mov r0, r1  
	addi 1      ; r0 recebe endereco base + 1
	ld r3, r0   ; recupera enderaco do comeco do laco e coloca em r3

	jr r3       

fim_loop:

	add r1, r2   
	gpci 7      
	addi 7      ; calcula endereco do comeco do laco da soma
	st r0, r1   ; salva na memoria em endereco base + 1

	add r1, r2 
	addi 7
	addi 7
	addi 7
	addi 4      ; calcula endereco do fim do laco da soma
	st r0, r1   ; salva na memoria em endereco base + 2

	sub r1, r2
	mov r0, r1  ; deixa endereco base + 1 em r0
	sub r1, r2  ; r1 volta a conter o endereco base

	sub r3, r3
	st r3, r1   ; reinicia iterador

loopS:
	addi 1
	ld r3, r0   ; resgata endereco do fim do laco da memoria
	ld r0, r1   ; resgata iterador
	addi -5
	addi -5     ; calcula interacao atual
	brzr r0, r3 ;

	mov r0, r1  ; carrega endereco base de memoria em r0
	addi 3      ; desloca ate a primeira posicao do vetor A

	ld r3, r1   ; carrega iterador em r3
	add r0, r3 

	ld r2, r0   ; carrega A[i] em r2

	addi 5
	addi 5      ; desloca ate o vetor B

	ld r3, r0   ; carrega B[i] em r3

	add r2, r3  ; A[i] + B[i]

	addi 5
	addi 5      ; desloca ate o vetor R

	st r2, r0   ; R[i] = A[i] + B[i]

	ld r0, r1  
	addi 1	    ; incrementa iterador em 1
	st r0, r1   ; salva na memoria

	mov r0, r1 
	addi 1
	ld r3, r0   ; recupera o endereco do comeco do laco da memoria

	jr r3
	
fim_loopS:
	ji 0        ; fim do programa