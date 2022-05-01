/* -----------------------------------------------
* UNIVERSIDAD DEL VALLE DE GUATEMALA 
* Organización de computadoras y Assembler
* Ciclo 1 - 2022
* Diego Estuardo Lemus Lopez
* Eunice Mata
* Andres Estuardo Montoya Wilhelm
* Lab5.s
* Programa para el uso de una calculadora simple
 ----------------------------------------------- */
 /*---- DATA ----*/
.text
.align 2
.global main
.type main, %function

/*---- MAIN ----*/
main:
    stmfd sp!, {lr}

/*---- MENU DE SELECCION ----*/
Menu:
     @@ impresion de menu
    ldr r0,=menu            @@Carga el formato de menu en r0     
    bl puts                 @@Imprime el formato de r0
    ldr r0,=ingreso         @@Carga el formato de ingreso en r0
    bl puts                 @@Imprime el formato de r0

    @@ ingreso de opcion
    ldr r0,=opcion          @@Guarda el formato de entrada
    ldr r1,=comando         @@Guarda la entrada en el espacio de memoria "comando"
    bl scanf                @@Lee el valor ingresado

/*---- COMPARACION DE COMANDOS*/
comp:
    ldr r4,=comando         @@Carga la direccion de comando en r4
    ldrb r4,[r4]            @@Carga el valor de r4 en r4

    /*saltos dependiendo de caracter*/
    @@ identifica la opcion y hace un salto a la subrutina que corresponde
    @@ salto a suma
    cmp r4, #'+'        @@Comparacion con el signo +
    beq suma            @@Caso positivo, hace un salto de linea a la subrutina de suma

    @@ salto a resta
    cmpne r4, #'-'      @@Comparacion con el signo -
    beq resta           @@Caso positivo, hace un salto de linea a la subrutina de resta

    @@ salto a multiplicacion
    cmpne r4, #'*'      @@Comparacion con el signo *
    beq mult            @@Caso positivo, hace un salto de linea a la subrutina de multiplicacion

    @@ salto a division
    cmpne r4, #'/'      @@Comparacion con el signo /
    beq divi            @@Caso positivo, hace un salto de linea a la subrutina de division

    @@salto a Potencia
    cmpne r4, #'^'      @@Comparacion con el signo ^
    beq pot             @@Caso positivo, hace un salto de linea a la subrutina de potencia

    @@salto a Raiz
    cmpne r4, #'s'      @@Comparacion con la letra s
    beq raiz            @@Caso positivo, hace un salto de linea a la subrutina de raiz

    @@salto a salir
    cmpne r4, #'q'      @@Comparacion con la letra q
    beq Salir           @@Caso positivo, hace un salto de linea a la subrutina de salida

    @@salto a error incorrecto
    bne ErrorCar            @@Si no coincide, manda error

suma:
 /*---- INGRESO NUMEROS ---- */

    @@Operando 1
    ldr r0,=ingreso_op1     @@Guarda el formato en r0
    bl puts                 @@Imprime el formato de r0
    ldr r0, =entrada        @@Guarda el formato de entrada en r0
    ldr r1,=op1             @@Guarda el valor ingresado en op1
    bl scanf                @@Lee lo que se ingresa

    @@Operando 2
    ldr r0,=ingreso_op2     @@Guarda el formato en r0
    bl puts                 @@Imprime el formato de r0
    ldr r0, =entrada        @@Guarda el formato de entrada en r0
    ldr r1,=op2             @@Guarda el valor ingresado en op1
    bl scanf                @@Lee lo que se ingresa

 /*---- ERRORES ---- */

    @@Error
    cmp r0,#0               @@Comparacion de r0 con 0
    beq Error               @@Si es igual, salto a subrutina de error

 /*---- SUMA ---- */

    @@Calculo
    ldr r0,=op1             @@Carga de la direccion de memoria de op1 en r0
    ldr r2,[r0]             @@Carga del valor de r0 en r2
    ldr r0,=op2             @@Carga de la direccion de memoria de op2 en r0
    ldr r3,[r0]             @@Carga del valor de r0 a r3
    add r1,r2,r3            @@Suma r2 y r3 y lo guarda en r1
    ldr r0,=result          @@Guarda el formato de resultado en r0
    bl printf               @@Imprime el formato de r0
    b Menu                  @@Hace un salto a la subrutina de menu

