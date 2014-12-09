<?php
	$servername = "127.0.0.1";
	$username = "root";
	$password = "Awdsawds2";
	$dbname = "roku_opencart";
	$id = $_GET["act"];

	// Create connection
	$conn = mysqli_connect($servername, $username, $password, $dbname);
	// Check connection
	if (!$conn) {
	    die("Connection failed: " . mysqli_connect_error());
	}

	// sql to delete a record
	$sql = "DELETE FROM roku_canal_suscripcion WHERE id= '" . $id . "'";

	if (mysqli_query($conn, $sql)) {
	    #echo "Record deleted successfully";
		header("location:../upload/index.php?route=account/order");

	} else {
	    echo "Error deleting record: " . mysqli_error($conn);
	}

	mysqli_close($conn);
?>