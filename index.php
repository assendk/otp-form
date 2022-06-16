<?php ?>
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
            <form id="submitForm">
                <div class="form-group">
                    <label for="nmail">Email:</label>
                    <input type="email" class="form-control" name="email" placeholder="Enter Email" required="">
                </div>
                <div class="form-group">
                    <label for="mobile">Mobile Number:</label>
                    <input type="text" class="form-control" name="mobile" placeholder="Enter Mobile number" required="">
                </div>
                <div class="form-group">
                    <label for="name">Pasword:</label>
                    <input type="password" class="form-control" name="password" placeholder="Enter password" required="">
                </div>
                <div class="form-group">
                    <p>Already have account ?<a href="login.php"> Login</a></p>
                    <button type="submit" class="btn btn-primary">Sign Up</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script type="text/javascript" src="/otp-form/assets/js/jquery-3.5.1.min.js"></script>
<script>
    $(document).ready(function(){
        $("#submitForm").on("submit", function(e){
            e.preventDefault();
            var formData = $(this).serialize();

            $.ajax({
                url  : "signup.php",
                type : "POST",
                cache: false,
                data : formData,

                success:function(result){

                    let obj = JSON.parse(result);

                    console.log(typeof obj.message)

                    // if ( obj.message=== undefined || obj.message == null) {
                    //
                    // }
                    if (obj.message == "yes") {

                        alert("Registration successfully Please login");
                        window.location ='login.php';

                    }else if (obj.message == "no") {

                        alert("Registration failed try again!");

                    } else if (obj.message === undefined || obj.message == null) {
                        let msg = obj;
                        alert(msg);
                    }
                }
            });
        });
    });
</script>
</body>
</html>