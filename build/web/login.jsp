<%-- 
    Document   : login
    Created on : Sep 22, 2019, 2:30:13 PM
    Author     : Lenovo
--%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*,java.sql.*"%>

<%
    String user_name=request.getParameter("username");
    String pass_word=request.getParameter("password");
    
try{
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproject2","root","root");
    
    PreparedStatement st= conn.prepareStatement("select logintype,dept from login where loginid= ? and loginpassword=?");
      
    st.setString(1, user_name);
    st.setString(2, pass_word);
    ResultSet rs = st.executeQuery();
    
    if(rs.next())
    {
    String user_type = rs.getString("logintype");
    String depa=rs.getString("dept");
    
        if(user_type.equalsIgnoreCase("admin"))
        {
            response.sendRedirect("adminfront.html");
        }
        if(user_type.equalsIgnoreCase("user") && depa.equalsIgnoreCase("computer"))
        {
            response.sendRedirect("userfrontCOMP.jsp");
        }
        if(user_type.equalsIgnoreCase("user") && depa.equalsIgnoreCase("information technology"))
        {
            response.sendRedirect("userfrontIT.jsp");
        }
        if(user_type.equalsIgnoreCase("user") && depa.equalsIgnoreCase("Electronic and Telecommunication"))
        {
            response.sendRedirect("userfrontEnTC.jsp");
        }
        if(user_type.equalsIgnoreCase("vendor"))
        {
            response.sendRedirect("vendorfront.html");
        }
    }
}
catch(Exception e)
{
    System.out.print(e);
    e.printStackTrace();
}

%>