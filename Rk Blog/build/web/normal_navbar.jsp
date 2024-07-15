<%-- 
    Document   : normal_navbar
    Created on : Jun 24, 2024, 1:59:29 PM
    Author     : gs671
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark primary-background ">
            <a class="navbar-brand" href="index.jsp"><span class="fa fa-globe"></span>RK Blog</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="profile.jsp"><span class="fa fa-home"></span>Home <span class="sr-only">(current)</span></a>
                    </li>
                 
                    <li class="nav-item">
                        <a class="nav-link" href="login.jsp"><span class="fa fa-user"></span>Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="register.jsp"><span class="fa fa-user-plus"></span>Sign up</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="about.jsp"><span class="fa  fa-leaf"></span>About</a>
                    </li>
                    
                </ul>
                
            </div>
        </nav>
    </body>
</html>
