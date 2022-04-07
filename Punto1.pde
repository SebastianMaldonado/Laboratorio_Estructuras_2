void setup(){

}

void draw(){
}



/*
-----------------------------------------|Suma|-----------------------------------------
*/
Nodo Sumar(Nodo temp){
    Nodo res = new Nodo(0,1);
    int Pasar = 0;
    
    while (temp.next != null){
    //Sumar los valores del Nodo Contenedor
    int sumatoria = Pasar;
    for (int i = 0; i <= temp.cont; i++){
      sumatoria = sumatoria + temp.datos[i];
    }
  
    //Guardar resultado en Nodo Resultante
    res.dato = sumatoria % 10;
    Pasar = sumatoria / 10;
  }
  
  if ((Pasar/10) > 0){
    //Se crea nuevo nodo
  }
  
  
  
  return res;
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
