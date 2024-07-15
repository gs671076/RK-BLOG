/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.blog824.servlets;

import com.blog824.dao.UserDao;
import com.blog824.entities.Message;
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
public class EditServlet extends HttpServlet {

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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            String uname=request.getParameter("user_name");
            String email=request.getParameter("email1");
            Part profile=request.getPart("profile");
            String profile1=profile.getSubmittedFileName();
            String about=request.getParameter("about");
            String password=request.getParameter("password");
            
            HttpSession session=request.getSession();
            User user=(User)session.getAttribute("currentuser");
            String old=user.getProfile();
            out.println(uname+" "+email+" "+profile1+" "+about+" "+password);
            user.setEmail(email);
            user.setName(uname);
            user.setPassword(password);
            user.setProfile(profile1);
            user.setAbout(about);
            UserDao ud =new UserDao(ConnectionProvider.getConnection());
            boolean s=ud.updateUser(user);
            if (s)
            {
            
            String path=request.getRealPath("/")+"pics"+File.separator+user.getProfile();
            String oldpath=request.getRealPath("/")+"pics"+File.separator+old;
            Helper.deleteFile(oldpath);
            
                if(Helper.saveFile(profile.getInputStream(), path))
                {
                out.println("Profile updated");
                Message msg=new Message("Profile updated","success","alert-success");
                session.setAttribute("msg",msg);
                }
            
            }
            else
            {
            out.println("Profile not updated");
            Message msg=new Message("Profile not updated","error","alert-danger");
            session.setAttribute("msg",msg);
            }
            response.sendRedirect("profile.jsp");
            
        
            
            out.println("</body>");
            out.println("</html>");
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
