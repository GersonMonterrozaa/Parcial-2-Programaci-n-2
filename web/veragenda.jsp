<%-- 
    Document   : veragenda
    Created on : 07-03-2021, 11:55:34 AM
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
                        <li><a href="salidas.jsp">Salidas</a></li>
			<li class="item-r"><a href="salir.jsp">Salir</a></li>
		</ul>
        
    </div>
    <br><br>
    <form align="center">
        <input type="text" name="buscar" placeholder="Busar por carnet"required>
        <input type=submit value="buscar">
    </form>
    
    <%
        String buscar=request.getParameter("buscar");
        
    Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bd_agenda?useSSL=false","root","UesOcc");
            
            Statement stm=con.createStatement();
            ResultSet rs=stm.executeQuery("select * from agenda where fk_id_carnet='"+buscar+"' ");
            
    
    %>
    
    <div>
        <table align="center">
            <tr>
                <th>ID</th>
                <th>Fecha </th>
                <th>Hora </th>
                <th>Registro</th>
                <th>Carnet</th>
                </tr>
                <%
                while(rs.next()){
                %>
                <tr>
                    <td><%= rs.getInt("id_agenda")%></td>
                    <td><%= rs.getString("fecha")%></td>
                    <td><%= rs.getString("hora")%></td>
                    <td><%= rs.getString("registro")%></td>
                    <td><%= rs.getString("fk_id_carnet")%></td>
                    
                </tr>
                
                
            <% }%>
        </table>
        
    </div>
    
    <body>
        
    </body>
</html>
