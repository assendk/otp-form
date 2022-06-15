<?php

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
        $_SESSION['MOBILE'] = $row['mobile'];
        echo "yes";

    }else{
        echo "no";
    }
}

//write to DB
function sendSMS($mobile, $user_id, $otp)
{

    global $con;

    $mobile = $mobile;
    $user_id  = $user_id;
    $otp  = "Your OTP is: " . $otp;

    $query  = "INSERT INTO sms_sent (mobile, user_id, otp) VALUES ('$mobile','$user_id','$otp')";
    $result = $con->query($query);

    if ($result) {
        return true;
    }else{
        return false;
    }
}



// Create function for send email
function sendMail2($to, $msg){

    require 'PHPMailer/PHPMailerAutoload.php';

    $mail = new PHPMailer;

    //$mail->SMTPDebug = 3;                               // Enable verbose debug output

    $mail->isSMTP();                                      // Set mailer to use SMTP
    $mail->Host = 'smtp.gmail.com';                       // Specify main and backup SMTP servers
    $mail->SMTPAuth = true;                               // Enable SMTP authentication
    $mail->Username = 'YourEmailAddress';                 // SMTP username
    $mail->Password = 'YourEmailPassword';                // SMTP password
    $mail->SMTPSecure = 'tls';                            // Enable TLS encryption, `ssl` also accepted
    $mail->Port = 587;                                    // TCP port to connect to
    $mail->setFrom('FromEmail', 'OTP Verification');
    $mail->addAddress($to, 'OTP Verification');           // Add a recipient

    $mail->isHTML(true);                                  // Set email format to HTML

    $mail->SMTPOptions = array(
        'ssl' => array(
            'verify_peer' => false,
            'verify_peer_name' => false,
            'allow_self_signed' => true
        )
    );

    $mail->Subject = 'OTP Verification';
    $mail->Body    = 'Your verification OTP Code is <b>'.$msg.'</b>';

    if($mail->send()) {
        return true;
    } else {
        return false;
    }

}
