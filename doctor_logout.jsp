<%-- 
    Document   : doctor_logout
    Created on : Apr 20, 2021, 5:59:57 PM
    Author     : Neel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session.invalidate();
    application.removeAttribute("doctor_username");
    response.sendRedirect("index.html");
%>
