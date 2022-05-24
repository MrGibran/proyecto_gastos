<?php
    include 'db/db.php';
    include 'db/funciones.php';
    // sentencia de consultas
    $sqlIngreso = "SELECT * FROM  ingreso_egreso where tipo = 'Ingreso'";
    $sqlEgreso = "SELECT * FROM  ingreso_egreso where tipo = 'Egreso'";

    $sqlSumEgreso = "SELECT SUM(cantidad) FROM  ingreso_egreso where tipo = 'Egreso'";
    $sqlSumIngreso = "SELECT SUM(cantidad) FROM  ingreso_egreso where tipo = 'Ingreso'";

    //agarrar el ultimo dia la sum de la cantida de egreso 
    //SELECT SUM(cantidad) FROM ingreso_egreso where fecha BETWEEN '2022-01-31' AND '2022-05-31' && tipo = 'Egreso';

    //consulta de los totales globales mediante el uso de funciones
    $totalIngresos = consultaSuma($conn,$sqlSumIngreso); //<- Suma del total de Ingresos
    $totalEgresos = consultaSuma($conn,$sqlSumEgreso);   //<- Suma del total de Egresos
    $MovimientosMes = consultaArray($conn);   //<- Array con la sum de egresos y ingresos por mes
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
</head>
<body>
  <nav>
    <ul>
      <li><a href="#">Menu</a></li>
      <li><a href="registrar.php">Registrar</a></li>
    </ul>
  </nav>
    <div>
        <h1>Mes actual: <?php echo mesActualEsp();?></h1>
        <h2>Debito</h2>
        <h2>Saldo al dia de hoy: $<?php echo saldoHoy($conn);?></h2>
        <table>
            <thead>
                <tr>
                    <th>Saldo Inicial</th>
                    <th>Ingresos</th>
                    <th>Egresos</th>
                    <th>Saldo Final</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    
                    <td> <?php echo $MovimientosMes[date('n')-2]["movimientos"]["ingreso"] + $MovimientosMes[date('n')-2]["movimientos"]["egreso"];?></td>
                    <td>$ <?php echo $MovimientosMes[date('n')-1]["movimientos"]["ingreso"];?></td>
                    <td>$ <?php echo $MovimientosMes[date('n')-1]["movimientos"]["egreso"];?></td>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>

   <!-- Mover a otra hoja--> 
  <h2>Movimientos Tarjeta de debito</h2>
  <table>
    <thead>
      <tr>
        <th>Mes</th>
        <th>Ingresos</th>
        <th>Egresos</th>
        <th></th>
      </tr>
    </thead>
    <tbody>
      <?php
        foreach($MovimientosMes as $array){
            echo "<tr>" ;
                echo "<td>";
                echo  $array["mes"];
                echo  "</td>";
                echo "<td>$ ";
                echo  $array["movimientos"]["ingreso"];
                echo  "</td>";
                echo "<td>$ ";
                echo  $array["movimientos"]["egreso"];
                echo  "</td>";
                echo "<td> <button type='button'>Detalles</button></td>";
            echo "</tr>";
        }
        echo "<tr>";
             echo "<td> Total </td>";
             echo "<td>$ ";
             echo $totalIngresos;
             echo "</td>";
             echo "<td>$ ";
             echo $totalEgresos;
             echo "</td>";
        echo "</tr>";
      ?>
    </tbody>
  </table> 
    
</body>
</html>
