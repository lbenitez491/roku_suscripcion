<?php

$servername = "127.0.0.1";
$username = "root";
$password = "Awdsawds2";
$dbname = "roku_opencart";

$codigo_canal = $_POST["input"];
$codigo_usuario = "567";

// Create connection
$conn = mysqli_connect($servername, $username, $password, $dbname);
// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

$sql = "SELECT * FROM roku_canal_presuscripcion WHERE codigo_canal = '". $codigo_canal ."' AND estado_suscripcion = '0'";
$result = mysqli_query($conn, $sql);

if (mysqli_num_rows($result) > 0) {
    // output data of each row
    while($row = mysqli_fetch_assoc($result)) {
    	$id_canal_presuscripcion = $row["id"];
        $titulo_canal = $row["titulo_canal"];
        $codigo_canal = $row["codigo_canal"];
        $codigo_dispositivo = $row["codigo_dispositivo"];
    }
	$sql = "UPDATE roku_canal_presuscripcion SET estado_suscripcion = '1' WHERE codigo_canal = '". $codigo_canal ."'";
	mysqli_query($conn, $sql);

	$sql = "INSERT INTO roku_canal_suscripcion (id_canal_presuscripcion, titulo_canal, codigo_canal, codigo_dispositivo, codigo_usuario)
	VALUES ( '" . $id_canal_presuscripcion . "' ,'" . $titulo_canal . "' , '" . $codigo_canal . "', '" . $codigo_dispositivo . "', '" . $codigo_usuario . "')";
	if (mysqli_query($conn, $sql)) {
    	echo "New record created successfully";
	} else {
	    echo "Error: " . $sql . "<br>" . mysqli_error($conn);
	}


} else {
    #Sin resultados
}

mysqli_close($conn);

?>
