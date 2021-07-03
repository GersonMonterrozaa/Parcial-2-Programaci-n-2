
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Formulario Login</title>
    <link rel="stylesheet" href="agenda.css">
    <link rel="stylesheet" href="menu.css">
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"
    />
    <link
      href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;500;600;700&display=swap"
      rel="stylesheet"
    />
  </head>
  <body>
      <div id="menu">
		<ul>
			<li><a href="llenaragenda.jsp">Agenda</a></li>
			<li><a href="veragenda.jsp">Ver registros agendados</a></li>
			<li><a href="entrada.jsp">Entradas</a></li>
                        <li><a href="salidas.jsp">Salidas</a></li>
			<li class="item-r"><a href="salir.jsp">Salir</a></li>
		</ul>
      </div>
   <section class="form-login">
            <h5>Agendar un suceso </h5>
            <form name="agenda" action="agenda" method="POST">
                
            carnet:<input class="controls" type="text" name="carnet" id="carnet"
                   placeholder="<%String identificador=(String)session.getAttribute("identificador"); out.println(identificador);%>"
                   value="<%out.println(identificador);%>" required ><br>
            Fecha:<input class="controls" type="text" name="fecha" id="fecha" placeholder="Ingresar fecha" required ><br>
            Hora:<input class="controls" type="text" name="hora" id="hora" placeholder="Ingresar hora" required ><br>
            Asunto:<textarea class="controls" name="descripcion" id="descripcion" placeholder="Ingresar suceso a agendar" required></textarea> <br>
            <input class="buttons" type="submit" name="enviar" id="agendar" value="Agendar">
           </form>
        <br><br><br>
    </section>
<div class="container">
      <div class="calendar">
        <div class="month">
          <i class="fas fa-angle-left prev"></i>
          <div class="date">
            <h1></h1>
            <p></p>
          </div>
          <i class="fas fa-angle-right next"></i>
        </div>
        <div class="weekdays">
          <div>Dom</div>
          <div>Lun</div>
          <div>Mar</div>
          <div>Mie</div>
          <div>Jue</div>
          <div>Vie</div>
          <div>Sab</div>
        </div>
        <div class="days"></div>
      </div>
    </div>

    <script src="script.js"></script>
  </body>
        
                
            
</html>
