<%-- 
    Document   : salidas
    Created on : 07-03-2021, 12:33:39 PM
    Author     : Alexishm10
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="agenda.css">
    <link rel="stylesheet" href="menu.css">
     <link rel="stylesheet" href="tablas.css">
    </head>
    <div id="menu">
		<ul>
			<li><a href="llenaragenda.jsp">Agenda</a></li>
			<li><a href="veragenda.jsp">Ver registros agendados</a></li>
			<li><a href="entrada.jsp">Entradas</a></li>
                        <li><a href="salida.jsp">Salidas</a></li>
			<li class="item-r"><a href="salir.jsp">Salir</a></li>
		</ul>
    </div>
    
    <body>
        <%
    Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bd_agenda?useSSL=false","root","UesOcc");
            
            Statement stm=con.createStatement();
            ResultSet rs=stm.executeQuery("select * from salidas ");
               
    %>
    <div>
        <table align="center">
            <tr>
                <th>ID</th>
                <th>Fecha y hora</th>
                <th>Carnet usuario</th>
                </tr>
                <%
                while(rs.next()){
                %>
                <tr>
                    <td><%= rs.getInt("id")%></td>
                    <td><%= rs.getString("fecha_salida")%></td>
                    <td><%= rs.getString("salida")%></td>
                    
                </tr>
                
                
            <% }%>
        </table>
        
    </div>
    </body>
</html>
