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

<%!
  
%>

<%
    Connection con=ConnectionUtil.getConnection();
    String users;
    users=(String)application.getAttribute("username");
%>

<%
    if("POST".equalsIgnoreCase(request.getMethod()) && request.getParameter("update")!=null){
         
        String username=request.getParameter("username");
        String address=request.getParameter("address");
        String hospital=request.getParameter("hospital");
        String check=request.getParameter("enable");
        
        //out.println(check);
        
        if(check!=null)
            check="ENABLE";
        else
            check="DISABLE";
        
//        out.println(username);
            
        String sql="UPDATE DOCTOR SET ADDRESS=? , HOSPITAL=? , RIGHTS=? WHERE USERNAME=?";
        
        PreparedStatement pstm=con.prepareCall(sql);
        
        pstm.setString(1, address);
        pstm.setString(2, hospital);
        pstm.setString(3, check);
        pstm.setString(4, username);
        
       int r=pstm.executeUpdate();
       
       out.println("<script>alert('Data Has Been Updated')</script>");
       
    }
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
                        <li> <i class="fas fa-user-cog"></i> Hi,<%=users%></li>
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
                        <a class="list-group-item  text-center text-20" href="admin_panel.jsp"><i class="fas fa-user-md"></i></i> Add Doctor</a>
                        <a class="list-group-item active text-center text-20" href="admin_edit_doctor.jsp"><i class="fas fa-user-edit"></i> Edit Doctor</a>
                        <a class="list-group-item text-center text-20" href="admin_view_doctor.jsp"><i class="fas fa-user"></i> View Doctor Details</a>
                    </ul>
                </div>
                
                <div class="col-xl-3">
                    <div class="form-area w-100 text-center">
                        <h5 class="text-center">Click on Username</h3>
                        <%
                            String sql="SELECT * FROM DOCTOR";
                            Statement st=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
                            
                            ResultSet rs=st.executeQuery(sql);
                            
                            rs.last();
                            int r=rs.getRow();
//                            out.println(r);
                            
                            if(r>0){
                                rs=st.executeQuery(sql);
                                while(rs.next()){
                                    %>
                                            <div class="list-group">
                                                <a class="list-group-item" href="admin_edit_doctor.jsp?update=<%=rs.getString("USERNAME")%>"><%=rs.getString("USERNAME")%></a>
                                            </div>
                                    <%
                                }
                            }
                            else{
                                %>
                                            <h5 class="bg-warning text-light">No Docotor's Has Been Registered</h5>
                                <%
                            }
                            
                        %>
                    </div>
                </div>
                    
                    <%
                        if("GET".equalsIgnoreCase(request.getMethod()) && request.getParameter("update")!=null){
                            
                            String user=request.getParameter("update");
                            sql="SELECT * FROM DOCTOR WHERE USERNAME=?";
                            PreparedStatement pstm=con.prepareCall(sql);
                            
                            pstm.setString(1, user);
                            
                            rs=pstm.executeQuery();
                            rs.next();
                            
                            %>
                            <div class="col-xl-6">
                                    <form class="form-area" method="POST" action="admin_edit_doctor.jsp">
                                    <h4 class="text-center">Edit Information</h4>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">Username</span>
                                        </div>
                                        <input type="text" class="form-control" disabled value="<%= rs.getString("USERNAME")%>" >
                                    </div>

                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">Name</span>
                                        </div>
                                        <input type="text" class="form-control"  disabled value="<%= rs.getString("NAME")%>">
                                    </div>

                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">Address</span>
                                        </div>
                                        <textarea class="form-control" name="address" required=""><%= rs.getString("ADDRESS")%></textarea>
                                    </div>

                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">Hospital</span>
                                        </div>
                                        <input type="text" class="form-control" name="hospital" value="<%= rs.getString("HOSPITAL")%>" required>
                                    </div>

                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">City</span>
                                        </div>
                                        <input type="text" class="form-control" disabled value="<%= rs.getString("CITY")%>">
                                    </div>
                                    
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <div class="input-group-text">
                                              <input type="checkbox" name="enable" <%
                                                                            if("ENABLE".equals(rs.getString("RIGHTS")))
                                                                                out.println("CHECKED");
                                                                      %>>
                                            </div>
                                         </div>
                                        <input type="text" class="form-control" disabled value="Select if you want to enable or disable the doctor">
                                    </div>
                                    <input type="hidden" value="<%=rs.getString("USERNAME")%>" name="username">
                                    <div class="input-group justify-content-end">
                                        <button class="btn btn-primary" name="update" type="submit">Update</button>
                                    </div>
                                </form>
                            </div>
                                
                            <%
                        }
                    %>
                                
                
            </div>
        </div>
        
    </div>

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js" integrity="sha384-LtrjvnR4Twt/qOuYxE721u19sVFLVSA4hf/rRt6PrZTmiPltdZcI7q7PXQBYTKyf" crossorigin="anonymous"></script>
</body>
</html>