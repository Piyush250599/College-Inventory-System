<%-- 
    Document   : forgot
    Created on : 25 Sep, 2019, 7:48:11 PM
    Author     : piyush
--%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message.RecipientType"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.util.Properties"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="forgot1.jsp">
            <div class="form">
        Enter Email ID:<input type="email" name="email" /><br><br>
        <button class="button button-block"/>Log In</button>
            </div>
        </form>
    </body>
</html>

