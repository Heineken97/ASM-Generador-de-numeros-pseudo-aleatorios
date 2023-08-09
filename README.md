Generador Pseudo-Aleatorio con LFSR (Linear-Feedback Shift Register)

Este programa implementa un generador de números pseudo-aleatorios utilizando un LFSR (Linear-Feedback Shift Register) con el polinomio x^8 + x^6 + x^5 + x^4 + 1. El generador produce una secuencia de 100 números aleatorios y los almacena en memoria.

Funcionamiento
Inicialización de la Semilla:

Se inicia con un valor semilla de 0b01011010 (ASCII para 'Z'). Este valor se almacena en la posición de memoria 0x100.

Generación de Números Aleatorios:

El programa entra en un bucle de generación de números aleatorios (lfsr_loop) que se repite 100 veces (0x64 en hexadecimal). En cada iteración del bucle:

a. Se cargan los bits de las posiciones 8, 6, 5 y 4 del valor semilla en los registros t0, t1, t2 y t3 respectivamente.

b. Se realiza una serie de operaciones XOR para obtener el siguiente bit aleatorio, siguiendo el polinomio LFSR.

c. El bit resultante del XOR se coloca en el bit más significativo (MSB) del registro t4.

d. Se realiza una rotación a la izquierda del bit resultante y se coloca en el MSB del registro t4.

e. Se descarta el bit menos significativo (LSB) del valor semilla y se almacena el resultado en el registro t5.

f. Se suma el valor de t5 con el valor de t4 para obtener el nuevo valor del LFSR.

g. El nuevo valor del LFSR se almacena en la posición de memoria actual, que comienza en 0x100 y se incrementa en 4 bytes en cada iteración.

Fin del Programa:

Una vez se han generado y almacenado los 100 números aleatorios, el programa llega al final y termina su ejecución.

Uso del Programa
Cargar el programa en un simulador RISC-V.

Ejecutar el programa para generar la secuencia de números aleatorios.

Se puede cambiar la semilla li a0, 0b01011010  para probar otros valores

Los números aleatorios generados se almacenarán consecutivamente en memoria, comenzando desde la posición 0x100.

Puede verificar la secuencia de números aleatorios observando el contenido de la memoria en las direcciones 0x100, 0x104, 0x108, ... hasta 0x290.