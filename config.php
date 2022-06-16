<?php

// Database configuration
$hostname = "172.18.0.1";
$username = "root";
$password = "example";
$dbname   = "otp-form";

// Create database connection
$con = new mysqli($hostname, $username, $password, $dbname);

// Check connection
if ($con->connect_error) {
    die("Connection failed: " . $con->connect_error);
}

?>

