<%-- 
    Document   : doctor_panel
    Created on : Apr 18, 2021, 8:18:10 PM
    Author     : Neel
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<c:if test="${param.update eq 'change'}">
    <%
        String phone=request.getParameter("upd-phone");
        String address=request.getParameter("upd-address");
        String status=request.getParameter("upd-status");
        String medicine=request.getParameter("upd-medicine");
    %>
    
    <sql:update  dataSource="${db}">
        UPDATE PATIENT SET ADDRESS='<%=address%>', STATUS='<%=status%>', MEDICINE='<%=medicine%>' WHERE PHONE='<%=phone%>'
    </sql:update>
         <c:set var="succ" value="Data has been updated."/>
</c:if>

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
                <c:if test="${not empty succ}">
                    <div class="container text-center alert alert-success" role="alert">
                        <strong>UPDATED!</strong> ${succ}
                    </div>
                </c:if>
                <div class="container" id="container">
            <div class="row">

                <div class="col-xl-3">
                    <ul class="list-group">
                        <a class="list-group-item  text-center text-20" href="doctor_panel.jsp"><i class="fas fa-user-plus"></i> Add Patient</a>
                        <a class="list-group-item active text-center text-20" href="doctor_edit_patient.jsp"><i class="fas fa-user-edit"></i> Edit Patient</a>
                    </ul>
                </div>

                <div class="col-xl-3">
                    <div class="form-area text-center">
                        <p class="h5">Select your patient</p>
                            <sql:query var="knt" dataSource="${db}">
                                SELECT count(*) as cnt FROM PATIENT WHERE DUSERNAME='${username}'
                            </sql:query>
                                
                                <c:choose >
                                    <c:when test="${knt.rows[0].cnt le 0}">
                                        <p class="alert alert-warning"><strong>ALERT!</strong>First add your patient.</p>
                                    </c:when>
                                    <c:otherwise>
                                        <sql:query var="rws" dataSource="${db}">
                                            SELECT * FROM PATIENT WHERE DUSERNAME='${username}'
                                        </sql:query>
                                        
                                            <c:forEach var="rds" items="${rws.rows}">
                                                <div class="list-group">
                                                    <a class="list-group-item" href="doctor_edit_patient.jsp?edit=<c:out value="${rds.PHONE}"/>">${rds.NAME} ${rds.PHONE}</a>
                                                </div>
                                            </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                        
                    </div>
                </div>
                
                <c:if test="${param.edit!=null}"> 
                    <div class="col-xl-6">
                        <form class="form-area text-center" action="doctor_edit_patient.jsp" method="GET">
                            <h4>Edit Info</h4>
                                <sql:query var="erws" dataSource="${db}">
                                            SELECT * FROM PATIENT WHERE PHONE='${param.edit}'
                                </sql:query>
                                            
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text text-dark">Patient's Mobile Number</span>
                                    </div>
                                    <input type="text" class="form-control" value="${erws.rows[0].PHONE}" disabled>
                                </div>
                                            
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text text-dark">Patient's Name</span>
                                    </div>
                                    <input type="text" class="form-control" value="${erws.rows[0].NAME}" disabled>
                                </div>
                                            
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text text-dark">Patient's Address</span>
                                    </div>
                                    <textarea class="form-control" name="upd-address" required>${erws.rows[0].ADDRESS}</textarea>
                                </div>
                                            
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text text-dark">Patient's Status</span>
                                    </div>
                                    <select class="form-control" id="sel1" name="upd-status" required>
                                        <option value="Recovered">Recovered</option>
                                        <option value="Positive">Positive</option>
                                        <option value="Dead">Dead</option>
                                    </select>
                                </div>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text text-dark">Patient's Medicine</span>
                                    </div>
                                    <input type="text" class="form-control" name="upd-medicine"  value="${erws.rows[0].MEDICINE}" required>
                                </div>
                                
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text text-dark">Patient's City</span>
                                    </div>
                                    <input type="text" class="form-control" value="${erws.rows[0].CITY}" disabled>
                                </div>
                                <input type="hidden" name="upd-phone" value="${erws.rows[0].PHONE}">
                                 <div class="input-group justify-content-end"><button class="btn btn-primary " type="submit" value="change" name="update">Update</button></div>
                        </form>
                    </div>
                </c:if>
            </div>
        </div>
            </c:otherwise>
        </c:choose>
        
        
        
    </div>

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js" integrity="sha384-LtrjvnR4Twt/qOuYxE721u19sVFLVSA4hf/rRt6PrZTmiPltdZcI7q7PXQBYTKyf" crossorigin="anonymous"></script>
</body>
</html>
