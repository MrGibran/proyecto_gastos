let contenido = document.getElementById('contenido')
let cabecera = document.getElementById('cabecera')

//Se encarga de conectarse a un enlance donde estaran todos los varlores a buscar
fetch('./db/ingresos_egresos.php')
.then(res => res.json())
.then(data => mostrarConsulta(data))

//Mostrar se encarga de recorrer el objeto data, donde estan todas los movimientos
function mostrarConsulta(data){
  
  buscarValor(data,"Ingreso")
  buscarValor(data,"Egreso")

}

//Esta funcion se encarga de buscar dentro de cada array en data[x][2] el valor Ingreso
// data[x][2] solo tiene 2 valores Ingreso y Egreso
function buscarValor(obj, status) {
  //obj = el objeto donde se va a buscar
  //status el valor dentro del objeto donde se va a buscar

  var ingresos = []; // <- Nuevo objeto donde se guardaran unicamente los resultados que coincidan con Ingresos
  var egresos = []; // <- Nuevo objeto donde se guardaran unicamente los resultados que coincidan con Egresos
  
  //Hay una sentencia if que evaluara si se Esta buscando Ingresos o Egresos

  /* ----------------INGRESO------------------ */
  if(status == "Ingreso"){
    //let ingresos = document.getElementById('ingresos')
    // Si se esta buscando Ingresos se hace lo siguiente:
    var na=0;           // <- se crea un contador que ayudara a almacenar las variables dentro del objeto
    for (var valor in obj) { 
        //valor = count de los array dentro del obj
        var val = obj[valor][2];
        // El if analiza si todo el array y si en cada array analizado es igual el valor obj[valor][2]
        if (status == val) {
          //ingresos[valor] = obj[valor] si queda asi guarda se guardara mal y quedaran espacios vacios en el obj
          ingresos[na] = obj[valor]
          na++ 
        }
      } console.log(ingresos)
      // se encarga de sumar todos los valores numericos 
      var sIngresos = 0.0;
      var nmIngresos = 0.0;
    
      ingresos.forEach( function(fIngreso){
        sIngresos += parseFloat(fIngreso[7])
        nmIngresos += 1;
      })

      console.log("Total de Egresos: $" + sIngresos + ", numero de movimientos: " + nmIngresos)

      tingresos.innerHTML = `Ingresos: $${sIngresos}`;

      //Momento de vaciar el array con los valores de Ingresos
      for (let valor of ingresos){
        //console.log(valor)
        //Mete los valores dentro de lo que este dentro de nuestro Html con el id=tcontenido
        tcontenido.innerHTML += `
        <tr>
            <td>${valor[3]}</td>
            <td>${valor[4]}</td>
            <td>${valor[5]}</td>
            <td>${valor[6]}</td>
            <td>$${valor[7]}</td>
          </tr>
          `}
  } /* ----------------EGRESO------------------ */
  else{
    // Si se esta buscando Egresos se hace lo siguiente: 
    var nb=0;           // <- se crea un contador que ayudara a almacenar las variables dentro del objeto
    for (var valor in obj) { 
      //valor = count de los array dentro del obj
      var val = obj[valor][2];
      // El if analiza si todo el array y si en cada array analizado es igual el valor obj[valor][2]
      if (status == val) {
        //ingresos[valor] = obj[valor] si queda asi guarda se guardara mal y quedaran espacios vacios en el obj
        egresos[nb] = obj[valor]
        nb++ 
      }
    } console.log(egresos)
      // se encarga de sumar todos los valores numericos 
      var sEgresos = 0.0;
      var nmEgresos = 0.0;
    
      egresos.forEach( function(fIngreso){
        sEgresos += parseFloat(fIngreso[7])
        nmEgresos += 1;
      })

      console.log("Total de Egresos: $" + sEgresos + ", numero de movimientos: " + nmEgresos)

      tegresos.innerHTML = `Egresos: $${sEgresos}`;
      //Momento de vaciar el array con los valores de Ingresos
      for (let valor of egresos){
        //console.log(valor)
        //Mete los valores dentro de lo que este dentro de nuestro Html con el id=tegresos
        tcontenido2.innerHTML += `
        <tr>
            <td>${valor[3]}</td>
            <td>${valor[4]}</td>
            <td>${valor[5]}</td>
            <td>${valor[6]}</td>
            <td>$${valor[7]}</td>
          </tr>
          `}
  }
  
}