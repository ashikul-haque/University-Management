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
        <div style="width: 500px;margin: 200px auto 0 auto;">  
        <h1>Check Student Marks</h1>
        <%
        String s = (String)request.getAttribute("id");
        DataAccess db = new DataAccess();
        ArrayList<String> courses = db.getTeacherCourses(s);
        out.println("<form method=\"post\" action=\"CheckMarksProcess1.do\">");
        out.println("<br/>");
        out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select name=\"courseid\">");
        for(int i=0;i<courses.size();i++)
        {
            out.println(String.format("<option value=\"%s\">%s</option>", courses.get(i), courses.get(i)));
        }
        out.println("</select>");
        out.println("<br/>");
        out.println("studentid <input type=\"text\" name=\"studentid\"/> <br/>");
        out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=\"submit\" value=\"Next\" />");
        out.println(String.format("<input type=\"hidden\" name=\"id\" value=\"%s\" />", s));
        out.println("</form>");
        
        %>
        </div>
    </body>
</html>
