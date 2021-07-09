<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>  
<%@include file="connection.jsp" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%!
    
%>

<%!
    String err="";
%>

<%
    if((request.getParameter("admin_btn")==null?false:true)){
//        out.println("done");
        Connection con=ConnectionUtil.getConnection();
        String username=request.getParameter("admin_username");
        String password=request.getParameter("admin_password");
 //       out.println(username+"\n"+password);
 
       String sql="SELECT * FROM ADMIN WHERE USERNAME=? AND PASSWORD=?";
       
       PreparedStatement pstm=con.prepareCall(sql);
       pstm.setString(1, username);
       pstm.setString(2, password);
       
       ResultSet rs=pstm.executeQuery();
       
       if(!rs.next()){
           err="Invalid username or password.";
       }
       else{
           err="";
           application.setAttribute("username", username);
           
           session.setAttribute("admin", username);
           session.setMaxInactiveInterval(6000);
       }
       
    }
%>

