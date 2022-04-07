# Laboratorio_Estructuras_2

## Razonamiento del punto 1
Dado un conjunto de números por el usuario, cuya única condición es qu eno exceda los 20 dígitos, decidimos por combinar listas y vectores a razón de tener una estructura más organizada que nos permita ingresar ordenamente a cada nodo y espacio vector. En el proceso, nos dimos cuenta que el uso de la primitiva Long para definir la variable número, no era viable, ya qué su limite son 19 dígitos, a si mismo, implementar la clase BigInteger y sus métodos para operar números grandes.

A partir de esto, con el lenguaje de programación en Java y processing, utilizamos métodos como KeyPressed que permiten leer por teclado los números ingresados, de esta forma se evitará que el usuario ingrese espacios y carácteres, así mismo, a medida que una tecla es presionada, primero, con `ENTER` se revisa si el valor es positivo o negativo y se guarda en un vector en el PTR de la lista creada con valores de `"1"` para positivos y `"-1"` para negativos, consecutivamente, cada número presionado se va guardando en una lista que contiene un vector.

Una vez guardado cada dígito, se procede a hacer la operación de suma o multiplicación, en este caso, extraemos el numero como String y poderlo pasar como parametró de BigIntege. Esta clase nos facilita el trabajo ya que tiene métodos como `.add()` y `.multiply()` para realizar las operaciones.

Una vez terminamos de operar, descomponemos el resultado y lo pasamos a una lista final para imprimir el resultado al usuario


## Razonamiento del punto 2
Teniendo en cuenta la base de datos y su oragnizacio _colegio, gimnasio, bar, tienda y parque_, se crean variables boleanas con los nombres `car#`, seguidamente se instancia un vector que contendra los barrios que mejor coinciden y por último, se crea una lista temporal con su PTR inicializado en `"-"` y el resto nodos se inicializan en `0`.

Con el método `LeerArchivo()`, se recorre el archivo `data.txt` y se extrae el nombre del barrio y los valores entre 0 y 1. Como resultado, el método generará un nuevo archivo llamado temp.txt con el nivel de coincidencia de la búsqueda.

En la "Asignación de Coincidencia", introducimos el nombre del barrio y sus características como los parámetros

```
cond1: Colegio, cond2: Gimnasio, cond3: Bar, cond4: Tienda, cond5: Parque

```
Pasandole a la variable `punt`del método `AsignarPunt()`el puntaje de coincidencia con el  barrio.

El método `MostrarCoincidencias()`, permite la lectura del archivo `temp.txt` con los niveles de coincidencia de la búsqueda. De está forma, se peude seleccionar los barrios con mayor nivel de coincidencia con la búsqueda y se escogerá por mayor nivel de coincidencia y orden de la lista

### Realizado por
- Cuellar Ballesteros Luis Ángel
- Gómez Rosales Laura Sofía
- Maldonado Gastelbondo Sebastián
