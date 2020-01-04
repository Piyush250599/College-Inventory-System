<%-- 
    Document   : forgot1
    Created on : 2 Oct, 2019, 5:38:08 PM
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
        <link href='https://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
  <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <%
     Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", 465);
        props.put("mail.smtp.user", "darshanbhamare7@gmail.com");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.debug", "true");
        props.put("mail.smtp.socketFactory.port", 465);
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.socketFactory.fallback", "false"); 
try
{
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproject2","root","root");
Statement st=con.createStatement();
String Email=request.getParameter("email");
String strQuery = "SELECT loginpassword,emailid FROM login where emailid='"+Email+"'";
ResultSet rs = st.executeQuery(strQuery);
if(rs.next())
{
     String fetchedPassword = rs.getString("loginpassword");               
                Session session1 = Session.getDefaultInstance(props, null);
                session1.setDebug(true);
                MimeMessage message = new MimeMessage(session1);
                message.setText("Your password is " + fetchedPassword);
                message.setSubject("Password for your account");
                message.setFrom(new InternetAddress("darshanbhamare7@gmail.com"));
                message.addRecipient(RecipientType.TO, new InternetAddress(Email));
                message.saveChanges();
                Transport transport = session1.getTransport("smtp");
                transport.connect("smtp.gmail.com", "darshanbhamare7@gmail.com", "my_password");
                transport.sendMessage(message, message.getAllRecipients());
                transport.close();
                out.println("Password sent to your email id successfully !");
}else{
    out.println("No user found for given emailid");
    out.println("Enter only valid users emailid");
}

}
catch (Exception e){
e.printStackTrace();
}
%>
    </body>
</html>
