<?php

// Start session
session_start();

// Include database connection file
include_once 'classes/Database.php';
include_once 'classes/SendSMS.php';

// Send OTP to email Form post
if (isset($_POST['email'])) {

    $connect = new Database;

    $email  = $_POST['email'];
    $otp    = mt_rand(1111, 9999);

    $connect->query("SELECT * FROM users WHERE email = :email");
    $connect->bind(":email", $_POST['email']);
    $row = $connect->getOne();

    if (is_array($row) && count($row) > 0) {

        $connect->query("UPDATE users SET otp = :otp WHERE email = :email");

        $connect->bind(":email", $email);
        $connect->bind(":otp", $otp);

        $result = $connect->execute();
        

        sendSMS($row['mobile'], $row['user_id'], $otp, $connect);
//        $send = new SendSMS($row['mobile'], $row['user_id'], $otp);

        $_SESSION['EMAIL'] = $email;
        $_SESSION['MOBILE'] = $row['mobile'];

        echo json_encode(['message'=>'yes']);

    } else{

        echo json_encode(['message'=>'no']);

    }
}

//write to DB
function sendSMS($mobile, $user_id, $otp, $connect)
{

    global $con;

    $message  = "Your OTP is: " . $otp;

    $connect->query("INSERT INTO sms_sent (mobile, user_id, message, otp) VALUES (:mobile, :user_id, :message, :otp)");

    $connect->bind(":mobile", $mobile);
    $connect->bind(":user_id", $user_id);
    $connect->bind(":message", $message);
    $connect->bind(":otp", $otp);

    $connect->execute();

    $last_id = $connect->lastInsertId();

    if ($last_id) {
        return true;
    }else{
        return false;
    }
}

