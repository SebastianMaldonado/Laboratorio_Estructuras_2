# Laboratorio_Estructuras_2

## Razonamiento del punto 1
Dado un conjunto de números por el usuario, cuya única condición es qu eno exceda los 20 dígitos, decidimos por combinar listas y vectores a razón de tener una estructura más organizada que nos permita ingresar ordenamente a cada nodo y espacio vector. En el proceso, nos dimos cuenta que el uso de la primitiva Long para definir la variable número, no era viable, ya qué su limite son 19 dígitos, a si mismo, implementar la clase BigInteger y sus métodos para operar números grandes.

A partir de esto, con el lenguaje de programación en Java y processing, utilizamos métodos como KeyPressed que permiten leer por teclado los números ingresados, de esta forma se evitará que el usuario ingrese espacios y carácteres, así mismo, a medida que una tecla es presionada, primero, con `ENTER` se revisa si el valor es positivo o negativo y se guarda en un vector en el PTR de la lista creada con valores de `"1"` para positivos y `"-1"` para negativos, consecutivamente, cada número presionado se va guardando en una lista que contiene un vector.

Una vez guardado cada dígito, se procede a hacer la operación de suma o multiplicación, en este caso, extraemos el numero como String y poderlo pasar como parametró de BigIntege. Esta clase nos facilita el trabajo ya que tiene métodos como `.add()` y `.multiply()` para realizar las operaciones.

Una vez terminamos de operar, descomponemos el resultado y lo pasamos a una lista final para imprimir el resultado al usuario
