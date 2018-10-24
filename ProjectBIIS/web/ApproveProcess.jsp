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
        <div style="width: 500px;margin: 200px auto 0 auto;">  
        <h1>Approve or Reject Followings</h1>
        <%
        String s = (String)request.getAttribute("id");String studentid = (String)request.getAttribute("studentid");
        String lvl = (String)request.getAttribute("lvl");String term = (String)request.getAttribute("term");
        int index = Integer.parseInt((String)request.getAttribute("index"));
        ArrayList<String> courses = (ArrayList<String>)request.getAttribute("courses");
        for(int i=0;i<courses.size();i++)
            System.out.println(courses.get(i));
        String s5 = new String();
        
        DataAccess db = new DataAccess();
        out.println("<form method=\"post\" action=\"ApproveProcess2.do\">");
        out.println("<br/>");
        
        for(int i=0;i<courses.size();i++)
        {
            s5 = courses.get(i);
            out.println(String.format("<input type = \"checkbox\" name = \"%s\" value = \"%s\"   >%s  <br>", "course"+i, s5, s5));
        }
        out.println("<br/>");
        out.println("<input type=\"submit\" value=\"Approve Selected\" />");
        out.println(String.format("<input type=\"hidden\" name=\"id\" value=\"%s\" />", s));
        out.println(String.format("<input type=\"hidden\" name=\"studentid\" value=\"%s\" />", studentid));
        out.println(String.format("<input type=\"hidden\" name=\"lvl\" value=\"%s\" />", lvl));
        out.println(String.format("<input type=\"hidden\" name=\"term\" value=\"%s\" />", term));
        out.println(String.format("<input type=\"hidden\" name=\"size\" value=\"%d\" />", courses.size()));
        out.println("</form>");
        DataAccess.approve.remove(index);
        %>
        </div>
    </body>
</html>
