main:
    # Inicia con valor semilla Z en ASCII
    li a0, 0b01011010 
    # Inicia constante para mascara
    li a3, 0b00000001
    # Coloca la semilla en la posicion de memoria 0x100
    li a1, 0x00000100 
    # Coloca valor semilla en posicion de memoria de a1
    sb a0, 0(a1)    
    # Inicia contador de 100 iteraciones
    li a2, 100 
lfsr_loop:
    # Carga LFSR: x^8 +x^6 + x^5 + x^4 + 1
    srli t0, a0, 0    #Posicion 8
    and t0, t0, a3   #Obtener el bit menos significativo usando mascara
    srli t1, a0, 2    #Posicion 6
    and t1, t1, a3   #Obtener el bit menos significativo usando mascara
    srli t2, a0, 3    #Posicion 5
    and t2, t2, a3   #Obtener el bit menos significativo usando mascara
    srli t3, a0, 4    #Posicion 4
    and t3, t3, a3   #Obtener el bit menos significativo usando mascara
    # Compuertas XOR, tomando los bits de las posiciones del polinomio.
    xor t4, t1, t0 
    xor t5, t4, t2
    xor t6, t5, t3  
    # Rotaciones que generan un hueco
    srli t0, a0, 1    # Desplazamos el resultado a la derecha eliminando bit mas a la derecha
    slli t1, t6, 7    # Desplazamos el resultado a la izquierda para colocar en el octavo bit 
    or a0, t1, t0     # Relleno de hueco el resultado de los XOR 
    # Actualiza los valores del registro y se realiza de nuevo el paso 1
    addi a1, a1, 0x4        # Incrementa dirección de almacenamiento
    sb a0, 0(a1)          # Almacena dato en la nueva posicion 
    addi a2, a2, -1       # Decrementamos el contador de iteraciones
    bnez a2, lfsr_loop    # Si alcanza el 100 iteraciones termina
end:
    # Fin del programa



