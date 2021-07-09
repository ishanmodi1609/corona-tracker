<!DOCTYPE html>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>  
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>      
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%
    Object tmp=session.getAttribute("username_pass_change");
    if(tmp==null){
        response.sendRedirect("doctor_login.jsp");
    }
%>

<%
    String user;
    user=(String)application.getAttribute("doctor_username");
%>


<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctor Password Change</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" />
    <link rel="stylesheet" href="./css/admin_panel.css">
</head>
<body>
    <div class="main-container ">
        <nav class="nav  justify-content-between navbar-expand-xl">
            <div class="navbar-brand" style="font-size: 20px;">Doctor-Password-Change</div>

                <div class="account-info">
                    <ul>
                        <li> <i class="fas fa-user-cog"></i> Hi,<%=user%></li>
                    </ul>
                </div>
        </nav>

        <%-- <div class="container">
            <div class="col-xl-3">
                <ul class="list-group">
                    <a class="list-group-item active" href="admin_panel.jsp"> <i class="fa fa-user-plus"> Add Doctor</i></li>
                </ul>
            </div>
        </div> --%>
        <div class="jumbotron jumbotron-fluid" id="jumbo">
            <div class="container text-center">
                <h3 class="display-6 text-primary"> Welcome Doctor</h3>
                <p class="lead">
                    <ul>
                        <li>You can change your password one time only.</li>
                    </ul>
                </p>
            </div>
        </div>
     
            
            
            <c:if test="${param.change!=null}">
                <c:choose>
                    <c:when test="${param.password eq param.npassword}">
                        <sql:transaction dataSource="${db}">
                            <sql:update var="ru">
                            UPDATE PASSWORDCHANGE SET CHANGED = 'YES', PASSWORD='${param.password}'
                            WHERE USERNAME = ?
                            <sql:param value="<%=user%>"/>
                            </sql:update>
                            
                            <sql:update var="ru">
                            UPDATE DOCTOR SET PASSWORD='${param.password}'
                            WHERE USERNAME = ?
                            <sql:param value="<%=user%>"/>
                            </sql:update>
                            
                        </sql:transaction>
                            
                                    <%
                                        session.removeAttribute("username_pass_change");
                                        session.setAttribute("doctor_username",user);
                                        application.setAttribute("doctor_username",user);
                                    %>
                            <c:redirect  url="doctor_panel.jsp">
                                <c:param name="username" value="${param.username}">
                                    
                                </c:param>
                            </c:redirect>
                    </c:when>
                    
                    <c:otherwise>
                        <div class="container text-center alert alert-danger" role="alert">
                            <strong>ALERT!</strong> Password do not match trying again.
                        </div>
                    </c:otherwise>
                </c:choose>
            </c:if>
            
            
            
        
        <div class="container" id="container">
            <div class="row">

                <div class="col-xl-3">
                    <ul class="list-group">
                        <a class="list-group-item active text-center text-20" href="doctor_password_change.jsp"><i class="fas fa-key"></i> Password Change</a>
                    </ul>
                </div>

                <div class="col-xl-9">
                    <form action="doctor_password_change.jsp" method="post" class="form-area">
                        <h3 class="text-center text-dark">New Password</h3>
                        
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text text-dark">New Password</span>
                            </div>
                            <input type="password" class="form-control" name="password" required>
                        </div>

                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text text-dark">Retype Password</span>
                            </div>
                            <input type="password" class="form-control" name="npassword" required>
                        </div>
                       

                        <div class="input-group justify-content-end"><button class="btn btn-primary " type="submit" value="change" name="change">Change</button></div>
                        
                    </form>
                </div>
            </div>
        </div>
        
    </div>

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js" integrity="sha384-LtrjvnR4Twt/qOuYxE721u19sVFLVSA4hf/rRt6PrZTmiPltdZcI7q7PXQBYTKyf" crossorigin="anonymous"></script>
</body>
</html>