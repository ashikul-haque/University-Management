<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="lavin.db.DataAccess;"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Info</title>
    </head>
    <body>
        <div style="width: 200px; margin: 200px auto 0 auto;">
        <h1>Update Info</h1>
        <%
        String s = (String)request.getAttribute("id");
        String s2 = (String)request.getAttribute("lvl");String s3 = (String)request.getAttribute("term");
        String s4 = (String)request.getAttribute("depart");String s6 = (String)request.getAttribute("adviser");
        String s5 = new String();
        
        DataAccess db = new DataAccess();
        ArrayList<String> courses = db.getDeptCourses(s4,s2,s3);
        int size = courses.size();System.out.println(s4);
        out.println("<form method=\"post\" action=\"AddCoursesProcess.do\">");
        out.println("<br/>");
        
        for(int i=0;i<size;i++)
        {
            s5 = courses.get(i);
            out.println(String.format("<input type = \"checkbox\" name = \"%s\" value = \"%s\"   >%s  <br>", "course"+i, s5, s5));
        }
        out.println("<br/>");
        out.println("<input type=\"submit\" value=\"Update\" />");
        out.println(String.format("<input type=\"hidden\" name=\"id\" value=\"%s\" />", s));
        out.println(String.format("<input type=\"hidden\" name=\"lvl\" value=\"%s\" />", s2));
        out.println(String.format("<input type=\"hidden\" name=\"term\" value=\"%s\" />", s3));
        out.println(String.format("<input type=\"hidden\" name=\"adviser\" value=\"%s\" />", s6));
        out.println(String.format("<input type=\"hidden\" name=\"size\" value=\"%d\" />", size));
        out.println("</form>");
        
        %>
        </div>
    </body>
</html>
