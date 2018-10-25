/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.arkentos.admaster;

import com.arkentos.admaster.validation.Validations;
import java.io.File;
import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author JayanaI
 */
@WebServlet(name = "signUpServlet", urlPatterns = {"/signUpServlet"})
public class signUpServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, FileUploadException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String message = "";
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String cpassword = request.getParameter("cpassword");

            System.out.println("-----------------------");
            System.out.println("email got >" + email);
            System.out.println("password got >" + password);
            System.out.println("cpassword got >" + cpassword);

            if (password.equals(cpassword)) {
                try {
                    ResultSet result = null;
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mart", "root", "password");

                    String query = " select count(email) from aduser where email=? and password=?";

                    // create the mysql insert preparedstatement
                    PreparedStatement stmt = con.prepareStatement(query);
                    stmt.setString(1, email);
                    stmt.setString(2, password);
                    result = stmt.executeQuery();
                    if (result.next()) {
                        int count = Integer.parseInt(result.getString(1).trim());
                        if (count > 0) {
                            request.setAttribute("message", message);
                            request.getRequestDispatcher("postAd.jsp").forward(request, response);
                        } else {
                            message = "Invalid credentials";
                            request.setAttribute("message", message);
                            request.getRequestDispatcher("login.jsp").forward(request, response);
                        }
                    } else {
                        message = "Invalid credentials";
                        request.setAttribute("message", message);
                        request.getRequestDispatcher("login.jsp").forward(request, response);
                    }
                } catch (Exception e) {
                }
            } else {
                message = "Confim Password is invalid";
                request.setAttribute("message", message);
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }

            
        }
//            request.setAttribute("role",role);

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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(signUpServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(signUpServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
