<%-- 
    Document   : login
    Created on : Sep 27, 2019, 2:30:13 PM
    Author     : Lenovo
--%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*,java.sql.*"%>

<%
    String orderid = request.getParameter("orderid");
try{

    int ordid=Integer.parseInt(orderid);
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproject2","root","root");
    
    PreparedStatement str= conn.prepareStatement("update userchooses set status=? where orderid=?");
    str.setInt(1, 1);
    str.setInt(2, ordid);
    int x=str.executeUpdate();
    
    if(x==1)
    {
      response.sendRedirect("ongoing.jsp");   
    }
}
catch(Exception e)
{
    System.out.print(e);
    e.printStackTrace();
}

%>