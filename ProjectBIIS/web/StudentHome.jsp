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
        <div style="width: 300px; margin: 70px auto 0 auto;">
        <font color="green" , font size="5">You are a Student.</font> <br/>
        <h2>Your Info</h2>
        <% 
            
            ArrayList<String> studentInfo = (ArrayList<String>) session.getAttribute("student");
            String status = (String)session.getAttribute("status");
            {
                out.println("<table>");
                out.println("<tr>");
                out.println( String.format("<td>%s</td><td>%s</td>", "ID             :", studentInfo.get(0)) );
                out.println("</tr>");
                out.println("<tr>");
                out.println( String.format("<td>%s</td><td>%s</td>", "NAME           :", studentInfo.get(1)) );
                out.println("</tr>");
                out.println("<tr>");
                out.println( String.format("<td>%s</td><td>%s</td>", "ADDRESS        :", studentInfo.get(2)) );
                out.println("</tr>");
                out.println("<tr>");
                out.println( String.format("<td>%s</td><td>%s</td>", "BATCH          :", studentInfo.get(3)) );
                out.println("</tr>");
                out.println("<tr>");
                out.println( String.format("<td>%s</td><td>%s</td>", "PHONE No.      :", studentInfo.get(4)) );
                out.println("</tr>");
                out.println("<tr>");
                out.println( String.format("<td>%s</td><td>%s</td>", "DEPARTMENT     :", studentInfo.get(8)) );
                out.println("</tr>");
                out.println("<tr>");
                out.println( String.format("<td>%s</td><td>%s</td>", "LEVEL          :", studentInfo.get(5)) );
                out.println("</tr>");
                out.println("<tr>");
                out.println( String.format("<td>%s</td><td>%s</td>", "TERM           :", studentInfo.get(6)) );
                out.println("</tr>");
                out.println("<tr>");
                out.println( String.format("<td>%s</td><td>%s</td>", "ADVISER NAME   :", studentInfo.get(7)) );
                out.println("</tr>");
                
                out.println("</table>");
                out.println("<form method=\"post\" action=\"StudentUpdate.do\">");
                out.println(String.format("<input type=\"hidden\" name=\"id\" value=\"%s\" />", studentInfo.get(0)));
                out.println("<input type=\"submit\" value=\"UpdateInfo\" />");
                out.println("</form>");
                out.println("<form method=\"post\" action=\"AddCourses.do\">");
                out.println(String.format("<input type=\"hidden\" name=\"id\" value=\"%s\" />", studentInfo.get(0)));
                out.println(String.format("<input type=\"hidden\" name=\"lvl\" value=\"%s\" />", studentInfo.get(5)));
                out.println(String.format("<input type=\"hidden\" name=\"term\" value=\"%s\" />", studentInfo.get(6)));
                out.println(String.format("<input type=\"hidden\" name=\"adviser\" value=\"%s\" />", studentInfo.get(7)));
                out.println(String.format("<input type=\"hidden\" name=\"depart\" value=\"%s\" />", studentInfo.get(8)));
                out.println("<input type=\"submit\" value=\"Add Courses\" />");
                out.println("</form>");
                out.println("<form method=\"post\" action=\"ShowResult.do\">");
                out.println(String.format("<input type=\"hidden\" name=\"id\" value=\"%s\" />", studentInfo.get(0)));
                out.println("<input type=\"submit\" value=\"Show Grades\" />");
                out.println("</form>");
                if(status.equals("wait"))
                    out.println("<font color=\"blue\">Please wait for your Adviser's approval.</font> <br/>");
                else if(status.equals("Nothing"))
                    out.println("<font color=\"red\">No courses added!</font> <br/>");
                else if(status.equals("error"))
                    out.println("<font color=\"red\">Some error occured during changing! Maybe provided wrong info?</font> <br/>");
                else if(status.equals("nochange"))
                    out.println("<font color=\"orange\">No info changed!</font> <br/>");
                else if(status.equals("success"))
                    out.println("<font color=\"green\">Successfully changed information!</font> <br/>");
            }
        %>
        </div>
    </body>
</html>
