<!DOCTYPE html>
<html lang="en">
<head>
    <title>Registration & Login with Email OTP verification using Jquery AJAX with PHP Mysql</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <script type="text/javascript" src="assets/js/jquery-3.5.1.min.js"></script>
</head>
<body>

<div class="card text-center" style="padding:20px;">
    <h3>Registration & Login with Email OTP verification using Jquery AJAX with PHP Mysql</h3>
</div><br>

<div class="container">
    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6">
            <form id="submitForm" method="post">
                <div class="form-group">
                    <label for="nmail">Email:</label>
                    <input type="text" class="form-control" name="email" placeholder="Enter Email" required="">
                </div>
                <div class="form-group">
                    <label for="mobile">Mobile Number:</label>
                    <input type="text" class="form-control" name="mobile" placeholder="Enter Mobile number" required="">
                </div>
                <div class="form-group">
                    <label for="name">Pasword:</label>
                    <input type="text" class="form-control" name="password" placeholder="Enter password" required="">
                </div>
                <div class="form-group">
                    <p>Already have account ?<a href="login.php"> Login</a></p>
                    <button type="submit" class="btn btn-primary">Sign Up</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function(){
        $("#submitForm").on("submit", function(e){
            e.preventDefault();
            var formData = $(this).serialize();
            console.log(formData);
            $.ajax({
                url  : "signup.php",
                type : "POST",
                cache:false,
                data : formData,
                success:function(result){

                    console.log(111, result);

                    if (result == "success") {

                        alert("Registration successfully Please login");
                        window.location ='login.php';

                    }else{

                        alert("Registration failed try again!");

                    }
                }
            });
        });
    });
</script>
</body>
</html>