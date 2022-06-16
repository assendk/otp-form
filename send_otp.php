<?php
//ini_set('display_errors', 1);
//error_reporting(E_ALL);
// Start session
session_start();

// Include database connection file

include_once('config.php');

// Send OTP to email Form post
if (isset($_POST['email'])) {

    $email  = $con->real_escape_string($_POST['email']);
    $otp    = mt_rand(1111, 9999);
    $query  = "SELECT * FROM users WHERE email = '$email'";
    $result = $con->query($query);
    $row = $result->fetch_assoc();
//    echo '<pre>:'; print_r($row); echo "</pre><br>";

    if ($result->num_rows > 0) {
        $con->query("UPDATE users SET otp = '$otp' WHERE email = '$email'");
        sendSMS($row['mobile'], $row['user_id'], $otp);
        $_SESSION['EMAIL'] = $email;
        $_SESSION['MOBILE'] = $row['mobile'];
//        echo "yes";
        echo json_encode(['message'=>'yes']);

    } else{

        echo json_encode(['message'=>'no']);

    }
}

//write to DB
function sendSMS($mobile, $user_id, $otp)
{

    global $con;

    $mobile = $mobile;
    $user_id  = $user_id;
    $message  = "Your OTP is: " . $otp;

    $query  = "INSERT INTO sms_sent (mobile, user_id, message, otp) VALUES ('$mobile','$user_id','$message','$otp')";
    $result = $con->query($query);

    if ($result) {
        return true;
    }else{
        return false;
    }
}
