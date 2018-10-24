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
        <h1>Approve Student Courses</h1>
        <%
        String s = (String)request.getAttribute("id");String s1 = (String)request.getAttribute("name");
        out.println("<form method=\"post\" action=\"ApproveProcess1.do\">");
        out.println("<br/>");
        out.println("<select name=\"studentid\">");
        for(int i=0;i<DataAccess.approve.size();i++)
        {
            if(s1.equals(DataAccess.approve.get(i).get(1)))
                out.println(String.format("<option value=\"%d\">%s</option>", i, DataAccess.approve.get(i).get(0)));
            
        }
        out.println("</select>");
        out.println("<br/>");
        out.println("<input type=\"submit\" value=\"Next\" />");
        out.println(String.format("<input type=\"hidden\" name=\"id\" value=\"%s\" />", s));
        out.println("</form>");
        
        %>
        </div>
    </body>
</html>
