<?php
ini_set('display_errors', 1);
error_reporting(E_ALL);

include_once 'classes/Database.php';

if (isset($_POST['email'])) {

    $connect = new Database;

    $email  = $_POST['email'];

    $connect->query("SELECT * FROM users WHERE email = :email");
    $connect->bind(":email", $_POST['email']);
    $row = $connect->getOne();
    if (is_array($row) && count($row) > 0) {
        die(json_encode('User already exists!'));
    }

    $mobile = $_POST['mobile'];

    if (validate_mobile($mobile)){
        $mobile = validate_mobile($mobile);
    }

    $password = $_POST['password'];
    $hash = password_hash($password, PASSWORD_DEFAULT);

    $otp = mt_rand(1111, 9999);

    $connect->query("INSERT INTO users (email, mobile, password) VALUES (:email, :mobile, :password)");

    $connect->bind(":email", $email);
    $connect->bind(":mobile", $mobile);
    $connect->bind(":password", $hash);

    $result = $connect->execute();

    if ($result) {
        echo json_encode(['message'=>'yes']);
    }else{
        echo json_encode(['message'=>'no']);
    }

}

function validate_mobile($mobile)
{

    $result = preg_replace( '/[^0-9]/', '', $mobile );


    if (startsWith($result, '359')) {
        $result = substr($result, 3);
    } elseif (startsWith($result, '0')) {
        $result = substr($result, 1);
    }

    if (strlen($result) < 9 ) {
        echo json_encode('not enough numbers');
        die();
    } else if (strlen($result) > 9) {
        echo json_encode('too many numbers');
        die();
    } else {
        $result = '359' . $result;
    }

    return $result;
}

function startsWith ($string, $startString)
{
    $len = strlen($startString);
    return (substr($string, 0, $len) === $startString);
}