resta:
 /*---- INGRESO NUMEROS ---- */

    @@Operando 1
    ldr r0,=ingreso_op1     @@Guarda el formato en r0
    bl puts                 @@Imprime el formato de r0
    ldr r0, =entrada        @@Guarda el formato de entrada en r0
    ldr r1,=op1             @@Guarda el valor ingresado en op1
    bl scanf                @@Lee lo que se ingresa

    @@Operando 2
    ldr r0,=ingreso_op2     @@Guarda el formato en r0
    bl puts                 @@Imprime el formato de r0
    ldr r0, =entrada        @@Guarda el formato de entrada en r0
    ldr r1,=op2             @@Guarda el valor ingresado en op1
    bl scanf                @@Lee lo que se ingresa

 /*---- ERRORES ---- */

    @@Error
    cmp r0,#0               @@Comparacion de r0 con 0
    beq Error               @@Si es igual, salto a subrutina de error

 /*---- RESTA ---- */

    @@Calculo
    ldr r0,=op1             @@Carga de la direccion de memoria de op1 en r0
    ldr r2,[r0]             @@Carga del valor de r0 en r2
    ldr r0,=op2             @@Carga de la direccion de memoria de op2 en r0
    ldr r3,[r0]             @@Carga del valor de r0 a r3
    sub r1,r2,r3            @@Resta r3 de r2 y lo guarda en r1
    ldr r0,=result          @@Guarda el formato de resultado en r0
    bl printf               @@Imprime el formato de r0
    b Menu                  @@Hace un salto a la subrutina de menu

mult:
 /*---- INGRESO NUMEROS ---- */

    @@Operando 1
    ldr r0,=ingreso_op1     @@Guarda el formato en r0
    bl puts                 @@Imprime el formato de r0
    ldr r0, =entrada        @@Guarda el formato de entrada en r0
    ldr r1,=op1             @@Guarda el valor ingresado en op1
    bl scanf                @@Lee lo que se ingresa

    @@Operando 2
    ldr r0,=ingreso_op2     @@Guarda el formato en r0
    bl puts                 @@Imprime el formato de r0
    ldr r0, =entrada        @@Guarda el formato de entrada en r0
    ldr r1,=op2             @@Guarda el valor ingresado en op1
    bl scanf                @@Lee lo que se ingresa

 /*---- ERRORES ---- */

    @@Error
    cmp r0,#0               @@Comparacion de r0 con 0
    beq Error               @@Si es igual, salto a subrutina de error

 /*---- MULTIPLICACION ---- */   
    
    @@Calculo
    ldr r0,=op1             @@Carga de la direccion de memoria de op1 en r0
    ldr r2,[r0]             @@Carga del valor de r0 en r2
    ldr r0,=op2             @@Carga de la direccion de memoria de op2 en r0
    ldr r3,[r0]             @@Carga del valor de r0 a r3
    mul r1,r2,r3            @@Multiplica r2 y r3 y lo guarda en r1
    ldr r0,=result          @@Guarda el formato de resultado en r0
    bl printf               @@Imprime el formato de r0
    b Menu                  @@Hace un salto a la subrutina de menu

divi:
 /*---- INGRESO NUMEROS ---- */

    @@Operando 1
    ldr r0,=ingreso_op1     @@Guarda el formato en r0
    bl puts                 @@Imprime el formato de r0
    ldr r0, =entrada        @@Guarda el formato de entrada en r0
    ldr r1,=op1             @@Guarda el valor ingresado en op1
    bl scanf                @@Lee lo que se ingresa

    @@Operando 2
    ldr r0,=ingreso_op2     @@Guarda el formato en r0
    bl puts                 @@Imprime el formato de r0
    ldr r0, =entrada        @@Guarda el formato de entrada en r0
    ldr r1,=op2             @@Guarda el valor ingresado en op1
    bl scanf                @@Lee lo que se ingresa

 /*---- ERRORES ---- */

    @@Error
    cmp r0,#0               @@Comparacion de r0 con 0
    beq Error               @@Si es igual, salto a subrutina de error

 /*---- DIVISION ---- */   
    
    @@Asignacion
    ldr r0,=op1             @@Carga de la direccion de memoria de op1 en r0
    ldr r2,[r0]             @@Carga del valor de r0 en r2
    ldr r0,=op2             @@Carga de la direccion de memoria de op2 en r0
    ldr r3,[r0]             @@Carga del valor de r0 a r3
    @@Error matematico
    cmp r3,#0               @@Compara el divisor con 0 para comprobar si es valido
    beq ErrorMath           @@Si es igual a 0, manda a la subrutina de mathError
    @@Contador de ciclo
    mov r9,#0               @@Inicializa el contador de r9 en 0

 @@Ciclo de division
cicloDiv:
    add r9,#1           @@Contador aumenta en 1
    sub r2,r3           @@Resta el divisor del dividendo
    cmp r2,#0           @@comparacion con 0
    bgt cicloDiv        @@Si es mayor a 0, vuelve al ciclo
    mov r1,r9               @@Asigna el valor de r9 a r1
    ldr r0,=result          @@Carga el formato a r0
    bl printf               @@Imprime el formato
    b Menu                  @@Salta a la subrutina de menu
pot:
 /*---- INGRESO NUMEROS ---- */

    @@Operando 1
    ldr r0,=ingreso_op1     @@Guarda el formato en r0
    bl puts                 @@Imprime el formato de r0
    ldr r0, =entrada        @@Guarda el formato de entrada en r0
    ldr r1,=op1             @@Guarda el valor ingresado en op1
    bl scanf                @@Lee lo que se ingresa

    @@Operando 2
    ldr r0,=ingreso_op2     @@Guarda el formato en r0
    bl puts                 @@Imprime el formato de r0
    ldr r0, =entrada        @@Guarda el formato de entrada en r0
    ldr r1,=op2             @@Guarda el valor ingresado en op1
    bl scanf                @@Lee lo que se ingresa

 /*---- ERRORES ---- */

    @@Error
    cmp r0,#0               @@Comparacion de r0 con 0
    beq Error               @@Si es igual, salto a subrutina de error

