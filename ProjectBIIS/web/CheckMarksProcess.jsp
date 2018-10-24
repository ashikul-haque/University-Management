<%-- 
    Document   : Home
    Created on : Dec 10, 2016, 6:35:46 PM
    Author     : CSE_BUET
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="lavin.db.DataAccess;"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
    </head>
    <div style="width: 500px;margin: 200px auto 0 auto;">  
    <body style="background-color:white">
        <h2>Student Marks</h2>
        <% 
            String id = (String) request.getAttribute("id");
            String courseid = (String) request.getAttribute("course");
            String studentid = (String) request.getAttribute("student");
            System.out.println(studentid);System.out.println(courseid);System.out.println(id);
            ArrayList<String> students = new ArrayList<String>();
            ArrayList<String> marks = new ArrayList<String>();
            ArrayList<String> grades = new ArrayList<String>();
            DataAccess db = new DataAccess();
            db.getCoursesMarks(courseid, studentid, students,marks,grades);
            out.println("<table>");
            out.println("<tr>");
            out.println( String.format("<td>%s</td><td>%s</td><td>%s</td>", "Students   ~~~~", "Marks   ~~~~", "Grades") );
            out.println("</tr>");
                
            for(int i=0;i<students.size();i++)
            {
                
                out.println("<tr>");
                out.println( String.format("<td>%s</td><td>%s</td><td>%s</td>", students.get(i),marks.get(i), grades.get(i)) );
                out.println("</tr>");
                
            }
            
            out.println("</table>");
            out.println("<form method=\"post\" action=\"ShowHome2.do\">");
            out.println(String.format("<input type=\"hidden\" name=\"id\" value=\"%s\" />", id));
            out.println("<input type=\"submit\" value=\"Return Home\" />");
            out.println("</form>");
        %>
    </div>   
    </body>
</html>
