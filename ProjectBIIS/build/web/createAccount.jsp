
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create account</title>
    </head>
    <body>
        
        <h1>Create Account</h1>
        <form method="post" action="CreateAccount.do">
            Student ID <input type="text" name="studentid" /> <br/>
            Password <input type="password" name="password" /> <br/>
            Department <input type="text" name="depart" /> <br/>
            Name <input type="text" name="name" /> <br/>
            Address <input type="text" name="address" /> <br/>
            Contact No. <input type="text" name="phone" /> <br/>
            <br/>
            <input type="submit" value="Create" />
        </form>
        
        <%
        String s = (String)session.getAttribute("status");
        if(s.equals("failed"))
        {
            out.println("<font color=\"red\">You already have an account or provided wrong info!Please check!</font>");
            out.println("<form method=\"post\" action=\"Login.do\">");
            out.println("<input type=\"submit\" value=\"Login\" />");
            out.println("</form>");
        }  
        else if(s.equals("error"))
        {
            out.println("<font color=\"red\">Your password must be atleast 8 characters long!</font>");
        } 
        else if(s.equals("error2"))
        {
            out.println("<font color=\"red\">Wrong studentID!</font>");
        } 
        %>
    </body>
</html>
