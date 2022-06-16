<?php

// Start session
session_start();

// Include database connection file

include_once('config.php');

// Send OTP to email Form post
if (isset($_POST['otp'])) {

    $postOtp = $_POST['otp'];
    $email  = $_SESSION['EMAIL'];
    $mobile  = $_SESSION['MOBILE'];
    $query  = "SELECT * FROM users WHERE otp = '$postOtp' AND mobile = '$mobile'";

    $result = $con->query($query);

    if ($result->num_rows > 0) {

        $con->query("UPDATE users SET otp = '' WHERE email = '$email'");

        $_SESSION['IS_LOGIN'] = $email;

        echo json_encode(['message'=>'yes']);

    }else{
        echo json_encode(['message'=>'no']);
    }

}