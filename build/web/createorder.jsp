<%-- 
    Document   : login
    Created on : Sep 27, 2019, 2:30:13 PM
    Author     : Lenovo
--%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*,java.sql.*"%>

<%
    String proname=request.getParameter("proname");
    String qua=request.getParameter("qua");
    String reqdate=request.getParameter("reqdate");
    int pid=0;
    String depr="";
try{
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproject2","root","root");
    
    PreparedStatement st= conn.prepareStatement("select productid from productdetails where name=?");
      
    st.setString(1, proname);
    ResultSet rs = st.executeQuery();
    
    if(rs.next())
    {
    pid = rs.getInt("productid");
    }
    
    String depname=request.getParameter("dep");
    st=conn.prepareStatement("select dname from department where dname=?");
    st.setString(1,depname);
    
    rs = st.executeQuery();
    
    if(rs.next())
    {
    depr = rs.getString("dname");
    }
    
    Statement str= conn.createStatement();
    int x=str.executeUpdate("insert into userchooses(uid,proid,quantity,reqbydate)values('"+depr+"','"+pid+"','"+qua+"','"+reqdate+"')");
    
    if(x==1)
    {
%>
<script>        
alert("Order Send Successfully");
</script>

<%
    }
    
}
catch(Exception e)
{
    System.out.print(e);
    e.printStackTrace();
}

%>