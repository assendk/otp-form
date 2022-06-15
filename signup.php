<?php

// Include database connection file

include_once('config.php');

//echo '<pre>:'; print_r($_POST); echo "</pre><br>";

if (isset($_POST['email'])) {

    $email  = $con->real_escape_string($_POST['email']);
    $mobile = $con->real_escape_string($_POST['mobile']);
    $password   = $con->real_escape_string($_POST['password']);

    $otp    = mt_rand(1111, 9999);

    $query  = "INSERT INTO users (password,email,mobile,otp) VALUES ('$password','$email','$mobile','$otp')";
    $result = $con->query($query);

    if ($result) {
        echo "success";
    }else{
        echo "no";
    }

}