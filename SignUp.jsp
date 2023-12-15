<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="signup.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Sign Up</title>
</head>
<body>
    <div class="slant">
    <header class="container1">
        <nav class="navbar"><ul>
            <li><a href="">Home</a></li>
            <li><a href="">Terms & Conditions</a></li>
            <li><a href="">Privacy Policy</a></li>
            <div class="buttonsbox">
        <button class="sign"><i class="fa fa-sign-in"></i> Sign In</button>
        <button class="acc"><i class="fa fa-user-plus" ></i> Create an Account</button>
            </div>
        </ul></nav>
    </header>
    <div class="createaccount">
        <h1>Create an Account</h1>
    </div>
 <div class="formbox">
    <form id ="reg-form" action="RegisterServlet" Method ="POSt">
        <h1>Create an Account</h1>
        <ul>
        <li><input type="text" name="user_name" id="" class="fa" placeholder="&#xf2bb; Name"></li>
        <li><input type="email" name="user_email" id="" class="fa" placeholder="&#xf003; Email Adress"></li>
        <li><input type="password" name="user_password" id="" class="fa" placeholder="&#xf084; Password"></li>
        <li><input type="password" name="user_confirmpassword" id="" class="fa" placeholder="&#xf084; Confirm Password"></li>
        <div class="Terms"><input type="checkbox" name="check" id="">Terms & Conditions</div>
    </ul>
    <div class="createbtn">
    <button class="btn">Create Account</button>
</div>
    </form> 
 </div>
 <div class="ask, last" ><a href="login.jsp">Already have an Account?Sign in</a></div>
 <!-- <div class="repassword, last"><a href="">Forgot Password</a></div> -->
</div>
<div class="slant2"></div>


 <!--javascripts-->
        <script
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script>
            $(document).ready(function () {
                console.log("loaded........")

                $('#reg-form').on('submit', function (event) {
                    event.preventDefault();



                    let form = new FormData(this);

                    $("#sumbimt-btn").hide();
                    $("#loader").show();
                    //send register servlet:
                    $.ajax({
                        url: "RegisterServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data)

                            if (data.trim() === 'done')
                            {

                                swal("Registered successfully..We are going to redirect to login page")
                                        .then((value) => {
                                            window.location = "login.jsp"
                                        });
                            } else
                            {

                                swal(data); 
                            }

                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            swal("something went wrong..try again");

                        },
                        processData: false,
                        contentType: false

                    });



                });


            });



        </script>
</body>
</html>