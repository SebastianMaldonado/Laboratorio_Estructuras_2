import java.math.BigInteger;

int cant = 3, cont = 1;
boolean nueva_lista = true;
Nodo PTR = new Nodo (1, cant);
Nodo Nuevo = PTR;

void setup(){
  Nodo res = new Nodo (1,3);
  res.datos[1] = 1;
  res.datos[2] = 1;
  Nodo Q = res;
  
  for (int i = 1; i <= 1; i++){
    Nodo P = new Nodo (1,3);
    P.datos[1] = 1;
    P.datos[2] = 2;
    Q.next = P;
    Q = Q.next;
  }
  
  println(Extraer_num(res, 2));
  
  
  Sumar(res);
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
  BigInteger Sumatoria = new BigInteger ("0");
  
  for (int i = 1; i <= temp.cont; i++){
    Sumatoria = Sumatoria.add(Extraer_num (temp, i));  
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

void Transferir (Nodo PTR, int cont){
  Nodo P = PTR;
  while (P.next != null){
    P.datos[cont] = P.dato;
    P = P.next;
  }
}


String num = "";
void keyPressed(){
  if (key == ENTER){
    nueva_lista = true;
    BigInteger numero = new BigInteger (num);
    println(numero + "  " + cont);
    Descomponer(numero, PTR);
    Transferir(PTR, cont);
    Sumar(PTR);
    cont = cont + 1;
    println(PTR.datos[2]);
  
  } else if ((key == '1') || (key == '2') || (key == '3')
  || (key == '4') || (key == '5') || (key == '6')
  || (key == '7') || (key == '8') || (key == '9')
  || (key == '0')){
    if (nueva_lista){
      nueva_lista = false;
    }
    num = num + key;
  } else if ((key == '-') && (nueva_lista)) { 
    nueva_lista = false;
    num = num + key;
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
