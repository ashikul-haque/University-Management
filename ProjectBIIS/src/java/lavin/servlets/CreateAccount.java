/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lavin.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import lavin.db.DataAccess;

/**
 *
 * @author samsung
 */
public class CreateAccount extends HttpServlet {

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
       
        
        String type = new String("student");
        String studentid = request.getParameter("studentid");
        String password = request.getParameter("password");
        if(studentid.length()!=7)
        {
            HttpSession session = request.getSession();
            session.setAttribute("status", "error2");
            RequestDispatcher rd = request.getRequestDispatcher("createAccount.jsp");
            rd.forward(request, response); 
        }
        else if(password.length()<8)
        {
            HttpSession session = request.getSession();
            session.setAttribute("status", "error");
            RequestDispatcher rd = request.getRequestDispatcher("createAccount.jsp");
            rd.forward(request, response); 
        }
        String depart = request.getParameter("depart");
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        DataAccess db = new DataAccess();
        int count = db.createAccount(studentid,type,password,depart,name,address,phone);
        if(count==1)
        {
            RequestDispatcher rd = request.getRequestDispatcher("SignupSuccess.html");
            rd.forward(request, response);
        }
        else
        {
            HttpSession session = request.getSession();
            session.setAttribute("status", "failed");
            RequestDispatcher rd = request.getRequestDispatcher("createAccount.jsp");
            rd.forward(request, response); 
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
