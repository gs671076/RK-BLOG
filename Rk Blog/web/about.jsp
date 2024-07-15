<%-- 
    Document   : about
    Created on : Jul 7, 2024, 1:00:09 PM
    Author     : gs671
--%>

<%@page import="com.blog824.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>About</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            body{
                background: url('img/about.jpg');
                background-attachment: fixed;
                background-size: cover
            }
            #img-ab{
                border-radius: 25%;
                border: 2px solid black;
                object-fit: cover;
            }
        </style>
    </head>
    <body>
        <%@include file="normal_navbar.jsp" %>
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <img  id="img-ab" src="pics/abou11.jpg" hieght="300" width="300" style="margin: 50% 0px 0px 0px">
                </div>
                <div class="col-md-8" style="margin: 15% 0px 0px 0px;  display: block;">
                    <div class="container">
                        <h3><b>Created By :</b> Gaurav Soni</h3>
                        <h3><b>Date of creation:</b>7-July-2024</h3>
                        <h3><b>Profession:</b>Student</h3>
                        <h3><b>Course:</b>Master of Computer Application</h3>
                        <h3><b>Email:</b>gs671076@gmail.com</h3>
                        <h3><b>Instagram:</b> <a style="color: black" href="https://www.instagram.com/gauravsoni939/?hl=en">gauravsoni939</a></h3>
                        <h3><a style="color: black" href="https://www.linkedin.com/in/gaurav-soni-b94820178/"><b>@Linkedin</b></a></h3>

                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
