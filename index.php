<?php 
$servername = "localhost";
$username = "root";
$password = "";
$database = "ingresos_egresos";


$conn = mysqli_connect($servername, $username, $password,$database);


/*
if (!$conn) {
  die("Connection failed: " . mysqli_connect_error());
}
echo "Connected successfully";
*/
$sql = "SELECT * FROM  ingreso_egreso";
$result = mysqli_query($conn, $sql);

if (mysqli_num_rows($result) > 0) {
    // output data of each row
    while($row = mysqli_fetch_array($result)) {
      echo "Fecha: " . $row[3]. " Concepto: " . $row[4]. " Subtipo: " . $row[5]. "<br>";
    }
  } else {
    echo "0 results";
  }

  // cambios
?>