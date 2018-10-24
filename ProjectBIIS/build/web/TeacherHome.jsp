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
        <div style="width: 300px; margin: 100px auto 0 auto;">
        <font color="green" , font size="5">You are a teacher.</font> <br/>
        <h2>Your Info</h2>
        <% 
            
            ArrayList<String> teacherInfo = (ArrayList<String>) session.getAttribute("teacher");
            String status = (String)session.getAttribute("status");
            {
                out.println("<table>");
                out.println("<tr>");
                out.println( String.format("<td>%s</td><td>%s</td>", "ID             :", teacherInfo.get(0)) );
                out.println("</tr>");
                out.println("<tr>");
                out.println( String.format("<td>%s</td><td>%s</td>", "NAME           :", teacherInfo.get(1)) );
                out.println("</tr>");
                out.println("<tr>");
                out.println( String.format("<td>%s</td><td>%s</td>", "ADDRESS        :", teacherInfo.get(2)) );
                out.println("</tr>");
                out.println("<tr>");
                out.println( String.format("<td>%s</td><td>%s</td>", "PHONE No.      :", teacherInfo.get(3)) );
                out.println("</tr>");
                
                out.println("<tr>");
                out.println( String.format("<td>%s</td><td>%s</td>", "DEPARTMENT     :", teacherInfo.get(4)) );
                out.println("</tr>");
                out.println("</table>");
                out.println("<form method=\"post\" action=\"TeacherUpdate.do\">");
                out.println(String.format("<input type=\"hidden\" name=\"id\" value=\"%s\" />", teacherInfo.get(0)));
                out.println("<input type=\"submit\" value=\"UpdateInfo\" />");
                out.println("</form>");
                out.println("<form method=\"post\" action=\"MarksUpdate.do\">");
                out.println(String.format("<input type=\"hidden\" name=\"id\" value=\"%s\" />", teacherInfo.get(0)));
                out.println("<input type=\"submit\" value=\"Update Student Marks\" />");
                out.println("</form>");
                out.println("<form method=\"post\" action=\"Approve.do\">");
                out.println(String.format("<input type=\"hidden\" name=\"id\" value=\"%s\" />", teacherInfo.get(0)));
                out.println(String.format("<input type=\"hidden\" name=\"name\" value=\"%s\" />", teacherInfo.get(1)));
                out.println("<input type=\"submit\" value=\"Approve Pending Requests\" />");
                out.println("</form>");
                out.println("<form method=\"post\" action=\"CheckMarks.do\">");
                out.println(String.format("<input type=\"hidden\" name=\"id\" value=\"%s\" />", teacherInfo.get(0)));
                out.println("<input type=\"submit\" value=\"Check Student Marks\" />");
                out.println("</form>");
                if(status.equals("markchanged"))
                    out.println("<font color=\"green\">Successfully Marked.</font> <br/>");
                else if(status.equals("errorchange"))
                    out.println("<font color=\"red\">Error during mark update! Maybe wrong studentID?</font> <br/>");
                else if(status.equals("error"))
                    out.println("<font color=\"red\">Some error occured during changing! Maybe provided wrong info?</font> <br/>");
                else if(status.equals("nochange"))
                    out.println("<font color=\"orange\">No info changed!</font> <br/>");
                else if(status.equals("success"))
                    out.println("<font color=\"green\">Successfully changed information!</font> <br/>");
                else if(status.equals("nopending"))
                    out.println("<font color=\"red\">No pending Requests!</font> <br/>");
            }
        %>
        </div>
    </body>
</html>
