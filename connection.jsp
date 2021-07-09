<%-- 
    Document   : connection
    Created on : 13 Apr, 2021, 3:03:44 PM
    Author     : ISHAN
--%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>  

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>        


       
<%!
            
            String hi="hi";
            public static class ConnectionUtil{
                private static ConnectionUtil instance =new ConnectionUtil();
                public final String driver="com.mysql.cj.jdbc.Driver";
                public final String url="jdbc:mysql://sql6.freemysqlhosting.net:3306/sql6405344";
                public final String username="sql6405344";
                public final String password="kNClFQPRil";

                private ConnectionUtil(){
                    
                    try {
                            Class.forName(driver);
                        } catch (Exception e) {
                            System.out.println(e);
                        }
                }

                public Connection makeConnection(){
                    Connection con=null;
                    try {
                            con=DriverManager.getConnection(url,username,password);
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    
                    return con;
                }

                public static Connection getConnection() {
		return instance.makeConnection();
                }
            };
            
       %>