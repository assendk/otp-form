<?php
include_once 'classes/Database.php';

class SendSMS
{

    //write to DB
    public function send($mobile, $user_id, $otp)
    {
        $connect = new Database();
        
        echo '<pre>:>'; echo print_r($connect,1); echo "</pre><br>";

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
}