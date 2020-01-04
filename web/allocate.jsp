<%-- 
    Document   : login
    Created on : Sep 27, 2019, 2:30:13 PM
    Author     : Lenovo
--%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*,java.sql.*"%>

<%
    String depart=request.getParameter("dep");
    String bud=request.getParameter("budget");
try{
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproject2","root","root");
    
    Statement st= conn.createStatement();
    int x=st.executeUpdate("insert into department(dname,budget)values('"+depart+"','"+bud+"')");
    
    if(x==1)
    {
%>
<script>
alert("Updated Successfully");
</script>
<%
    response.sendRedirect("allocatebudget.html");
    }   
}
catch(Exception e)
{
    System.out.print(e);
    e.printStackTrace();
}

%>