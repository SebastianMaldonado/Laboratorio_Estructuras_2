void setup(){
  Sobrante(12345);
}

void draw(){
}



/*
-----------------------------------------|Suma|-----------------------------------------
*/
Nodo Sumar(Nodo temp){
    Nodo res = new Nodo(0,1);
    int Pasar = 0;
    Nodo P = temp;
    
    while (temp.next != null){
    //Sumar los valores del Nodo Contenedor
    int sumatoria = Pasar;
    for (int i = 0; i <= temp.cont; i++){
      sumatoria = sumatoria + temp.datos[i];
    }
    
    //Guardar resultado en Nodo Resultante
    res.dato = sumatoria % 10;
    Pasar = sumatoria / 10;
    
    res = res.next;
    temp = temp.next;
  }
  
  Sobrante(Pasar);
  
  
  
  
  return res;
}


void Sobrante (int Pasar, Nodo res){
  if ((Pasar/10) > 0){
    //Se crea nuevo nodo 
    Nodo P = res;
    int contador = 10;
    int num = ((Pasar % contador) / (contador / 10));
    while (num != 0){
      print(num + "  " + contador +"  ");
      Nodo Nuevo = new Nodo (num, 1);
      P.next = Nuevo;
      P = P.next;
      
      contador = contador * 10;
      num = ((Pasar % contador) / (contador / 10));
    }
  }
}


/*
-----------------------------------------|Resta|-----------------------------------------
*/
Nodo Restar(Nodo temp){
  Nodo res = new Nodo(0,1);
  return res;
}

/*
-----------------------------------------|Multiplicación|-----------------------------------------
*/
Nodo Multiplicar(Nodo temp){
  Nodo res = new Nodo(0,1);
  return res;
}

/*
-----------------------------------------|División|-----------------------------------------
*/
Nodo Dividir(Nodo temp){
  Nodo res = new Nodo(0,1);
  return res;
}

public class Nodo{
    private int[] datos;
    private int dato;
    private int cont;
    private Nodo next;

    public Nodo(int dato, int contador){
      this.dato = dato;
      this.cont = contador;
      this.next = null;
    }
    
    void InsertarDato (){
      this.datos[this.cont] = this.dato;
    }
}
