<%@page import="com.blog824.dao.LikeDao"%>
<%@page import="com.blog824.entities.User"%>
<%@page import="java.util.List"%>
<%@page import="com.blog824.entities.Post"%>
<%@page import="com.blog824.helper.ConnectionProvider"%>
<%@page import="com.blog824.dao.PostDao"%>
<div class="row">
    <%
    User u1 = (User) session.getAttribute("currentuser");
    if (u1== null) {
        response.sendRedirect("login.jsp");
    }
%>
    <%
        PostDao pd = new PostDao(ConnectionProvider.getConnection());
        int cid = Integer.parseInt(request.getParameter("cid"));
        List<Post> list = null;
        if (cid == 0) {
            list = pd.getAllPost();
        } else {
            list = pd.getPostByCatId(cid);
        }
        if (list.size() == 0) {
            out.println("<h3 class='display-3 text-center'>No Post</h3>");
            return;
        }
        for (Post p : list) {
    %>
    <div class="col-md-12 mt-2">
        <div class="card mb-3" >
            <div class=" primary-background card-header text-center">
                <b><%=p.getpTitle()%></b>
            </div>
            <div class="card-body">
                <img class="card-img-top text-center" src="blog_pics/<%=p.getpPic()%>" alt="Card image cap" style="border: solid black;width: 90%">
                <p class="card-text"><%=p.getpContent()%></p>

            </div>
            <div class="card-footer bg-dark text-center">
                <%
                LikeDao ld=new LikeDao(ConnectionProvider.getConnection());
                int count=ld.likeCountOnPost(p.getPid());
                %>
                <a href="#" onclick="doLike(<%=p.getPid()%>,<%=u1.getId()%>)" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up "><span class="like-counter"><%=count%></span></i></a>                
                <a href="ShowBlog.jsp?postid=<%=p.getPid()%>" class="btn btn-outline-light btn-sm">Read More..</a>
            </div>
        </div>
        <%
            }

        %>
    </div> 
</div>