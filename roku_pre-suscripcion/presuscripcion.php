<!DOCTYPE html>
<html>
<head>
	<title>Roku presuscripción</title>
	<meta charset="utf-8"> 
</head>
<body>

</body>
</html>

<?php
$servername = "127.0.0.1";
$username = "root";
$password = "Awdsawds2";
$dbname = "roku_opencart";

$input = $_POST["input"];
$input1 = $_POST["input1"];
$input2 = $_POST["input2"];
$input3 = $_POST["input3"];

// Create connection
$conn = mysqli_connect($servername, $username, $password, $dbname);
// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

$sql = "INSERT INTO roku_canal_presuscripcion (titulo_canal, codigo_canal, codigo_dispositivo, estado_suscripcion)
VALUES ( '" . $input . "' , '" . $input1 . "', '" . $input2 . "', '" . $input3 . "')";

if (mysqli_query($conn, $sql)) {
    echo "New record created successfully";
} else {
    echo "Error: " . $sql . "<br>" . mysqli_error($conn);
}

mysqli_close($conn);
?>