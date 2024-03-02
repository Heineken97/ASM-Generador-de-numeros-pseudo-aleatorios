Generador Pseudo-Aleatorio con LFSR (Linear-Feedback Shift Register)

Este programa implementa un generador de números pseudo-aleatorios utilizando un LFSR (Linear-Feedback Shift Register) con el polinomio x^8 + x^6 + x^5 + x^4 + 1. El generador produce una secuencia de 100 números aleatorios y los almacena en memoria.

Funcionamiento
Inicialización de la Semilla:

Se inicia con un valor semilla de 0b01011010 (ASCII para 'Z'). Este valor se almacena en la posición de memoria 0x100.

Se inicia una constante binaria que indica la posicion del bit que usaremos para la mascara

Generación de Números Aleatorios:

El programa entra en un bucle de generación de números aleatorios (lfsr_loop) que se repite 100 veces. En cada iteración del bucle:

a. Se cargan los bits de las posiciones 8, 6, 5 y 4 del valor semilla en los registros t0, t1, t2 y t3 respectivamente.

b. Se realiza la mascara entre las constante y los valores obtenidos del corrimiento para
obtener un solo bit

c. Se realiza una serie de operaciones XOR para obtener el siguiente bit aleatorio, siguiendo el polinomio LFSR.

d. El bit resultante del XOR se coloca en el bit más significativo (MSB) del registro t4.

e. Se realiza una rotación a la derecha del bit para eliminar el ultimo bit

f. Se realiza una rotacion a la izquierda para poner el obtenido de los XOR

g. Se realiza un or para juntar los valores obtenidos despues del corrimiento final

h. El nuevo valor del LFSR se almacena en la posición de memoria actual, en el byte word 0, que comienza en 0x100 y se incrementa en 4 bytes en cada iteración.

Fin del Programa:

Una vez se han generado y almacenado los 100 números aleatorios, el programa llega al final y termina su ejecución.

Uso del Programa
Cargar el programa en un simulador RISC-V.

Ejecutar el programa para generar la secuencia de números aleatorios.

Se puede cambiar la semilla li a0, 0b01011010  para probar otros valores

Los números aleatorios generados se almacenarán consecutivamente en memoria, comenzando desde la posición 0x100.

Puede verificar la secuencia de números aleatorios observando el contenido de la memoria en las direcciones 0x100, 0x104, 0x108, ... hasta 0x290.

El resultado final es: en el wordbyte 0b01111111 del registro 0x00000290 que contiene 0b00000000000000000000000001111111