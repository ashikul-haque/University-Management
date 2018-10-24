<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="lavin.db.DataAccess;"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Marks</title>
    </head>
    <body>
        <div style="width: 500px; margin: 200px auto 0 auto;">  
        <h1>Update Student Marks</h1>
        <%
        String s = (String)request.getAttribute("id");
        String s5 = new String();
        
        DataAccess db = new DataAccess();
        ArrayList<String> courses = db.getTeacherCourses(s);
        int size = courses.size();
        out.println("<form method=\"post\" action=\"MarksUpdateProcess.do\">");
        out.println("<br/>");
        out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select name=\"course\">");
        for(int i=0;i<size;i++)
        {
            s5 = courses.get(i);
            out.println(String.format("<option value=\"%s\">%s</option>", s5, s5));
        }
        out.println("</select>");
        out.println("<br/>");
        out.println("Student ID <input type=\"text\" name=\"studentid\" /> <br/>");
        out.println("Marks &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=\"text\" name=\"marks\" /> <br/>");
        out.println("<input type=\"submit\" value=\"Update\" />");
        out.println(String.format("<input type=\"hidden\" name=\"id\" value=\"%s\" />", s));
        out.println("</form>");
        
        %>
        
    </body>
</html>
