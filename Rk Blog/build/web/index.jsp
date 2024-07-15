<%-- 
    Document   : index
    Created on : Jun 22, 2024, 11:09:56 AM
    Author     : gs671
--%>

<%@page import="com.blog824.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
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
        <style>
            .img-g{
                border: 1px solid #ddd;
                border-radius: 4px;
                padding: 5px;
                width: 150px;
            }
        </style>
    </head>
    <body>
        <%@include file="normal_navbar.jsp" %>

        <div class="container-fluid m-0 p-0">
            <div class="jumbotron primary-background banner-bg">
                <div class="container">
                    <h3 class="display-3">Welcome Friends to RK Blog </h3>
                    <p>World of Technology</p>
                    <p>A programming language is a computer language that is used by programmers (developers) to communicate with computers. It is a set of instructions written in any specific language ( C, C++, Java, Python) to perform a specific task.</p>
                    <a class="btn btn-outline-light " href="register.jsp"><span class="fa fa-external-link	"></span>Register Here</a>
                    <a class="btn btn-outline-light " href="login.jsp"><span class="fa fa-sign-in"></span>Login</a>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Java</h5>
                            <p class="card-text">Developed by Sun Microsystems in 1995, Java is a highly popular, object-oriented programming language. This platform independent programming language is utilized for Android development, web development, artificial intelligence, cloud applications, and much more.</p>
                            <a href="login.jsp" class="btn btn-primary primary-background text-white">Read More</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">C</h5>
                            <p class="card-text">C is a general-purpose programming language created by Dennis Ritchie at the Bell Laboratories in 1972.

                                It is a very popular language, despite being old. The main reason for its popularity is because it is a fundamental language in the field of computer science.</p>
                            <a href="login.jsp" class="btn btn-primary primary-background text-white">Read More</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">C++</h5>
                            <p class="card-text">C++ is one of the world's most popular programming languages.C++ can be found in today's operating systems, Graphical User Interfaces, and embedded systems.

                                C++ is an object-oriented programming language which gives a clear structure to programs and allows code to be reused.</p>
                            <a href="login.jsp" class="btn btn-primary primary-background text-white">Read More</a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">DBMS</h5>
                            <p class="card-text">A database management system (DBMS) is a software system for creating and managing databases. A DBMS enables end users to create, protect, read, update and delete data in a database.</p>
                            <a href="login.jsp" class="btn btn-primary primary-background text-white">Read More</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Servlet</h5>
                            <p class="card-text">A servlet is a small Java program that runs within a Web server. Servlets receive and respond to requests from Web clients, usually across HTTP, the HyperText Transfer Protocol.</p>
                            <a href="login.jsp" class="btn btn-primary primary-background text-white">Read More</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Hibernate</h5>
                            <p class="card-text">Hibernate is a Java framework that simplifies the development of Java application to interact with the database. It is an open source, lightweight, ORM (Object Relational Mapping) tool.</p>
                            <a href="login.jsp" class="btn btn-primary primary-background text-white">Read More</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="javascript/myjs.js" type="text/javascript"></script>
</body>
</html>
