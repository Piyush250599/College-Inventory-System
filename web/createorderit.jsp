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
    Calendar calendar = Calendar.getInstance();
    java.sql.Date place_order = new java.sql.Date(calendar.getTime().getTime());
    String or=session.getAttribute("orderid").toString();
    int rn = Integer.parseInt(or);
    String dept = "Information Technology";
    Statement str= conn.createStatement();
    int x=str.executeUpdate("insert into userchooses(proid,quantity,reqbydate,deptid,status,orderid,order_placed,userid)values('"+pid+"','"+qua+"','"+reqdate+"','"+dept+"','"+0+"','"+rn+"','"+place_order+"','"+2+"')");
    
    if(x==1)
    {
%>
<script>        
alert("Order Send Successfully");
</script>

<%
    }
    response.sendRedirect("productpurchaseit.jsp");
}
catch(Exception e)
{
    System.out.print(e);
    e.printStackTrace();
}

%>