<?php 
include 'db.php';

header('Content-Type: application/json');
//Sentencia SQL
$sql = "SELECT * FROM  ingreso_egreso";

$result = mysqli_query($conn, $sql);
$data = array();
$data2 = mysqli_fetch_all ($result, MYSQLI_NUM);

echo json_encode($data2); 
/*
if (mysqli_num_rows($result) > 0) {
    while($row = mysqli_fetch_array($result,MYSQLI_ASSOC)) {
      $data = $row;
    }
    //echo json_encode($data);
    var_dump(mysqli_fetch_all ($result, MYSQLI_ASSOC)); 
  } else {
    echo "0 results";
  }
*/
  // cambios
?>