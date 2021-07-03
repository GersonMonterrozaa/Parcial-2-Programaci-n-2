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
@WebServlet(urlPatterns = {"/agenda"})
public class agenda extends HttpServlet {

 
    
    
    

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out=response.getWriter();
        
          boolean bandera=false;
        String carnet=request.getParameter("carnet");     
       String fecha=request.getParameter("fecha");
       String hora=request.getParameter("hora");
       String descripcion=request.getParameter("descripcion");
       ;
            
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bd_agenda?useSSL=false","root","UesOcc");
            
            Statement stm=con.createStatement();
            stm.executeUpdate("INSERT INTO agenda(fecha,hora,registro,fk_id_carnet) "
                    + "VALUES('"+fecha+"','"+hora+"','"+descripcion+"','"+carnet+"');");
         ResultSet rs=stm.executeQuery("select * from agenda where fecha='"+fecha+"' and registro='"+descripcion+"'");
            if(rs.next()){
                bandera=true;
                out.println("<script> alert('El registro se añadio con exito!!!'); </script>");
            out.println("<head><META HTTP-EQUIV=\"REFRESH\" CONTENT=\"1; URL=llenaragenda.jsp\"></head>");
                 
            }else{
             out.println("<script> alert('El usuario no se pudo crear, intente de nuevo!!!'); </script>");
            out.println("<head><META HTTP-EQUIV=\"REFRESH\" CONTENT=\"1; URL=llenaragenda.jsp\"></head>");
            }
            }catch(Exception e){
            System.out.print("No se conecto"); 
            }
        if(bandera==false){out.println("<script> alert('El registro no se pudo crear, intente de nuevo!!!'); </script>");
            out.println("<head><META HTTP-EQUIV=\"REFRESH\" CONTENT=\"1; URL=llenaragenda.jsp\"></head>");}

        
    }
}
