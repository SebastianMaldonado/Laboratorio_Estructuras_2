//car1 <- colegio
//car2 <- gimnasio
//car3 <- bar
//car4 <- tienda
//car5 <- parque
boolean car1, car2, car3, car4, car5;
String Barrios_S[][] = new String [6][6];  //Barrios que mejor coinciden

Nodo temp = new Nodo("-",0,0,0,0,0,0);  //Lista temporal


void setup(){
  size(200, 200);
  car1 = true;
  car2 = false;
  car3 = false;
  car4 = false;
  car5 = false;
 LeerArchivo();
 MostrarCoincidencias(temp);
 print(".");
}

/*
-----------------------------------------|Búsqueda del Usuario|-----------------------------------------
*/


/*
-----------------------------------------|Lectura de Datos|-----------------------------------------
Archivo de lectura deberá llamarse data.txt
Este método generará un nuevo archivo llamado temp.txt con el nivel de coincidencia de la búsqueda
*/
void LeerArchivo(){
  BufferedReader archivo = createReader("data.txt");
  try {
    Nodo Q = temp;
    String linea = null;
    linea = archivo.readLine();
    while ((linea = archivo.readLine()) != null) {
      String[] datos = split(linea, ",");
      String barrio = datos[0];
      int cond1 = int(datos[1]);
      int cond2 = int(datos[2]);
      int cond3 = int(datos[3]);
      int cond4 = int(datos[4]);
      int cond5 = int(datos[5]);
      Nodo P = AsignarPunt (barrio, cond1, cond2, cond3, cond4, cond5);
      if (temp.barrio == "-"){
        temp = P;
        Q = temp;
      } else {
        Q.next = P;
        Q = Q.next;
      }
    }
    archivo.close();
  } catch (IOException e) {
    print("Archivo no logró cargar");
  }
}


/*
-----------------------------------------|Asignación de Coincidencia|-----------------------------------------
Introducir el nombre del barrio y sus características como los parámetros
cond1: Colegio, cond2: Gimnasio, cond3: Bar, cond4: Tienda, cond5: Parque
*/
Nodo AsignarPunt (String barrio, int cond1, int cond2, int cond3, int cond4, int cond5) {
  int punt = 0;  //Variable para asignar puntaje de coincidencia al barrio
  punt = Punto(car1, cond1) + Punto(car2, cond2) + Punto(car3, cond3) + Punto(car4, cond4) + Punto(car5, cond5);
  
  Nodo P = new Nodo(barrio, cond1, cond2, cond3, cond4, cond5, punt);
  return P;
}


int Punto (boolean car, int cond){
  if (car){
    if (cond == 1){
      return 1;
    }
  } else {
    if (cond == 0){
      return 1;
    }
  }
  return 0;
}


/*
-----------------------------------------|Mostrar Datos según búsqueda|-----------------------------------------
Lectura del archivo temp.txt, con los niveles de coincidencia de la búsqueda
Método para seleccionar los barrios con mayor nivel de coincidencia con la búsqueda
Escogerá por mayor nivel de coincidencia y orden de la lista
*/
void MostrarCoincidencias(Nodo temp){
  try {
    int cont = 0;        //Contador de la cantidad de barrios a mostrar
    boolean ind = true;  //Indicador para fin de coincidencias
    Nodo P;
    
    int cond[] = new int [6];  //Almacenado de los lugares del lugar
    
    while ((cont < 5) && (ind)){  //Leer las primeras 5 mejores coincidencias
      P = temp;
      String linea = null;  
      int max = 0;  //Numero máximo inicial
      String max_barrio = "";
      ind = false;
      while (P.next != null) {
        String barrio = P.barrio;
        cond[0] = P.datos[0];
        cond[1] = P.datos[1];
        cond[2] = P.datos[2];
        cond[3] = P.datos[3];
        cond[4] = P.datos[4];
        int punt = P.datos[5];
        
        if ((punt > max) && (punt > 0)){    //Ingresar mejores coincidencias
          boolean encontrado = false;
          for (int i = 0; i < cont; i++){  //Buscar repetidos
            if (Barrios_S[i][0].equals(barrio)){
              encontrado = true;
            }
          }
          
          if (!encontrado){  //Si no encuentra repetidos se guarda
            max = punt;
            max_barrio = barrio;
            ind = true;
          }
        }
        
        P = P.next;
      }
      
      if (max_barrio != ""){
        Barrios_S[cont][0] = max_barrio;
        cont = cont + 1;
        println("Encontrado: " + max_barrio + "  " + max);
      }
    }
  } catch (NullPointerException e) {
    println("Archivo no logró cargar");
  }
}




public class Nodo {
    private String barrio;
    private int[] datos = new int [6];
    private Nodo next;

    public Nodo(String n_barrio, int dato1, int dato2, int dato3, int dato4, int dato5, int punt){
        this.barrio = n_barrio;
        this.datos[0] = dato1;
        this.datos[1] = dato2;
        this.datos[2] = dato3;
        this.datos[3] = dato4;
        this.datos[4] = dato5;
        this.datos[5] = punt;
        this.next = null;
    }
}
