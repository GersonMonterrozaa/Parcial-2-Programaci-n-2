
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body> <h1>bienvenido 
        <% 
            String carnet=request.getParameter("carnet");
            
            //out.print(carnet);
            out.print("sirve");
            
            //out.print(session.getAttribute("carnet"));
                
            %>
            </h1>
    </body>
</html>
