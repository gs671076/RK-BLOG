<%-- 
    Document   : error.page
    Created on : Jun 27, 2024, 8:44:56 PM
    Author     : gs671
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  isErrorPage="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error Happened</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-bg{clip-path: polygon(0 0, 100% 0%, 100% 70%, 0% 100%);}
        </style>
    </head>
    <body>
        <div class="container text-center">
            <img src="img/laptop.png" class="img-fluid">
            <h3 class="display-3">Something! went wrong</h3>
            <a class="btn primary-background btn-lg text-white" href="index.jsp">Home</a>
            <%=exception%>
        </div>
      
    </body>
</html>
