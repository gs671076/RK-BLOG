<%-- 
    Document   : register
    Created on : Jun 24, 2024, 3:31:25 PM
    Author     : gs671
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <style>
            .banner-bg{
                clip-path: polygon(0 0, 100% 0%, 100% 70%, 0% 100%);
            }
        </style>
    </head>
    <body>

        <%@include file="normal_navbar.jsp" %>
        <main class="d-flex align-items-center primary-background" style="height: 140vh">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 offset-md-3">
                        <div class="card">
                            <div class="card-header primary-background text-center">
                                <span class="fa fa-user-circle fa-3x"></span><p>Register Here!</p>  

                            </div>
                            <form id="reg-form" action="Register" method="post">
                                <div class="card-body">

                                    <div class="form-group">
                                        <label for="user_name">Name</label>
                                        <input name="name" type="text" class="form-control" id="user_name"  placeholder="Enter name">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email address</label>
                                        <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Password</label>
                                        <input name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                    </div>
                                    <div class="form-group">
                                        <label for="gender">Gender</label>
                                        <br>
                                        <input type="radio"  id="gender" name="gender"value="Male">Male
                                        <input type="radio"  id="gender" name="gender" value="Female">Female
                                    </div>
                                    <div class="form-group">
                                        <textarea name="about" class="form-control" rows="5" placeholder="Write about yourself."></textarea>
                                    </div>
                                    <div class="form-check">
                                        <input name="check"type="checkbox" class="form-check-input" id="exampleCheck1">
                                        <label class="form-check-label" for="exampleCheck1">terms and conditions</label>
                                    </div>
                                </div>
                                <div class="card-footer text-center">
                                    <div class="container"id="loader" style="display:none">
                                        <i class="fa fa-refresh fa-spin fa-3x" aria-hidden="true"></i>
                                        <h3>Please wait...</h3>
                                    </div>
                                    <br>
                                    <button id="sumbit-btn" type="submit" class="btn btn-primary">Register</button>
                                </div>

                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </main>
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="javascript/myjs.js" type="text/javascript"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

        <script>
            $(document).ready(function () {
                console.log('Page loaded...');
                $('#reg-form').on('submit', function (event) {
                    event.preventDefault();

                    // Validate form inputs here if needed

                    let form = new FormData(this);

                    // Hide the submit button and show the loader
                    $('#submit-btn').hide();
                    $('#loader').show();

                    $.ajax({
                        url: "Register",
                        type: "POST",
                        data: form,
                        processData: false,
                        contentType: false,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);

                            // Show the submit button and hide the loader
                            $('#submit-btn').show();
                            $('#loader').hide();

                            // Check if the registration was successful
                            if (data.trim() === "done") {
                                swal("Registration Successful", "Redirecting to login page...", "success")
                                        .then(() => {
                                            window.location.href = "login.jsp";
                                        });
                            } else {
                                swal("Registration Failed", data, "error");
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.error("Error: ", textStatus, errorThrown);
                            $('#submit-btn').show();
                            $('#loader').hide();
                            swal("Some error occurred...", "Please try again later.", "error");
                        }
                    });
                });
            });
        </script>


    </body>
</html>
