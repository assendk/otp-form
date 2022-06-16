<?php

// Start session
if(session_id() == '' || !isset($_SESSION) || session_status() === PHP_SESSION_NONE) {
    session_start();
}

// Include database connection file
include_once 'classes/Database.php';

// Send OTP to email Form post
if (isset($_POST['otp'])) {

    $connect = new Database;

    $postOtp = $_POST['otp'];
    $email  = $_SESSION['EMAIL'];
    $mobile  = $_SESSION['MOBILE'];


    $connect->query("SELECT * FROM users WHERE mobile = :mobile AND otp = :otp");
    $connect->bind(":mobile", $mobile);
    $connect->bind(":otp", $postOtp);


    $row = $connect->getOne();

    if (is_array($row) && count($row) > 0) {

        $connect->query("UPDATE users SET otp = '' WHERE email = :email)");

        $connect->bind(":email", $email);

        $_SESSION['IS_LOGIN'] = $email;
        
        echo json_encode(['message'=>'yes']);

    }else{

        unset($_SESSION['IS_LOGIN']);
        echo json_encode(['message'=>'no']);
    }

}