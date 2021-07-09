<%-- 
    Document   : doctor_panel
    Created on : Apr 18, 2021, 8:18:10 PM
    Author     : Neel
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    if(session.getAttribute("doctor_username")==null)
        response.sendRedirect("doctor_login.jsp");
%>
<%!
    String user;
%>
<%
    user=(String)application.getAttribute("doctor_username");
%>

<sql:query dataSource="${db}" var="chk">
    SELECT * FROM DOCTOR WHERE USERNAME='<%=user%>'
</sql:query>
    
    <c:set var="username" scope="session" value="<%=user%>"/>
    
<c:set var="access" scope="session" value="${chk.rows[0].RIGHTS}" />

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctor Panel</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" />
    <link rel="stylesheet" href="./css/admin_panel.css">
</head>
<body>
    <div class="main-container ">
        <nav class="nav  justify-content-between navbar-expand-xl">
            <div class="navbar-brand" style="font-size: 20px;">Doctor Panel</div>

                <div class="account-info">
                    <ul>
                        <li> <i class="fas fa-user-cog"></i> Hi,<%=user%></li>
                        <li><a href="doctor_logout.jsp">Logout</a></li>
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
                        <li>You can add patients.</li>
                        <li>You can edit patient's details.</li>
                    </ul>
                </p>
                <p class="text-danger">NOTE:-THIS CAN BE DONE IF YOU ARE ENABLED BY ADMIN.</p>
            </div>
        </div>
        
        
        <c:choose>
            <c:when test="${access eq 'DISABLE'}">
                <div class="container p-4" role="alert">
                    <div class="alert alert-warning align-item-ceneter justify-content-center display-4" role="alert">
                        <strong>WARNING!</strong> You do not have enough rights to do anything.Please contact administrator as soon as possible.
                    </div>
                </div>
            </c:when>
            
            <c:otherwise>
                <c:if test="${not empty param.err}">
                    <div class="container text-center alert alert-danger" role="alert">
                        <strong>ALERT!</strong> Change a few things up and try submitting again because ${param.err}
                    </div>
                </c:if>
                
                <c:if test="${not empty param.suc}">
                    <div class="container text-center alert alert-success" role="alert">
                        <strong>ADDED!</strong> ${param.suc}
                    </div>
                </c:if>
                
                <div class="container" id="container">
                    <div class="row">

                        <div class="col-xl-3">
                            <ul class="list-group">
                                <a class="list-group-item active text-center text-20" href="doctor_panel.jsp"><i class="fas fa-user-plus"></i> Add Patient</a>
                                <a class="list-group-item text-center text-20" href="doctor_edit_patient.jsp"><i class="fas fa-user-edit"></i> Edit Patient</a>
                            </ul>
                        </div>

                        <div class="col-xl-9">
                            <form action="doctor_add_patient.jsp" method="post" class="form-area">
                                <h3 class="text-center text-dark">New Patient</h3>

                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text text-dark">Patient's Mobile Number</span>
                                    </div>
                                    <input type="text" class="form-control" name="phone" required>
                                </div>

                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text text-dark">Patient's Name</span>
                                    </div>
                                    <input type="text" class="form-control" name="name" required>
                                </div>

                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text text-dark">Patient's Address</span>
                                    </div>
                                    <textarea class="form-control" name="address" required></textarea>
                                </div>

                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text text-dark">Patient's Status</span>
                                    </div>
                                    <select class="form-control" id="sel1" name="status" required>
                                        <option value="Recovered">Recovered</option>
                                        <option value="Positive">Positive</option>
                                        <option value="Dead">Dead</option>
                                    </select>
                                </div>

                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text text-dark">Patient's Medicine</span>
                                    </div>
                                    <input type="text" class="form-control" name="medicine" required>
                                </div>

                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text text-dark">Patient's City</span>
                                    </div>
                                    <input type="text" class="form-control" name="city" required>
                                </div>

                                <div class="input-group justify-content-end"><button class="btn btn-primary " type="submit" value="add" name="change">Add</button></div>

                            </form>
                        </div>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
        
        
        
    </div>

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js" integrity="sha384-LtrjvnR4Twt/qOuYxE721u19sVFLVSA4hf/rRt6PrZTmiPltdZcI7q7PXQBYTKyf" crossorigin="anonymous"></script>
</body>
</html>
