<!DOCTYPE html>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>  
<%@include file="connection.jsp" %>     

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
    <title>Doctor's Detail</title>
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
                        <li><a href="admin_logout.jsp"><i class="fa fa-sign-out"></i>Logout</a></li>
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
                        <a class="list-group-item text-center text-20" href="admin_panel.jsp"><i class="fas fa-user-md"></i>Add Doctor</a>
                        <a class="list-group-item  text-center text-20" href="admin_edit_doctor.jsp"><i class="fas fa-user-edit"></i> Edit Doctor</a>
                         <a class="list-group-item active text-center text-20" href="admin_view_doctor.jsp"><i class="fas fa-user"></i> View Doctor Details</a>
                    </ul>
                </div>

                <div class="col-xl-9">
                    <div class="form-area text-center">
                        <h3 class="text-center text-dark">View Active Doctor</h3>
                        <%
                        
                            
                            
                                int cnt=0;
                                  Connection con=ConnectionUtil.getConnection();
                                String sql="SELECT * FROM DOCTOR where RIGHTS='ENABLE'";
                                Statement st=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
                                ResultSet rs=st.executeQuery(sql);
                                
                                rs.last();
                                int r=rs.getRow();
                                if(r==0){
                                    out.println("<h5>NO RECORD PRESENT</h5>");
                                }
                                else{
                                    %>
                                    <div class="table-responsive">
                                            <table class="table table-bordered text-left">
                                                <thead class="thead-light">
                                                    <tr>
                                                        <td>#</td>
                                                        <td>No.</td>
                                                        <td>Username</td>
                                                        <td>Name</td>
                                                        <td>Address</td>
                                                        <td>Hospital</td>
                                                        <td>City</td>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                            
                                    <%
                                           rs=st.executeQuery(sql);
                                           while(rs.next()){
                                               cnt++;
                                               %>
                                               <tr>
                                                   <td><i class="fa fa-chevron-right"></i></td>
                                                    <td><%=cnt%></td>
                                                    <td><%=rs.getString("USERNAME") %></td>
                                                    <td><%=rs.getString("NAME") %></td>
                                                    <td><%=rs.getString("ADDRESS") %></td>
                                                    <td><%=rs.getString("HOSPITAL") %></td>
                                                    <td><%=rs.getString("CITY") %></td>
                                               </tr>
                                                <%
                                           }
                                    %>
                                            </tbody>
                                                </table>
                                            </div>
                                                <%
                                }
                            %>
                        
                       
                        
                    </div>
                </div>
            </div>
        </div>
        
    </div>

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js" integrity="sha384-LtrjvnR4Twt/qOuYxE721u19sVFLVSA4hf/rRt6PrZTmiPltdZcI7q7PXQBYTKyf" crossorigin="anonymous"></script>
</body>
</html>