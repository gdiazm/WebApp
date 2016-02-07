/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package acciones;

import dao.ComentarioDAO;
import dao.LugarDAO;
import dominio.Comentario;
import dominio.Lugar;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Gonzalo
 */
public class Mostrar extends Accion
{
    public String execute(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        try 
        {
            int id = Integer.parseInt(request.getParameter("id"));
            LugarDAO daoLugar = LugarDAO.getInstance();
            Lugar lugar = daoLugar.findById(id);
            HttpSession sesion =request.getSession();
            
            if(lugar!=null)
            {
              sesion.setAttribute("lugar", lugar);
              
              ComentarioDAO daoC= ComentarioDAO.getInstance();
              Collection<Comentario>lista= (Collection<Comentario>)daoC.findByLugar(id);
              
              if(lista!=null)
              {
                  sesion.setAttribute("comentarios",lista);
              }
              
            }
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Mostrar.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Mostrar.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return "lugares.jsp";
    }
}
