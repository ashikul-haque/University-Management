/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lavin.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import lavin.db.DataAccess;

/**
 *
 * @author AcceleRatorX
 */
public class AddCoursesProcess extends HttpServlet {

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
        HttpSession session = request.getSession();
        ArrayList<String> courses = new ArrayList<String>();
        int size =  Integer.parseInt(request.getParameter("size"));
        String id = request.getParameter("id");
        String lvl = request.getParameter("lvl");
        String term = request.getParameter("term");String adviser = request.getParameter("adviser");
        for(int i=0;i<size;i++)
        {
            String s = request.getParameter("course"+i);
            if(s!=null)
                courses.add(s);
        }
        if(courses.size()>0)
        {    courses.add(0, id);courses.add(1, adviser);courses.add(2, lvl);courses.add(3, term);}
        DataAccess.approve.add(courses);
        DataAccess db = new DataAccess();
        ArrayList<String> studentInfo = db.getStudentInfo(id);
        session.setAttribute("student", studentInfo);
        if(courses.size()>0)
            session.setAttribute("status", "wait");
        else
            session.setAttribute("status", "Nothing");
        RequestDispatcher rd = request.getRequestDispatcher("StudentHome.jsp");
        rd.forward(request, response); 
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
