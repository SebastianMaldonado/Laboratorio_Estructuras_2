import java.math.BigInteger;

int cant = 3, cont = 1;
boolean nueva_lista = true;
String opcion = "";
Nodo PTR = new Nodo (1, cant);
Nodo PTR1 = new Nodo (1, cant);
Nodo PTR2 = new Nodo (1, cant);
Nodo Nuevo = PTR;

void setup(){
  Nodo res = new Nodo (1,3);
  res.datos[1] = 1;
  res.datos[2] = 1;
  Nodo Q = res;
  
  println("Qué operación desea hacer, + para sumar, * para multiplicar");
  
  for (int i = 1; i <= 15; i++){
    Nodo P = new Nodo (1,3);
    P.datos[1] = 1;
    P.datos[2] = 2;
    Q.next = P;
    Q = Q.next;
  }
}


void draw(){
}


BigInteger Extraer_num(Nodo res, int lista){
  //Leer Vector
  Nodo P = res.next;
  String num = "";
  
  while (P.next != null){
    num = P.datos[lista] + num;
    P = P.next;
  }
  num = (res.datos[lista] * P.datos[lista]) + num;

  BigInteger numero = new BigInteger (num);
  return numero;
}

int potencia (int i, int j){
  int num = 1;
  for (int k = 1; k < j; k++){
    num = num * i;
  }
  return num;
}




/*
-----------------------------------------|Suma|-----------------------------------------
*/
Nodo Sumar(Nodo temp){  
  BigInteger Sumatoria = new BigInteger ("0");
  
  for (int i = 1; i <= temp.cont; i++){
    Sumatoria = Sumatoria.add(Extraer_num (temp, i));  
    println("Suma: " + Extraer_num (temp, i));
  }
  
  println(Sumatoria+"  " + "Suma");
  
  Nodo res = new Nodo(1, 0);
  Descomponer (Sumatoria, res);
  
  return res;
}

/*
-----------------------------------------|Multiplicación|-----------------------------------------
*/
Nodo Multiplicar(Nodo temp){
  BigInteger Sumatoria = new BigInteger ("1");
  
  for (int i = 1; i <= temp.cont; i++){
    Sumatoria = Sumatoria.multiply(Extraer_num (temp, i));  
  }
  
  println(Sumatoria + "  " + "Multiplicacion");
  
  Nodo res = new Nodo(0, 1);
  Descomponer (Sumatoria, res);
  
  return res;
}


Nodo Descomponer (BigInteger numero, Nodo res){
  BigInteger i10 = new BigInteger ("10");
  BigInteger i0 = new BigInteger ("10");
  BigInteger contador = new BigInteger ("10");
  Nodo P = res;
  
  
  if (numero.divide(i10).compareTo(i0) == 1) {
    //Se crea nuevo nodo 
    P = res;
    int cont = 0;
    int num = ((numero.mod(contador)).divide((contador.divide(i10)))).intValueExact();
    while (num != 0){
      cont = cont + 1;
      Nodo Nuevo = new Nodo (num, 3);
      P.next = Nuevo;
      P = P.next;
      
      contador = contador.multiply(i10);
      num = ((numero.mod(contador)).divide((contador.divide(i10)))).intValueExact();
    }
    
  }
  
  return P;
}

void Transferir (Nodo PTR, int cont){
  Nodo P = PTR;
  println("Primer dato: " + (PTR.next).dato);
  while (P != null){
    println(P.dato);
    P.datos[cont] = P.dato;
    P = P.next;
  }
}


String num = "";
void keyPressed(){
  if ((key == '+') || (key == '*')){
    opcion = "" + key;
    
    if (opcion.equals("+")) {
      if (PTR1.next != null){
        Sumar(PTR1);
      } else {
        println("Por favor, ingrese un número");
      }
    } else if (opcion.equals("*")) {
      if (PTR1.next != null){
        Multiplicar(PTR1);
      } else {
        println("Por favor, ingrese un número");
      }
    }
  }
  
  if (key == ENTER){
    nueva_lista = true;
    BigInteger numero = new BigInteger (num);
    Descomponer(numero, PTR1);
    Transferir(PTR1, cont);
    println(Extraer_num(PTR1, 1) + "  " + 1);
    println(Extraer_num(PTR1, 2) + "  " + 2);
    println(Extraer_num(PTR1, 3) + "  " + 3);
    num = "";
    if (cont > 3){
      Sumar(PTR1);
      Multiplicar(PTR1);
    }
    cont = cont + 1;
  
  } else if ((key == '1') || (key == '2') || (key == '3')
  || (key == '4') || (key == '5') || (key == '6')
  || (key == '7') || (key == '8') || (key == '9')
  || (key == '0')){
    if (nueva_lista){
      nueva_lista = false;
      PTR1.dato = 1;
    }
    num = num + key;
  } else if ((key == '-') && (nueva_lista)) { 
      nueva_lista = false;
      PTR1.dato = -1;
  }
}




Nodo AgregarNodo (Nodo temp, int dato, int cont, int cant){
  if ((cont == 1) || (temp.next == null)){
    Nodo P = new Nodo (1 ,cant);
    P.datos[cont] = dato;
    temp.next = P;
    temp = temp.next;
    return temp;
  } else {
    temp.datos[cont] = dato;
    temp = temp.next;
    return temp;
  }
}




public class Nodo{
    private int[] datos = new int[20];
    private int dato;
    private int cont;
    private Nodo next;

    public Nodo(int dato, int contador){
      this.dato = dato;
      this.cont = contador;
      this.next = null;
    }
    
    void Insertar (int dato, int contador){
      this.datos[contador] = dato;
    }
}
