<?php 
    function consultaArray($conn,$sql)
    {
        $result = mysqli_query($conn, $sql);
        $data = mysqli_fetch_all ($result, MYSQLI_NUM);
        return $data;
    }
    function consultaSuma($conn,$sql)
    {
        $result = mysqli_query($conn, $sql);
        $data = mysqli_fetch_row ($result);
        $valor = round((float) $data[0],2 );
        return $valor;
    }
?>