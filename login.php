<?php
if(session_id() == '' || !isset($_SESSION) || session_status() === PHP_SESSION_NONE) {
    session_start();
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>OTP Form</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
</head>
<body>

<div class="card text-center" style="padding:20px;">
    <h3>OTP Form</h3>
</div><br>

<div class="container">
    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6">

            <div class="alert alert-success alert-dismissible" style="display: none;">
                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                <span class="success-message"></span>
            </div>

            <form id="emailForm" method="post">
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="text" class="form-control" name="email" placeholder="Enter Email" required="" id="email">
                    <span class="error-message" style="color:red;"></span>
                </div>
                <div class="form-group">
                    <p>Not registered yet ?<a href="index.php"> Register here</a></p>
                    <button type="submit" class="btn btn-primary" id="sendOtp">Send OTP</button>
                </div>
            </form>

            <form id="otpForm" style="display:none;">
                <div class="form-group">
                    <label for="mobile">OTP:</label>
                    <input type="text" class="form-control" name="otp" placeholder="Enter OTP" required="" id="otp">
                    <span class="otp-message" style="color: red;"></span>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-success" id="verifyOtp">Verify OTP</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script type="text/javascript" src="/otp-form/assets/js/jquery-3.5.1.min.js"></script>
<script>

    $(document).ready(function(){

        // Send OTP email jquery
        $("#sendOtp").on("click", function(e){
            e.preventDefault();
            var email = $("#email").val();
            $.ajax({
                url  : "send_otp.php",
                type : "POST",
                cache:false,
                data : {email:email},

                success:function(result){

                    let obj = JSON.parse(result)
                    var res = obj.message;

                    if (obj.message == "yes") {

                        $("#otpForm,.alert-success").show();
                        // $("#otpForm").show();

                        $("#emailForm").hide();
                        $(".success-message").html("OTP sent your email address");
                    }
                    if (obj.message =="no") {

                        $(".error-message").html("Please enter valid email");
                    }
                }
            });
        });

        // Verify OTP email jquery
        $("#verifyOtp").on("click",function(e){
            e.preventDefault();
            var otp = $("#otp").val();
            $.ajax({
                url  : "verify_otp.php",
                type : "POST",
                cache:false,
                data : {otp:otp},

                success:function(response){

                    let obj = JSON.parse(response)

                    if (obj.message == "yes") {
                        window.location.href='dashboard.php';
                    }
                    if (obj.message =="no") {
                        $(".otp-message").html("Please enter valid OTP");
                    }
                }
            });
        });
    });
</script>
</body>
</html>