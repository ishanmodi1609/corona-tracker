<!DOCTYPE html>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>  
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>      

<%
    Object tmp=session.getAttribute("admin");
    if(tmp==null){
        response.sendRedirect("admin_login.jsp");
    }
%>

<%
    String user;
    user=(String)application.getAttribute("username");
%>


<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" />
    <link rel="stylesheet" href="./css/admin_panel.css">
</head>
<body>
    <div class="main-container ">
        <nav class="nav  justify-content-between navbar-expand-xl">
            <div class="navbar-brand" style="font-size: 20px;">Admin-Panel</div>

                <div class="account-info">
                    <ul>
                        <li> <i class="fas fa-user-cog"></i> Hi,<%=user%></li>
                        <li><i class="fa fa-sign-out" aria-hidden="true"></i><a href="admin_logout.jsp">Logout</a></li>
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
                <h3 class="display-6 text-primary"> Welcome Admin</h3>
                <p class="lead">
                    <ul>
                        <li>You can add doctor.</li>
                        <li>You can edit or disable doctor.</li>
                    </ul>
                </p>
            </div>
        </div>
        <div class="container" id="container">
            <div class="row">

                <div class="col-xl-3">
                    <ul class="list-group">
                        <a class="list-group-item active text-center text-20" href="admin_panel.jsp"><i class="fas fa-user-md"></i> Add Doctor</a>
                        <a class="list-group-item  text-center text-20" href="admin_edit_doctor.jsp"><i class="fas fa-user-edit"></i> Edit Doctor</a>
                         <a class="list-group-item text-center text-20" href="admin_view_doctor.jsp"><i class="fas fa-user"></i> View Doctor Details</a>
                    </ul>
                </div>

                <div class="col-xl-9">
                    <form action="admin_add_doctor.jsp" method="post" class="form-area">
                        <h3 class="text-center text-dark">Add Doctor</h3>
                        
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text text-dark">Username</span>
                            </div>
                            <input type="text" class="form-control" name="username" required>
                        </div>

                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text text-dark">Name</span>
                            </div>
                            <input type="text" class="form-control" name="name" required>
                        </div>

                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text text-dark">Address</span>
                            </div>
                            <textarea class="form-control" name="address" required></textarea>
                        </div>

                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text text-dark">Hospital</span>
                            </div>
                            <input type="text" class="form-control" name="hospital" required>
                        </div>

                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text text-dark">City</span>
                            </div>
                            <input type="text" class="form-control" name="city" required>
                        </div>

                        <div class="input-group justify-content-end"><button class="btn btn-primary " type="submit">Register</button></div>
                        
                    </form>
                </div>
            </div>
        </div>
        
    </div>

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js" integrity="sha384-LtrjvnR4Twt/qOuYxE721u19sVFLVSA4hf/rRt6PrZTmiPltdZcI7q7PXQBYTKyf" crossorigin="anonymous"></script>
</body>
</html>