<?php 
    
    function ingresosMes($conn){
        $arrayIngresos = array();   //<- array para almacenar la suma del total de Ingresos por mes
        for($mes=1; $mes<=12;++$mes){
            $sqlMesIngreso = "SELECT SUM(cantidad) FROM ingreso_egreso where tipo = 'Ingreso' && MONTH(fecha) = $mes";
            $tMesIngreso= consultaSuma($conn,$sqlMesIngreso);
            array_push($arrayIngresos,$tMesIngreso); // <- push para meter los valores
        }
        return $arrayIngresos;
    }

    function egresosMes($conn){
        $arrayEgresos = array();    //<- array para almacenar la suma del total de Egresos por mes
        for($mes=1; $mes<=12;++$mes){
            $sqlMesEgreso = "SELECT SUM(cantidad) FROM ingreso_egreso where tipo = 'Egreso' && MONTH(fecha) = $mes";
            $tMesEgreso= consultaSuma($conn,$sqlMesEgreso);
            array_push($arrayEgresos,$tMesEgreso);  // <- push para meter los valores
        }
        return $arrayEgresos;
    }

    //esta funcion devulve un array con los ingresos y egresos por mes
    function consultaArray($conn)
    {   
        //$sqlMesEgreso = "SELECT * FROM ingreso_egreso where tipo = 'Egreso' && MONTH(fecha) = 3";
        //Modelo del array multidimensional
        /*
        $testeo = [ 
            0 => array(
                "Mes" => "Enero",
                "valores" => array(
                    "ingreso" => 1.1, 
                    "egreso" => 2.2)
                ), 
            1 => array(
                "Mes" => "Febrero",
                "valores" => array(
                    "ingreso" => 1.1, 
                    "egreso" => 2.2)
                ), 
            2 => array(
                "Mes" => "Marzo",
                "valores" => array(
                    "ingreso" => 1.1, 
                    "egreso" => 2.2)
                ), 
            3 => array(
                "Mes" => "Abril",
                "valores" => array(
                    "ingreso" => 1.1, 
                    "egreso" => 2.2)
                ), 
        ];*/
        
        //consulta  de la suma del total de los movimientos por mes Ingresos Y Egresos y guardandolos
        //en un array cada uno
        $arrayIngresos = array();   //<- array para almacenar la suma del total de Ingresos por mes
        $arrayEgresos = array();    //<- array para almacenar la suma del total de Egresos por mes
        $meses= array("Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre");
        $arrayMulti= array();      //<-array donde se guardaran todos los meses del mes con sus ingresos y egresos

        // este for se encaraga de almacenar los valores de la consulta en sus respectivos arrays
        for($mes=1; $mes<=12;++$mes){
            $sqlMesIngreso = "SELECT SUM(cantidad) FROM ingreso_egreso where tipo = 'Ingreso' && MONTH(fecha) = $mes";
            $sqlMesEgreso = "SELECT SUM(cantidad) FROM ingreso_egreso where tipo = 'Egreso' && MONTH(fecha) = $mes";
            $tMesIngreso= consultaSuma($conn,$sqlMesIngreso);
            $tMesEgreso= consultaSuma($conn,$sqlMesEgreso);
            array_push($arrayIngresos,$tMesIngreso); // <- push para meter los valores
            array_push($arrayEgresos,$tMesEgreso);  // <- push para meter los valores
        }
        // este se encarga de crear el objeto multidimensial con los arrays del for anterior
        for($cont=0; $cont<=11;++$cont){
            $test = [
                    'mes' => "$meses[$cont]",
                    'movimientos' => [
                        "ingreso" => $arrayIngresos[$cont], 
                        "egreso" => $arrayEgresos[$cont]
                    ]
                ];
            array_push($arrayMulti,$test);
        }
        // ------ IMPORTANTE -----
        //Si se usa lo siguiente:
        //####################
        //$json = json_encode($arrayprueba);
        //return $json;
        //####################
        //Se tendra que usar un json_decode para usar el return en php

        return $arrayMulti ;
        //return $array;
    }

    // funcion que realiza una consulta sql y 
    // devuelve un array
    function consultaSumTotalMes($conn,$sql)
    {
        $result = mysqli_query($conn, $sql);
        $data = mysqli_fetch_all ($result, MYSQLI_NUM);
        return $data;
    }

    // funcion que realiza una consulta de SUM() y 
    // devuelve un float con 2 decimales
    function consultaSuma($conn,$sql)
    {
        $result = mysqli_query($conn, $sql);
        $data = mysqli_fetch_row ($result);
        $valor = round((float) $data[0],2 );
        return $valor;
    }

    //funcion para devolver el mes en el cual se esta trabajando
    function mesActualEsp(){
        $meses = array("Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre");
        echo $meses[date('n')-1];
    }
    // Para ver el saldo de la tarjeta de credito al dia de hoy segun date ();
    function saldoHoy($conn)
    {
        
        $diaPruebas = date('o-m-d');
        $sql = "SELECT SUM(cantidad) FROM ingreso_egreso where fecha BETWEEN '2022-01-31' AND '$diaPruebas'";
        $result = mysqli_query($conn, $sql);
        $data = mysqli_fetch_row ($result);
        $valor = round((float) $data[0],2 );
        return $valor;
    }

    // funcion que devuelve los tipos de cuenta que hay
    function consultaTipoCuentas($conn){
        $sql = "SELECT DISTINCT tipo FROM cuenta";
        $result = mysqli_query($conn, $sql);
        $data = mysqli_fetch_all ($result, MYSQLI_NUM);
        return $data;

    }
    function consultaCuentas($conn,$string){
        $sql = "SELECT *  FROM cuenta WHERE tipo = '$string'";
        $result = mysqli_query($conn, $sql);
        $data = mysqli_fetch_all ($result, MYSQLI_NUM);
        return $data;

    }
?>