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
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;

/**
 *
 * @author JayanaI
 */
@WebServlet(name = "postAdServlet", urlPatterns = {"/postAdServlet"})
public class postAdServlet extends HttpServlet {

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

            String role = null;
            String subject = null;
            String content = null;
            String fileNameWithExt = null;
            String imagepath = null;

//            String role = request.getParameter("role");
//            String subject = request.getParameter("subject");
//            String content = request.getParameter("content");
//            String file = request.getParameter("file");
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            Iterator<FileItem> iterator = upload.parseRequest(request).iterator();
            File uploadedFile;
//            String dirPath = "D:\\Admaster\\J";
            String dirPath = "C:\\Users\\JayanaI\\Documents\\NetBeansProjects\\mavenproject2\\admaster\\src\\main\\webapp\\images\\user";
            while (iterator.hasNext()) {

                FileItem item = iterator.next();
                if (!item.isFormField()) {

                    fileNameWithExt = item.getName();

                    File filePath = new File(dirPath);

                    if (!filePath.exists()) {
                        filePath.mkdirs();
                    }

                    if (fileNameWithExt.isEmpty()) {
                        imagepath = "/images/user/1.jpg";

                    } else {
                        DateFormat dateFormat = new SimpleDateFormat("yyMMddHHmmss");
                        Date date = new Date();
                        imagepath = "/images/user/" + dateFormat.format(date) + "_" + fileNameWithExt;
                        uploadedFile = new File(dirPath + "/" + dateFormat.format(date) + "_" + fileNameWithExt);
                        item.write(uploadedFile);
                    }

                } else {
                    String otherFieldName = item.getFieldName();
                    String otherFieldValue = item.getString();
                    if (otherFieldName.equals("role")) {
                        role = otherFieldValue;
                    }
                    if (otherFieldName.equals("subject")) {
                        subject = otherFieldValue;
                    }
                    if (otherFieldName.equals("content")) {
                        content = otherFieldValue;
                    }
                }
            }

            System.out.println("-----------------------");
            System.out.println("role got >" + role);
            System.out.println("subject got >" + subject);
            System.out.println("content got >" + content);
            System.out.println("file got >" + fileNameWithExt);
            String message=Validations.validateRequestData(role, subject, content, imagepath);
            if (message.isEmpty()) {
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mart", "root", "password");
                    String query = " insert into advertisement (ad_category, ad_subject, ad_content, mobile, status,ad_image)"
                            + " values (?, ?, ?, ?, ?, ?)";

                    // create the mysql insert preparedstatement
                    PreparedStatement preparedStmt = con.prepareStatement(query);
                    preparedStmt.setString(1, role);
                    preparedStmt.setString(2, subject);
                    preparedStmt.setString(3, content);
                    preparedStmt.setString(4, "0718898786");
                    preparedStmt.setString(5, "ACT");
                    preparedStmt.setString(6, imagepath);

                    // execute the preparedstatement
                    preparedStmt.execute();

                    con.close();
                    System.out.println("-----------New Ad inserted------------");
                } catch (Exception e) {
                    System.out.println(e);
                }
            }
            request.setAttribute("message", message);
            request.getRequestDispatcher("postAd.jsp").forward(request, response);
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
            Logger.getLogger(postAdServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(postAdServlet.class.getName()).log(Level.SEVERE, null, ex);
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
