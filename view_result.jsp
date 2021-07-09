<%-- 
    Document   : view_result
    Created on : Apr 13, 2021, 1:14:59 PM
    Author     : Neel
--%>

<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>  
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>

<!DOCTYPE html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Covid-19 Statics</title>
    </head>
    <link rel="stylesheet" href="./css/view_result.css">

    
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <script>
        <% String city1=request.getParameter("cities"); %>
        <%  
            Connection con;
            Statement st;
            ResultSet rs,rs1,rs2,rs3;
            
            int month[][]=new int[15][4];
            
            for(int i=0;i<15;i++){
                for(int j=0;j<4;j++){
                    month[i][j]=0;
                }
            }
            
            
            try{
                con=null;
                Class.forName("com.mysql.cj.jdbc.Driver");
                con=DriverManager.getConnection("jdbc:mysql://sql6.freemysqlhosting.net:3306/sql6405344","sql6405344","kNClFQPRil");
                st=con.createStatement();
                
                String city=request.getParameter("cities");
                
                if(city.equals("All")){
                    rs=st.executeQuery("SELECT * from PATIENT");
                }
                else{
                    rs=st.executeQuery("SELECT * from PATIENT where CITY="+"'"+city+"'");
                }
                
                while(rs.next()){
                    String s1=rs.getString("DATE"),s2=rs.getString("STATUS");
                    
                    if(s2.equals("Recovered")){
                        if(s1.charAt(5)=='0'){
                            
                            int p1=0;
                            
                            if(s1.charAt(6)=='1'){
                                month[1][p1]=month[1][p1]+1;
                            }
                            else if(s1.charAt(6)=='2'){
                                month[2][p1]=month[2][p1]+1;
                            }
                            else if(s1.charAt(6)=='3'){
                                month[3][p1]=month[3][p1]+1;
                            }
                            else if(s1.charAt(6)=='4'){
                                month[4][p1]=month[4][p1]+1;
                            }
                            else if(s1.charAt(6)=='5'){
                                month[5][p1]=month[5][p1]+1;
                            }
                            else if(s1.charAt(6)=='6'){
                                month[6][p1]=month[6][p1]+1;
                            }
                            else if(s1.charAt(6)=='7'){
                                month[7][p1]=month[7][p1]+1;
                            }
                            else if(s1.charAt(6)=='8'){
                                month[8][p1]=month[8][p1]+1;
                            }   
                            else if(s1.charAt(6)=='9'){
                                month[9][p1]=month[9][p1]+1;
                            }
                        }
                        else if(s1.charAt(6)=='1'){
                            
                            int p1=0;
                            
                            if(s1.charAt(6)=='0'){
                                month[10][p1]=month[10][p1]+1;
                            }
                            else if(s1.charAt(6)=='1'){
                                month[11][p1]=month[11][p1]+1;
                            }
                            else if(s1.charAt(6)=='2'){
                                month[12][p1]=month[12][p1]+1;
                            }
                        }
                    }
                    else if(s2.equals("Positive")){
                        
                        int p1=1;
                        
                        if(s1.charAt(5)=='0'){
                            if(s1.charAt(6)=='1'){
                                month[1][p1]=month[1][p1]+1;
                            }
                            else if(s1.charAt(6)=='2'){
                                month[2][p1]=month[2][p1]+1;
                            }
                            else if(s1.charAt(6)=='3'){
                                month[3][p1]=month[3][p1]+1;
                            }
                            else if(s1.charAt(6)=='4'){
                                month[4][p1]=month[4][p1]+1;
                            }
                            else if(s1.charAt(6)=='5'){
                                month[5][p1]=month[5][p1]+1;
                            }
                            else if(s1.charAt(6)=='6'){
                                month[6][p1]=month[6][p1]+1;
                            }
                            else if(s1.charAt(6)=='7'){
                                month[7][p1]=month[7][p1]+1;
                            }
                            else if(s1.charAt(6)=='8'){
                                month[8][p1]=month[8][p1]+1;
                            }   
                            else if(s1.charAt(6)=='9'){
                                month[9][p1]=month[9][p1]+1;
                            }
                        }
                        else{
                            
                            if(s1.charAt(6)=='0'){
                                month[10][p1]=month[10][p1]+1;
                            }
                            else if(s1.charAt(6)=='1'){
                                month[11][p1]=month[11][p1]+1;
                            }
                            else if(s1.charAt(6)=='2'){
                                month[12][p1]=month[12][p1]+1;
                            }
                        }
                    }
                    else{
                        
                        int p1=2;
                        
                        if(s1.charAt(5)=='0'){
                            if(s1.charAt(6)=='1'){
                                month[1][p1]=month[1][p1]+1;
                            }
                            else if(s1.charAt(6)=='2'){
                                month[2][p1]=month[2][p1]+1;
                            }
                            else if(s1.charAt(6)=='3'){
                                month[3][p1]=month[3][p1]+1;
                            }
                            else if(s1.charAt(6)=='4'){
                                month[4][p1]=month[4][p1]+1;
                            }
                            else if(s1.charAt(6)=='5'){
                                month[5][p1]=month[5][p1]+1;
                            }
                            else if(s1.charAt(6)=='6'){
                                month[6][p1]=month[6][p1]+1;
                            }
                            else if(s1.charAt(6)=='7'){
                                month[7][p1]=month[7][p1]+1;
                            }
                            else if(s1.charAt(6)=='8'){
                                month[8][p1]=month[8][p1]+1;
                            }   
                            else if(s1.charAt(6)=='9'){
                                month[9][p1]=month[9][p1]+1;
                            }
                        }
                        else{
                            
                            if(s1.charAt(6)=='0'){
                                month[10][p1]=month[10][p1]+1;
                            }
                            else if(s1.charAt(6)=='1'){
                                month[11][p1]=month[11][p1]+1;
                            }
                            else if(s1.charAt(6)=='2'){
                                month[12][p1]=month[12][p1]+1;
                            }
                        }
                    }
                }
            }catch(Exception e){
                
            }
                
            Gson gsonObj = new Gson();
            Map<Object,Object> map = null;
            List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
            
            int p1=0;
            
            map = new HashMap<Object,Object>(); map.put("label", "Jan"); map.put("y",month[1][p1]); list.add(map);
            map = new HashMap<Object,Object>(); map.put("label", "Feb"); map.put("y",month[2][p1]); list.add(map);
            map = new HashMap<Object,Object>(); map.put("label", "March"); map.put("y",month[3][p1]); list.add(map);
            map = new HashMap<Object,Object>(); map.put("label", "April"); map.put("y",month[4][p1]); list.add(map);
            map = new HashMap<Object,Object>(); map.put("label", "May"); map.put("y",month[5][p1]); list.add(map);
            map = new HashMap<Object,Object>(); map.put("label", "June"); map.put("y",month[6][p1]); list.add(map);
            map = new HashMap<Object,Object>(); map.put("label", "July"); map.put("y",month[7][p1]); list.add(map);
            map = new HashMap<Object,Object>(); map.put("label", "August"); map.put("y",month[8][p1]); list.add(map);
            map = new HashMap<Object,Object>(); map.put("label", "Oct"); map.put("y",month[9][p1]); list.add(map);
            map = new HashMap<Object,Object>(); map.put("label", "Sep"); map.put("y",month[10][p1]); list.add(map);
            map = new HashMap<Object,Object>(); map.put("label", "Nov"); map.put("y",month[11][p1]); list.add(map);
            map = new HashMap<Object,Object>(); map.put("label", "Dec"); map.put("y",month[12][p1]); list.add(map);

            String dataPoints = gsonObj.toJson(list);  

            p1=1;
            
            list = new ArrayList<Map<Object,Object>>();
            
            map = new HashMap<Object,Object>(); map.put("label", "Jan"); map.put("y",month[1][p1]); list.add(map);
            map = new HashMap<Object,Object>(); map.put("label", "Feb"); map.put("y",month[2][p1]); list.add(map);
            map = new HashMap<Object,Object>(); map.put("label", "March"); map.put("y",month[3][p1]); list.add(map);
            map = new HashMap<Object,Object>(); map.put("label", "April"); map.put("y",month[4][p1]); list.add(map);
            map = new HashMap<Object,Object>(); map.put("label", "May"); map.put("y",month[5][p1]); list.add(map);
            map = new HashMap<Object,Object>(); map.put("label", "June"); map.put("y",month[6][p1]); list.add(map);
            map = new HashMap<Object,Object>(); map.put("label", "July"); map.put("y",month[7][p1]); list.add(map);
            map = new HashMap<Object,Object>(); map.put("label", "August"); map.put("y",month[8][p1]); list.add(map);
            map = new HashMap<Object,Object>(); map.put("label", "Oct"); map.put("y",month[9][p1]); list.add(map);
            map = new HashMap<Object,Object>(); map.put("label", "Sep"); map.put("y",month[10][p1]); list.add(map);
            map = new HashMap<Object,Object>(); map.put("label", "Nov"); map.put("y",month[11][p1]); list.add(map);
            map = new HashMap<Object,Object>(); map.put("label", "Dec"); map.put("y",month[12][p1]); list.add(map);
            
            String dataPoints1 = gsonObj.toJson(list);  
            
            p1=2;
            
            list = new ArrayList<Map<Object,Object>>();
            
            map = new HashMap<Object,Object>(); map.put("label", "Jan"); map.put("y",month[1][p1]); list.add(map);
            map = new HashMap<Object,Object>(); map.put("label", "Feb"); map.put("y",month[2][p1]); list.add(map);
            map = new HashMap<Object,Object>(); map.put("label", "March"); map.put("y",month[3][p1]); list.add(map);
            map = new HashMap<Object,Object>(); map.put("label", "April"); map.put("y",month[4][p1]); list.add(map);
            map = new HashMap<Object,Object>(); map.put("label", "May"); map.put("y",month[5][p1]); list.add(map);
            map = new HashMap<Object,Object>(); map.put("label", "June"); map.put("y",month[6][p1]); list.add(map);
            map = new HashMap<Object,Object>(); map.put("label", "July"); map.put("y",month[7][p1]); list.add(map);
            map = new HashMap<Object,Object>(); map.put("label", "August"); map.put("y",month[8][p1]); list.add(map);
            map = new HashMap<Object,Object>(); map.put("label", "Oct"); map.put("y",month[9][p1]); list.add(map);
            map = new HashMap<Object,Object>(); map.put("label", "Sep"); map.put("y",month[10][p1]); list.add(map);
            map = new HashMap<Object,Object>(); map.put("label", "Nov"); map.put("y",month[11][p1]); list.add(map);
            map = new HashMap<Object,Object>(); map.put("label", "Dec"); map.put("y",month[12][p1]); list.add(map);
            
            String dataPoints2 = gsonObj.toJson(list);  
        %>
        
        
        window.onload = function() { 
 
            var chart = new CanvasJS.Chart("chartContainer", {
            theme: "dark2",
            title: {
                    text: "Recovered in <%=city1%>"
            },
            axisX: {
                    title: "Recovered"
            },
            axisY: {
                    title: "Recovered",
                    includeZero: true
            },
            data: [{
                    type: "line",
                    yValueFormatString: "#,## Recovered",
                    dataPoints : <%out.print(dataPoints);%>
            }]
            });

            chart.render();
            
            var chart1 = new CanvasJS.Chart("chartContainer1", {
            theme: "dark2",
            title: {
                    text: "Active in <%=city1%>"
            },
            axisX: {
                    title: "Active Cases"
            },
            axisY: {
                    title: "Active Cases",
                    includeZero: true
            },
            data: [{
                    type: "line",
                    yValueFormatString: "#,## Active",
                    dataPoints : <%out.print(dataPoints1);%>
            }]
            });

            chart1.render();
            
            var chart2 = new CanvasJS.Chart("chartContainer2", {
            theme: "dark2",
            title: {
                    text: "Deaths in <%=city1%>"
            },
            axisX: {
                    title: "Deaths"
            },
            axisY: {
                    title: "Deaths",
                    includeZero: true
            },
            data: [{
                    type: "line",
                    yValueFormatString: "#,## Death",
                    dataPoints : <%out.print(dataPoints2);%>
            }]
            });

            chart2.render();
        }


    </script>
    <body>
        
        
        <main>
            <p class="heading">Your selected city is <strong><%=city1%></strong></p>
            <div class="chart-container">
                <div class="chart" id="chartContainer"></div>
                <div class="chart" id="chartContainer1"></div>
                <div class="chart" id="chartContainer2"></div>
                <div class="chart" ><a href="index.html">Go To Home Page</a></div>
            </div>
        </main>
                
        
        


        <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
    </body>