/*---- POTENCIA ---- */
    @@Asignacion
    ldr r0,=op1             @@Carga de la direccion de memoria de op1 en r0
    ldr r2,[r0]             @@Carga del valor de r0 en r2
    ldr r0,=op2             @@Carga de la direccion de memoria de op2 en r0
    ldr r3,[r0]             @@Carga del valor de r0 a r3
    @@Contador de ciclo
    mov r9,#0               @@Inicializacion del contador r9
    mov r4,#1               @@Inicializacion del acumulador r4

@Ciclo de potencia
cicloPotencia:
    @@calculo
    add r9,#1               @@Aumento en 1 del contador r9
    mul r4,r2               @@Multiplicacion de la base por ella misma guardandola en r4
    cmp r9,r3               @@Comparacion del contador r9 con el exponente r3
    bne cicloPotencia       @@Si no es igual, salto a la subrutina de ciclo de potencia
    @@imprimir
    mov r1,r4               @@Asigna el valor de r4 a r1
    ldr r0,=result          @@Carga el formato a r0
    bl printf               @@Imprime el formato
    b Menu                  @@Salta a la subrutina de menu
raiz:
 /*---- INGRESO NUMEROS ---- */

    @@Operando 1
    ldr r0,=ingreso_op1     @@Guarda el formato en r0
    bl puts                 @@Imprime el formato de r0
    ldr r0, =entrada        @@Guarda el formato de entrada en r0
    ldr r1,=op1             @@Guarda el valor ingresado en op1
    bl scanf                @@Lee lo que se ingresa
    @@Asignacion
    ldr r0,=op1             @@Asigna el espacio de memoria de op1 en r0
    ldr r2,[r0]             @@Carga el valor de op1 en r2
    @@Contador de ciclo
    mov r9,#0               @@Le coloca 0 a r9

@@Ciclo de la raiz
cicloRaiz:   
    add r9,#1               @@Aumenta el contador de r9 en 1
    mul r10,r9,r9           @@Multiplica el contenido de r9 por r9 y lo guarda en r10
    cmp r10,r2              @@Compara el contenido de r10 con el de r2
    beq imprRaiz            @@Si es igual, imprime una raiz exacta
    blt cicloRaiz           @@Si es menor, vuelve al ciclo
    bgt imprRaiz2           @@Si es mayor imprime una raiz inexacta

@@Raiz exacta
imprRaiz:
    mov r1,r9               @@Mueve el contenido de r9 a r1
    ldr r0,=result          @@Carga el mensaje de resultado en r0
    bl printf               @@Imprime el resultado
    b Menu                  @@Regresa al menu principal

@@Raiz inexacta
imprRaiz2:
    mov r1,r9               @@Mueve el contenido de r9 a r1
    sub r1,#1               @@Resta 1 a r1
    ldr r0,=result          @@Carga el mensaje de resultado en r0
    bl printf               @@Imprime el resultado
    b Menu                  @@Regresa al menu principal

ErrorCar:
    ldr r0,=error           @@Carga el mensaje de error de caracter en r0
    bl puts                 @@Imprime el mensaje de error
    bl getchar
    b Menu                  @@Regresa al menu principal

Error:
    ldr r0,=error2          @@Carga el mensaje de error generico en r0
    bl puts                 @@Imprime el mensaje de error
    bl getchar
    b Menu                  @@Regresa al menu principal

ErrorMath:
    ldr r0,=error3          @@Carga el mensaje de error matematico en r0
    bl puts                 @@Imprime el mensaje de error
    bl getchar
    b Menu                  @@Regresa al menu principal

Salir:
    ldr r0,=salida          @@Carga el mensaje de salida
    bl puts                 @@Imprime el mensaje de salida  
    ldmfd sp!, {lr}	        @@Cierre del stack
	bx lr
    

/*---- DATA ----*/
.data
.align 2

/*---- MEMORIA ----*/
comando: .byte 0
op1: .word 0
op2: .word 0

/*---- MENSAJES ----*/
error: .asciz "********\nIngreso de caracter incorrecto\n********\n\n"
error2: .asciz "********\nError\n********\n\n"
error3: .asciz "********\nError matematico\n********\n\n"
result: .asciz "----->\nEl resultado es: %d\n----->\n\n"
menu: .asciz "Calculadora\n+. SUMA\n-. RESTA\n*. MULTIPLICACION\n/. DIVISION\n^. POTENCIA\ns. RAIZ\nq. Salir"
salida: .asciz "Hasta pronto!"

/*---- SOLICITUDES ----*/
ingreso: .asciz "Ingrese un comando: "
ingreso_op1: .asciz "Ingrese el primer operando: "
ingreso_op2: .asciz "Ingrese el segundo operando: "

/*---- FORMATOS ----*/
opcion: .asciz " %c"
entrada: .asciz " %d"




