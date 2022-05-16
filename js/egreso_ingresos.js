let contenido = document.getElementById('contenido')
let cabecera = document.getElementById('cabecera')

fetch('./db/ingresos_egresos.php')
.then(res => res.json())
.then(data => mostrar(data))

//Mostrar se encarga de recorrer el array data, donde estan todas los movimientos
const mostrar = (data) =>{
  console.log(data)
  contenido.innerHTML = ''
  for (let valor of data){
    //console.log(valor)
    //Mete los valores dentro de lo qque este dentro de nuestro Html con el id=contenido
    contenido.innerHTML += `
    <tr>
        <td>${valor[3]}</td>
        <td>${valor[4]}</td>
        <td>${valor[5]}</td>
        <td>${valor[6]}</td>
        <td>$${valor[7]}</td>
      </tr>
      `}
    // Para poder sumar los valores numericos
      var suma    = 0.0;
      var nmovimientos = 0.0;
      data.forEach( function(persona){
        suma += parseFloat(persona[7])
        nmovimientos += 1;
      }
      )
      cabecera.innerHTML += `
      <h1>Ingresos ${suma}</h1>
      <h1>Egresos </h1>
      <h3>Número de movimientos ${nmovimientos}</h3>
      `
        console.log( ` Numero de Movimientos: ${nmovimientos}, Total de Egresos: ${suma} `);    
           
    
}