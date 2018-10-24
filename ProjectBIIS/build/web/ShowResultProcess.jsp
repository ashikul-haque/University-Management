<%-- 
    Document   : Home
    Created on : Dec 10, 2016, 6:35:46 PM
    Author     : CSE_BUET
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
    </head>
    <body style="background-color:white">
        <div style="width: 200px; margin: 200px auto 0 auto;">
        <h2>Your Results</h2>
        <% 
            String id = (String) session.getAttribute("id");
            ArrayList<String> courses = (ArrayList<String>) session.getAttribute("courses");
            ArrayList<String> grades = (ArrayList<String>) session.getAttribute("grades");
            int size = courses.size();
            out.println("<table>");
            out.println("<tr>");
            out.println( String.format("<td>%s</td><td>%s</td>", "Courses   ~~~~", "Grades") );
            out.println("</tr>");
            for(int i=0;i<size;i++)
            {
                
                out.println("<tr>");
                out.println( String.format("<td>%s</td><td>%s</td>", courses.get(i), grades.get(i)) );
                out.println("</tr>");
                
            }
            
            out.println("</table>");
            out.println("<form method=\"post\" action=\"ShowHome.do\">");
            out.println(String.format("<input type=\"hidden\" name=\"id\" value=\"%s\" />", id));
            out.println("<input type=\"submit\" value=\"Return Home\" />");
            out.println("</form>");
        %>
        </div>
    </body>
</html>
