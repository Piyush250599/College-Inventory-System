<%-- 
    Document   : login
    Created on : Sep 27, 2019, 2:30:13 PM
    Author     : Lenovo
--%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*,java.sql.*"%>

<%
    String i=request.getParameter("productid");
    String prname=request.getParameter("prname");
    String desc=request.getParameter("prodesc");
try{
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproject2","root","root");
    
    Statement st= conn.createStatement();
    int x=st.executeUpdate("insert into productdetails(productid,name,adminid,description)values('"+i+"','"+prname+"','"+1+"','"+desc+"')");
    
        
    if(x==1)
    {
        response.sendRedirect("newproduct.html");
    }
    
    
}
catch(Exception e)
{
    System.out.print(e);
    e.printStackTrace();
}

%>