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
        <div style="width: 300px; margin: 200px auto 0 auto;">
        <h1>Update Info</h1>
        <%
        String s = (String)request.getAttribute("id");
        DataAccess db = new DataAccess();
        ArrayList<String> studentInfo = db.getStudentInfo(s);
        out.println("<form method=\"post\" action=\"StudentUpdateProcess.do\">");
        out.println("<br/>");
        out.println("New Password <input type=\"password\" name=\"password\" /> <br/>");
        out.println(String.format("Name <input type=\"text\" name=\"name\" value=\"%s\"/> <br/>", studentInfo.get(1)));
        out.println(String.format("Address <input type=\"text\" name=\"address\" value=\"%s\"/> <br/>", studentInfo.get(2)));
        out.println(String.format("Contact NO <input type=\"text\" name=\"phone\" value=\"%s\"/> <br/>", studentInfo.get(4)));
        out.println("<br/>");
        out.println("<input type=\"submit\" value=\"Update\" />");
        out.println(String.format("<input type=\"hidden\" name=\"id\" value=\"%s\" />", s));
        out.println("</form>");
        
        %>
        </div>
    </body>
</html>
