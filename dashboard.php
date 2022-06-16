<?php

if(session_id() == '' || !isset($_SESSION) || session_status() === PHP_SESSION_NONE) {
    session_start();
}

include_once 'classes/Database.php';

if (isset($_SESSION['IS_LOGIN'])) {

    $user_email = ucwords($_SESSION['EMAIL']);
    $connect = new Database;


} else{

    header("Location:login.php");
    die();
}

?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <title>SUCCESS</title>


</head>
<body>
<div class="container">
    <h1>Welcome <?= $user_email ?></h1>
    <p><a href="logout.php">Logout</a></p>
</div>

</body>
</html>


