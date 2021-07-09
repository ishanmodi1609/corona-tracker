<%-- 
    Document   : admin_login
    Created on : Apr 13, 2021, 1:14:26 PM
    Author     : Neel
--%>

<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>  
<%@include file="admin_login_checker.jsp" %>
<%

    if((session.getAttribute("admin")==null?false:true)){
               
           RequestDispatcher rd=request.getRequestDispatcher("admin_panel.jsp");
           rd.forward(request, response);
           response.sendRedirect("admin_panel.jsp");
           
    }
    
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="./css/users_login.css">
</head>
<body>
    <div class="container">
        <div class="img-shadow"></div>
        <nav>
             <a href="index.html">
                <div class="title">
                    Covid-19 Tracker
                </div>
            </a>
        </nav>
        
        <div class="article">

            <div class="box-container">
                <div class="frm-container">
                    <div class="frm-title"><h1>Admin Login</h1></div>
                    <form action="" method="post">
                        <input type="text" name="admin_username" placeholder="Enter admin username..." id="txt" required><br>               
                        <input type="password" name="admin_password" id="txt" required><br>
                        <button class="btn" name="admin_btn" type="submit">Login</button>        
                    </form>
                </div>
                <div class="error">
                   <%=
                      err 
                   %>
                </div>
            </div>

            <div class="txt-container">
                <p>
                
                    <ul>
                        Guidelines for the protection from Covid-19<br><br>
                        <li>Maintain at least a 1-metre distance between yourself and others</li>
                        <li>Make wearing a mask a normal part of being around other people</li>
                        <li>The appropriate use, storage and cleaning or disposal are essential to make masks as effective as possible.</li>
                        <li>Avoid the 3Cs: spaces that are closed, crowded or involve close contact.</li>
                        <li>Avoid crowded or indoor settings</li>
                    </ul>
                </p>
            </div>

            
            
        </div>
    </div>

</body>
</html>
