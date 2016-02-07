/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package acciones;

import dao.ComentarioDAO;
import dao.LugarDAO;
import dominio.Comentario;
import dominio.Lugar;
import dominio.Usuario;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Gonzalo
 */
public class Comentar extends Accion
{
    public String execute(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        try {
            
            float nota = Float.parseFloat(request.getParameter("nota"));
            String opinion= request.getParameter("texto");
            HttpSession sesion= request.getSession();
            String usuario= ((Usuario)sesion.getAttribute("user")).getNombre();
            int idlugar= ((Lugar)sesion.getAttribute("lugar")).getId();
            
            ComentarioDAO dao= ComentarioDAO.getInstance();
            int idcomentario= dao.getTotal();
            Comentario comentario= new Comentario(usuario,idcomentario,idlugar,nota,opinion);
            
            dao.escribir(comentario);
            
            Collection<Comentario>lista= (Collection<Comentario>)dao.findByLugar(idlugar);
            
            if(lista!=null)
            {
                sesion.setAttribute("comentarios",lista);
            }
            
            
           
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Comentar.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Comentar.class.getName()).log(Level.SEVERE, null, ex);
        }
         return "lugares.jsp";
    }
}    
