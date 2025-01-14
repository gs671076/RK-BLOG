/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.blog824.servlets;

import com.blog824.dao.PostDao;
import com.blog824.entities.Post;
import com.blog824.entities.User;
import com.blog824.helper.ConnectionProvider;
import com.blog824.helper.Helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author gs671
 */
@MultipartConfig
public class AddPostServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            int cid=Integer.parseInt(request.getParameter("cid"));
            String title=request.getParameter("postTitle");
            String content=request.getParameter("content");
            String code=request.getParameter("code");
            Part part=request.getPart("pic");
            //out.println(part.getSubmittedFileName());
            HttpSession session=request.getSession();
            User user=(User)session.getAttribute("currentuser");
            Post post=new Post(title, content, code,part.getSubmittedFileName(),null, cid, user.getId());
            PostDao pd=new PostDao(ConnectionProvider.getConnection());
            if(pd.savePost(post))
            {
            String path=request.getRealPath("/")+"blog_pics"+File.separator+part.getSubmittedFileName();
            Helper.saveFile(part.getInputStream(), path);
            out.println("done");
            }
            else
            {
            out.println("error");
            }
            //out.println(cid+"\n"+title+"\n"+content+"\n "+code);
            
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
