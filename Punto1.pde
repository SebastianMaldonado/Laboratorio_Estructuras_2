import java.math.BigInteger;
boolean nueva_lista = true;
int cont = 1;
int cant = 3;
Nodo PTR = new Nodo (1, cant);
Nodo Nuevo = PTR;

void setup(){
  Nodo res = new Nodo (1,1);
  res.datos[2] = 1;
  res.cont = 2;
  Nodo Q = res;
  
  for (int i = 1; i <= 1; i++){
    Nodo P = new Nodo (6,1);
    P.datos[2] = 7;
    Q.next = P;
    Q = Q.next;
  }
  
  Multiplicar(res);
}


void draw(){
}


BigInteger Extraer_num(Nodo res, int lista){
  //Leer Vector
  String num = "" + (res.datos[lista] * (res.next).datos[lista]);
  res = res.next;
  while (res.next != null){
    num = num + res.datos[lista];
    res = res.next;
  }
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
  int cont = 1;
  BigInteger Sumatoria = new BigInteger ("0");
  
  for (int i = 1; i <= temp.cont; i++){
    Sumatoria = Sumatoria.add(Extraer_num (temp, i));  
    cont = cont + 1;
  }
  
  println(Sumatoria+"  " + "Suma");
  
  Nodo res = new Nodo(1, 0);
  if (cont > 20){
    BigInteger i0 = new BigInteger ("0");
    Descomponer (i0, res);
  } else {
    Descomponer (Sumatoria, res);
  }
  
  return res;
}


void Descomponer (BigInteger numero, Nodo res){
  BigInteger i10 = new BigInteger ("10");
  BigInteger i0 = new BigInteger ("10");
  BigInteger contador = new BigInteger ("10");
  
  
  if (numero.divide(i10).compareTo(i0) == 1){
    //Se crea nuevo nodo 
    Nodo P = res;
    int cont = 0;
    int num = ((numero.mod(contador)).divide((contador.divide(i10)))).intValueExact();
    while (num != 0){
      cont = cont + 1;
      Nodo Nuevo = new Nodo (num, 1);
      P.next = Nuevo;
      P = P.next;
      
      contador = contador.multiply(i10);
      num = ((numero.mod(contador)).divide((contador.divide(i10)))).intValueExact();
    }
  }
}


/*
-----------------------------------------|Multiplicación|-----------------------------------------
*/
Nodo Multiplicar(Nodo temp){
  int cont = 1;
  BigInteger Sumatoria = new BigInteger ("1");
  
  for (int i = 1; i <= temp.cont; i++){
    Sumatoria = Sumatoria.multiply(Extraer_num (temp, i));  
    cont = cont + 1;
  }
  
  println(Sumatoria+"  " + "Multiplicacion");
  
  Nodo res = new Nodo(1, 0);
  if (cont > 20){
    BigInteger i0 = new BigInteger ("0");
    Descomponer (i0, res);
  } else {
    Descomponer (Sumatoria, res);
  }
  
  return res;
}



void keyPressed(){
  if (key == ENTER){
    nueva_lista = true;
    println("Numero ingresado" + Extraer_num(Nuevo, cont));
    Nuevo = PTR;
    cont = cont + 1;
    if (cont == 3){
      Sumar(PTR);
    }
  
  } else if ((key == '1') || (key == '2') || (key == '3')
  || (key == '4') || (key == '5') || (key == '6')
  || (key == '7') || (key == '8') || (key == '9')
  || (key == '0')){
    if (nueva_lista){
      nueva_lista = false;
      AgregarNodo (Nuevo, 1, cont, cant);
    } 
    AgregarNodo (Nuevo, int(key) - 48, cont, cant);
    println(Nuevo.datos[1]);
    
  } else if ((key == '-') && (nueva_lista)) { 
    nueva_lista = false;
    AgregarNodo (Nuevo, -1, cont, cant);
  }
}


void AgregarNodo (Nodo temp, int dato, int cont, int cant){
  if ((cont == 1) || (temp.next == null)){
    Nodo P = new Nodo (1 ,cant);
    P.Insertar(dato, cont);
    println(P.datos[cont]);
    temp.next = P;
    temp = temp.next;
  } else {
    temp.Insertar(dato, cont);
    println(temp.datos[cont]);
    temp = temp.next;
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
