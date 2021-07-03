<%-- 
    Document   : salir
    Created on : 07-03-2021, 10:56:49 AM
    Author     : Alexishm10
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<!DOCTYPE html>
<html>
    
    <body>         
        <%String identificador=(String)session.getAttribute("identificador"); 
        String fechaYhora = null;
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
            fechaYhora= dtf.format(LocalDateTime.now());
            try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bd_agenda?useSSL=false","root","UesOcc");
            
            Statement stm=con.createStatement();
            stm.executeUpdate("INSERT INTO salidas(fecha_salida,salida) "
                    + "VALUES('"+fechaYhora+"','"+identificador+"');");
         ResultSet rs=stm.executeQuery("select * from salidas where fecha_salida='"+fechaYhora+"' and salida='"+identificador+"'");
            if(rs.next()){
                
                out.println("<script> alert('Ha salido, Vuelva pronto!!!'); </script>");
            out.println("<head><META HTTP-EQUIV=\"REFRESH\" CONTENT=\"1; URL=index.html\"></head>");
                 
            }else{
             out.println("<script> alert('No ha salido!!!'); </script>");
            
            }
            }catch(Exception e){
            System.out.print("No se conecto"); 
            }
        
        
        
        
        %>
        
        
        
        
        
    </body>
</html>
