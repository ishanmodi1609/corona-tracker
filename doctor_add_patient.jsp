<%-- 
    Document   : doctor_add_patient
    Created on : Apr 20, 2021, 8:43:54 PM
    Author     : Neel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt"  uri="http://java.sun.com/jstl/fmt"%>

<%
    java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy/MM/dd"); 
    String dt=df.format(new java.util.Date());
%>
<sql:query var="uq" dataSource="${db}">
    SELECT count(*) as cnt from PATIENT WHERE PHONE='${param.phone}'
</sql:query>
    <c:if test="${uq.rows[0].cnt ge 1}">
        <c:redirect url="doctor_panel.jsp">
            <c:param name="err" value="Phone no ${param.phone} already exists.">
                
            </c:param>
            <c:param name="suc" value=""/>
        </c:redirect>
    </c:if>

<c:if test="${param.change eq 'add'}">
    
    <sql:update var="addition" dataSource="${db}">
        INSERT INTO PATIENT(DUSERNAME,PHONE,NAME,ADDRESS,STATUS,MEDICINE,CITY,DATE) VALUES(?,?,?,?,?,?,?,?)
        <sql:param value="${username}"/>
        <sql:param value="${param.phone}"/>
        <sql:param value="${param.name}"/>
        <sql:param value="${param.address}"/>
        <sql:param value="${param.status}"/>
        <sql:param value="${param.medicine}"/>
        <sql:param value="${param.city}"/>
        <sql:param value="<%=dt%>"/>
    </sql:update>
    
    <c:redirect url="doctor_panel.jsp">
            <c:param name="suc" value="Patient has been registered successfully"/>
            <c:param name="err" value=""/>
            
    </c:redirect>
</c:if>
