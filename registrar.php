<?php
include 'db/db.php';
include 'db/funciones.php';
//SELECT DISTINCT tipo FROM cuenta;
$tipoCuentas = consultaTipoCuentas($conn);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registrar</title>
</head>
<body>
    <form action="<?php echo htmlspecialchars($_SERVER['PHP_SELF'])?>" method="post">
        <label for="tipo">Tipo</label>
            <select name="tipo" id="tipo">
             <?php 
                if(isset($_POST['submit'])){
                    $tipo = $_POST['tipo'];
                    echo "<option value='$tipo'>" . $tipo . "</option>";
                   } else{
                    foreach($tipoCuentas as $cuenta){  
                        echo "<option value='$cuenta[0]'>" . $cuenta[0] . "</option>";
                    }
                   }
            ?>
            </select>

        <?php
        if(isset($_POST['submit'])){
            $tipo = $_POST['tipo'];
            $cuentas = consultaCuentas($conn,$tipo);
            echo "<label for='tipo'>Cuenta</label>" .
                    "<select name='tipo' id='tipo'>";
                        foreach($cuentas as $cuenta){
                            echo "<option value=''>" . $cuenta[2] ."-".$cuenta[3] . "</option>";
                        }
                echo"</select>";
            echo "<label for=''>Cuenta</label>".
                    "<select name='tipo' id='tipo'>".
                    "<option value='Ingreso'> Ingreso </option>".
                    "<option value='Egreso'> Egreso </option>" .
                    "</option>";
           }
        
        /*
        if(!empty($tipo)){
        }
            */?>
            <input type="submit" value="Seguir" name="submit">
        
    </form>
    
</body>
</html>


