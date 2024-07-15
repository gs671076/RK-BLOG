<%-- 
    Document   : profile
    Created on : Jun 28, 2024, 11:39:43 AM
    Author     : gs671
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.blog824.entities.Categories"%>
<%@page import="com.blog824.helper.ConnectionProvider"%>
<%@page import="com.blog824.dao.PostDao"%>
<%@page import="com.blog824.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.blog824.entities.User"%>
<%@page errorPage="error.jsp"%>
<%
    User user = (User) session.getAttribute("currentuser");
    if (user == null) {
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-bg{
                clip-path: polygon(0 0, 100% 0%, 100% 70%, 0% 100%);
            }
            body{
                background: url('img/peakpx.jpg');
                background-size: cover;
                background-attachment: fixed
            }
        </style>
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
                        <a class="nav-link" href="#"><span class="fa fa-home"></span>Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#"  data-toggle="modal" data-target="#add-post-modal"><span class="fa fa-asterisk"></span>DOPOST</a>
                    </li>
                    



                </ul>
                <ul class="navbar-nav mr-right">
                    <li class="nav-item">
                        <a class="nav-link" href="" data-toggle="modal" data-target="#profile-modal"><span class="fa fa-user-circle"></span><%=user.getName()%></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="LogoutServlet"><span class="fa fa-user-plus"></span>Logout</a>
                    </li>
                </ul>
            </div>
        </nav>
        <%
            Message m = (Message) session.getAttribute("msg");
            if (m != null) {%>
        <div class="alert <%=m.getCssClass()%> "role="alert">
            <%=m.getContent()%>
        </div>
        <%
                session.removeAttribute("msg");
            }

        %>

        <!-- main-->
        <main>
            <div class="container">
                <div class="row mt-4">
                    <!--first column -->
                    <div class="col-md-4">
                        <div class="list-group" style="position: fixed">
                            <a href="#" onclick="getPost(0,this)" class="c-link list-group-item list-group-item-action active">
                                All Posts
                            </a>
                            <%
                            PostDao pd=new PostDao(ConnectionProvider.getConnection());
                            ArrayList<Categories> list1=pd.getCategories();
                            for(Categories c:list1)
                            {
                            %>
                            <a href="#"onclick="getPost(<%=c.getCid()%>,this)" class=" c-link list-group-item list-group-item-action"><%=c.getName()%></a>
                            <%
                                }
                            %>
                        </div>
                    </div>
                    <!-- second column -->
                    <div class="col-md-8" >
                        <div class="container text-center" id="loader">
                            <i class="fa fa-refresh fa-4x fa-spin"></i>
                            <h3 class="mt-2">Loading...</h3>
                            
                        </div>
                        <div class="container-fluid" id="post-container">
                            
                        </div>
                    </div>
                </div>
            </div>
        </main>


        <!-- Modal -->
        <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header primary-background text-white">
                        <h5 class="modal-title " id="exampleModalLabel">RK BLOG</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="container text-center">
                            <img src=" pics/<%=user.getProfile()%>" class="img-fluid" style="border-radius: 50%;max-width: 150px">
                            <h5 class="modal-title mt-3 " id="exampleModalLabel"><%=user.getName()%></h5>
                            <div id="profile-details">
                                <table class="table">

                                    <tbody>
                                        <tr>
                                            <th scope="row">ID</th>
                                            <td> <%=user.getId()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Email</th>
                                            <td><%=user.getEmail()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Status</th>
                                            <td><%=user.getAbout()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Gender</th>
                                            <td><%=user.getGender()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Registered Date</th>
                                            <td><%=user.getDateTime()%></td>

                                        </tr>
                                    </tbody>
                                </table>
                            </div>  
                            <!<!-- Profile Edit -->
                            <div id="profile-edit" style="display: none;">

                                <h2 class="mt-3">EDIT </h2>
                                <form action="EditServlet"method="POST"  enctype="multipart/form-data">
                                    <table class="table">
                                        <tr>
                                            <td>ID: </td>
                                            <td><%=user.getId()%></td>
                                        </tr>
                                        <tr>
                                            <td>Email: </td>
                                            <td><input class="form-control" type="email" name="email1" value="<%=user.getEmail()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>Name: </td>
                                            <td><input class="form-control" type="text" name="user_name" value="<%=user.getName()%>"></td>
                                        </tr
                                        <tr>
                                            <td>Password: </td>
                                            <td><input class="form-control" type="password" name="password" value="<%=user.getPassword()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>Profile : </td>
                                            <td><input class="form-control" type="file" name="profile" "></td>
                                        </tr>
                                        <tr>
                                            <td>About: </td>
                                            <td><textarea row='5'class="form-control" name="about"><%=user.getAbout()%>"</textarea></td>
                                        </tr>
                                    </table>
                                    <div class='container'>
                                        <button type='submit'  class='btn btn-outline-success'>Save</button>
                                    </div>
                                </form>

                            </div>


                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button id="edit-button"type="button" class="btn btn-primary">EDIT</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Post modal -->
        <!-- Button trigger modal -->


        <!--post Modal -->
        <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Provide the Post Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body"> 
                        <form id="add-post-form" action="AddPostServlet" method="post">
                            <div class="form-group" >
                                <select class="form-control" name="cid">
                                    <option selected disabled>---Select category---</option>
                                    <%
                                        PostDao post = new PostDao(ConnectionProvider.getConnection());
                                        ArrayList<Categories> list = post.getCategories();
                                        for (Categories c : list) {
                                    %>
                                    <option value="<%=c.getCid()%>"><%=c.getName()%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                            <div class="form-group">
                                <input name="postTitle" type="text" placeholder="Enter Post Title "class="form-control">
                            </div>
                            <div class="form-group">
                                <textarea name="content" class="form-control" style="height: 200px"placeholder="Enter Your Content"></textarea>
                            </div>
                            <div class="form-group">
                                <textarea name="code" class="form-control" style="height: 200px"placeholder="Enter Your Code"></textarea>
                            </div>
                            <div class="form-group">
                                <label>Select pic</label><br>
                                <input name="pic" type="file">
                            </div>
                            <div class="container text-center">
                                <button type="submit" class="btn btn-outline-primary">Post</button>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>


        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="javascript/myjs.js" type="text/javascript"></script>
        <script>
            $(document).ready(function () {
                let editStatus = false;
                $('#edit-button').click(function () {
                    if (editStatus == false)
                    {
                        $("#profile-details").hide(),
                                $("#profile-edit").show();
                        $(this).text("Back");
                        editStatus = true;
                    } else
                    {
                        $("#profile-details").show(),
                                $("#profile-edit").hide();
                        $(this).text("Edit");
                        editStatus = false;
                    }
                });
            });
        </script>
        <!-- Now add post js -->
        <script>
            $(document).ready(function (e) {
                //alert("loaded");
                $("#add-post-form").on('submit', function (event) {
                    event.preventDefault();
                    let form = new FormData(this);

                    $.ajax({
                        url: "AddPostServlet",
                        type: 'post',
                        data: form,
                        success: function (data, textStatus, jqXHR)
                        {
                            console.log(data);
                            if (data.trim() == 'done')
                            {
                                swal("Good job!", "Saved Successfully", "success");

                            } else
                            {
                                swal("Error", "Something Went Wrong try again..", "error");

                            }
                        },

                        error: function (jqXHR, textStatus, errorThrown) {
                            swal("Error", "Something Went Wrong try again..", "error");

                        },
                        processData: false,
                        contentType: false

                    });
                });
            });

        </script>
        <script>
            function getPost(catid,temp)
                {
                    $("#loader").show();
                        $("#post-container").hide();
                        $(".c-link").removeClass('active'),
                  $.ajax({
                    url:"LoadPost.jsp",
                    data:{cid:catid},
                    success:function(data,textStatus,jqXHR){
                        console.log(data);
                        $("#loader").hide();
                        $("#post-container").show(),
                        $("#post-container").html(data);
                        $(temp).addClass('active');
                    }
                    
                });
                }
            $(document).ready(function(e){
                let allPostRef= $(".c-link")[0];
                getPost(0,allPostRef);
            });
        </script>
    </body>
</html>
