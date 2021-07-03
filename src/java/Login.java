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
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Alexishm10
 */
@WebServlet(urlPatterns = {"/Login"})
public class Login extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Login</title>");            
            out.println("</head>");
            out.println("<body>");
           
            out.println("</body>");
            out.println("</html>");
        
        response.setContentType("text/html");
            String carnet=request.getParameter("usuario");
            String password=request.getParameter("password");
            HttpSession sesion=request.getSession();
            sesion.setAttribute("identificador",carnet);
            try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bd_agenda?useSSL=false","root","UesOcc");
            
            Statement stm=con.createStatement();
            ResultSet rs=stm.executeQuery("select * from usuario where id_carnet='"+carnet+"' and contraseña='"+password+"'");
            if(rs.next()){
                String fechaYhora = null;
                DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
            fechaYhora= dtf.format(LocalDateTime.now());
            try{
            Class.forName("com.mysql.jdbc.Driver");
            //Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bd_agenda?useSSL=false","root","UesOcc");
            
            //Statement stm=conn.createStatement();
            stm.executeUpdate("INSERT INTO entradas(fecha_entrada,entrada) "
                    + "VALUES('"+fechaYhora+"','"+carnet+"');");
           
            }catch(Exception e){
            System.out.print("No se conecto"); 
            }
                
                
                
             out.println("<script> alert('Inicio de sesion correcto!!');</script>");
             out.print("<head><META HTTP-EQUIV=\"REFRESH\" CONTENT=\"1; URL=agenda.html\"></head>");
             response.sendRedirect("llenaragenda.jsp");
             
            
             
            }else{
                out.print("<head><META HTTP-EQUIV=\"REFRESH\" CONTENT=\"1; URL=index.html\"></head>");
            out.println("<script> alert('Error de carnet o contraseña, intentelo de nuevo!!');</script>");
             //response.sendRedirect("index.html");
            }
            }catch(Exception e){
            System.out.print("No se conecto"); 
            }
        }
        
        
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
