/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Alexishm10
 */
@WebServlet(urlPatterns = {"/CrearUsuario"})
public class CrearUsuario extends HttpServlet {

 

  
 

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out=response.getWriter();
        
        boolean bandera=false;
        String carnet=request.getParameter("carnet");     
       String nombre=request.getParameter("nombre");
       String apellido=request.getParameter("apellido");
       String direccion=request.getParameter("direccion");
       String telefono=request.getParameter("telefono");
            String password=request.getParameter("password");
            
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bd_agenda?useSSL=false","root","UesOcc");
            
            Statement stm=con.createStatement();
            stm.executeUpdate("INSERT INTO usuario(id_carnet,nombre,apellido,direccion,telefono,contraseña) "
                    + "VALUES('"+carnet+"','"+nombre+"','"+apellido+"','"+direccion+"','"+telefono+"','"+password+"');");
         ResultSet rs=stm.executeQuery("select * from usuario where id_carnet='"+carnet+"' and contraseña='"+password+"'");
            if(rs.next()){
                bandera=true;
                out.println("<script> alert('Usuario creado con exito!!!'); </script>");
            out.println("<head><META HTTP-EQUIV=\"REFRESH\" CONTENT=\"1; URL=index.html\"></head>");
                 
            }else{
             out.println("<script> alert('El usuario no se pudo crear, intente de nuevo!!!'); </script>");
            out.println("<head><META HTTP-EQUIV=\"REFRESH\" CONTENT=\"1; URL=Usuario.html\"></head>");
            }
            }catch(Exception e){
            System.out.print("No se conecto"); 
            }
        if(bandera==false){out.println("<script> alert('El usuario no se pudo crear, intente de nuevo!!!'); </script>");
            out.println("<head><META HTTP-EQUIV=\"REFRESH\" CONTENT=\"1; URL=Usuario.html\"></head>");}

        
    }

    

}
