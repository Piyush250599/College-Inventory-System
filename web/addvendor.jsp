
<%-- 
    Document   : login
    Created on : Sep 27, 2019, 2:30:13 PM
    Author     : Lenovo
--%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*,java.sql.*"%>

<%

try{
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproject2","root","root");
    
    String uid=request.getParameter("userid");
    String usname=request.getParameter("uname");
    String prname=request.getParameter("proname");
    String price=request.getParameter("proprice");
    int id=0;
    
    Statement st= conn.createStatement();
    int x=st.executeUpdate("insert into vendors(vid,vname,adminid)values('"+uid+"','"+usname+"','"+1+"')");
    
    PreparedStatement pst = conn.prepareStatement("select productid from productdetails where name=?");
    pst.setString(1, prname);
        
    ResultSet rst = pst.executeQuery();
    if(rst.next())
    {
        id=rst.getInt("productid");
    }
    
    int m=st.executeUpdate("insert into vendorproducts(vid,productid,productprize)values('"+uid+"','"+id+"','"+price+"')");
    if(x==1 && m==1)
    {
%>
<script>
alert("Inserted Successfully");
</script>
<%
    response.sendRedirect("newvendor.jsp");
    }   
}
catch(Exception e)
{
    System.out.print(e);
    e.printStackTrace();
}

%>