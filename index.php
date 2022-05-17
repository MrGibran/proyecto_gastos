<?php 
    include 'db/db.php';
    include 'db/consultas.php';

    // sentencia de consultas
    $sqlIngreso = "SELECT * FROM  ingreso_egreso where tipo = 'Ingreso'";
    $sqlEgreso = "SELECT * FROM  ingreso_egreso where tipo = 'Egreso'";

    $sqlSumEgreso = "SELECT SUM(cantidad) FROM  ingreso_egreso where tipo = 'Egreso'";
    $sqlSumIngreso = "SELECT SUM(cantidad) FROM  ingreso_egreso where tipo = 'Ingreso'";

    $sqlMesEgreso = "SELECT * FROM ingreso_egreso where tipo = 'Egreso' && MONTH(fecha) = 3";
    $sqlMesIngreso = "SELECT * FROM ingreso_egreso where tipo = 'Ingreso' && MONTH(fecha) = 3";

    //consulta de los totales globales
    $totalIngresos = consultaSuma($conn,$sqlSumIngreso); //<- Suma del total de Ingresos
    $totalEgresos = consultaSuma($conn,$sqlSumEgreso);   //<- Suma del total de Egresos
    
    //consulta  de la suma de movimientos por mes
    $ArrayIngresos = array();   //<- Se alamcenan en un array la suma del total de Ingresos
    $ArrayEgresos = array();    //<- Se alamcenan en un array la suma del total de Egresos

    echo "Los Ingresos son: $$totalIngresos y los egresos son $$totalEgresos. ";
    echo '<br>';

    for($mes=1; $mes<=12;++$mes){
        $sqlMesIngreso = "SELECT SUM(cantidad) FROM ingreso_egreso where tipo = 'Ingreso' && MONTH(fecha) = $mes";
        $sqlMesEgreso = "SELECT SUM(cantidad) FROM ingreso_egreso where tipo = 'Egreso' && MONTH(fecha) = $mes";
        $tMesIngreso= consultaSuma($conn,$sqlMesIngreso);
        $tMesEgreso= consultaSuma($conn,$sqlMesEgreso);
        array_push($ArrayIngresos,$tMesIngreso);
        array_push($ArrayEgresos,$tMesEgreso);
    }
      
    var_dump($ArrayIngresos);
    echo '<br>';
    var_dump($ArrayEgresos);  
    echo '<br>';
    $Array= array("Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre");

    for($mes=0; $mes<=11;++$mes){
        echo " En $Array[$mes] los ingresos son $ArrayIngresos[$mes] y los egresos son $ArrayEgresos[$mes] ";
        echo '<br>';
    }
    
?>
