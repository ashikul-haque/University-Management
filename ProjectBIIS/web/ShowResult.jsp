<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Show Result</title>
    </head>
    <body>
        <div style="width: 300px; margin: 200px auto 0 auto;">
        <h1>Select Level & Term</h1>
        <%
        String s = (String)request.getAttribute("id");
        out.println("<form method=\"post\" action=\"ShowResultProcess.do\">");
        out.println("<br/>");
        out.println("LEVEL <input type=\"text\" name=\"lvl\" /> <br/>");
        out.println("TERM  <input type=\"text\" name=\"term\" /> <br/>");
        out.println("<br/>");
        out.println("<input type=\"submit\" value=\"Show\" />");
        out.println(String.format("<input type=\"hidden\" name=\"id\" value=\"%s\" />", s));
        out.println("</form>");
        
        %>
        </div>
    </body>
</html>
