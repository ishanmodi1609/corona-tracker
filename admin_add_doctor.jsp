<%@include file="connection.jsp" %>

<%-- 
    Here is the declaration of variables
--%>
<%!
    String username;
    String password;
    String name;
    String address;
    String hospital;
    String city;
    String sql;

    String sql2;
%>

<%-- 
   Storing the input
--%>
<%
    username=request.getParameter("username");
    password=request.getParameter("username");
    name=request.getParameter("name");
    address=request.getParameter("address");
    hospital=request.getParameter("hospital");
    city=request.getParameter("city");
%>

<%-- 
   Checking if data already exsist or not
--%>
<%
        Connection con=ConnectionUtil.getConnection();
    sql="SELECT * FROM DOCTOR WHERE USERNAME='"+username+"'";
    Statement st=con.createStatement();
    ResultSet rs=st.executeQuery(sql);
    
    if(rs.next()){
        %>
        <script>
            alert("USERNAME ALREADY PRESENT PLEASE GIVE DIFFERENT USERNAME.");
            window.location='admin_panel.jsp';
        </script>
    <%
    }
%>


<%-- 
   Making the prepared sql query
--%>
<%
    sql="INSERT INTO DOCTOR(USERNAME,PASSWORD,NAME,ADDRESS,HOSPITAL,CITY) VALUES(?,?,?,?,?,?)";
    
%>

<%--
making prepared call
--%>
<%
    
    PreparedStatement pstm=con.prepareCall(sql);
%>

<%-- 
   Setting parameter
--%>
<%
    pstm.setString(1, username);
    pstm.setString(2, password);
    pstm.setString(3, name);
    pstm.setString(4, address);
    pstm.setString(5, hospital);
    pstm.setString(6, city);
    
%>

<%-- 
   Firing the query and error handling
--%>
<%
        try {
                 int change=pstm.executeUpdate();
  
  if(change>0){
      
            sql="INSERT INTO PASSWORDCHANGE(USERNAME,PASSWORD) VALUES (?,?)";
            pstm=con.prepareCall(sql);
            pstm.setString(1, username);
             pstm.setString(2, password);
             int k=pstm.executeUpdate();
            
      %>
      <script>
          alert("DATA HAS BEEN ADDEDD SUCCESSFULLY.");
          window.location="admin_panel.jsp";
      </script>
    <%
  }
    else{
        %>
      <script>
          alert("ERROR OCCURED.");
          window.location="admin_panel.jsp";
      </script>
    <%
    }
            } catch (Exception e) {
                %>
      <script>
          alert("ERROR OCCURED.");
          window.location="admin_panel.jsp";
      </script>
    <%
            }
%>