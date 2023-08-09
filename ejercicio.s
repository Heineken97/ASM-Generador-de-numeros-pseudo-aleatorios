main:
    # Paso 1. Se inicia con un valor semilla
    li a0, 0b01011010 
    # colocar semilla en la posicion de memoria 0x100
    li a1, 0x100 
    # Almacenamos la semilla en la dirección de memoria
    sw a0, 0(a1)    
    # Contador para obtener los 100 números aleatorios
    li a2, 0x64  
lfsr_loop:
    # Cargamos LFSR: x^8 +x^6 + x^5 + x^4 + 1
    srli t0, a0, 0x0    #Posicion 8
    srli t1, a0, 0x2    #Posicion 6
    srli t2, a0, 0x3    #Posicion 5
    srli t3, a0, 0x4    #Posicion 4
    # Paso 2.Pasa por una serie de compuertas XOR, que toman los bits de las posiciones del polinomio LFSR.
    xor t4, t1, t0 
    xor t5, t4, t2
    xor t6, t5, t3 
    andi t4, t6, 0x1    #Obtener solo el bit resultante del XOR
    # Paso 3.Se hace rotaciones
    slli t4, t4, 0x8    # Desplazamos el resultado a la izquierda para colocar en el MSB
    srli t5, a0, 0x1    # Desplazamos el resultado a la derecha para descartar LSB
    # Paso 4. Se actualizan los valores del registro
    add a0, t5, t4      # Sumamos dato con MSB y LSB  
update:   
    # Paso 4.Se actualizan los valores del registro y se realiza de nuevo el paso 1
    addi a1, a1, 0x4    # Incrementamos la dirección para almacenar el siguiente 
    sw a0, 0(a1)        # Almacenamos el nuevo dato en la posición actual 
    addi a2, a2, -0x1   # Decrementamos el contador de números aleatorios
    bnez a2, lfsr_loop  # Saltamos al loop si no hemos alcanzado los 100 números aleatorios
end:
    # Fin del programa



