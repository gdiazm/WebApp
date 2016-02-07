/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package acciones;

import dao.LugarDAO;
import dominio.Lugar;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
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
public class Agregar extends Accion
{
    public String execute(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        try 
        {
            int id = Integer.parseInt(request.getParameter("id"));
            LugarDAO dao = LugarDAO.getInstance();
            Lugar lugar = dao.findById(id);
            HttpSession sesion = request.getSession();
            Collection<Lugar> itinerario = (Collection<Lugar>) sesion.getAttribute("itinerario");
            
            if(itinerario== null)
            {
               itinerario = new ArrayList<Lugar>();
               sesion.setAttribute("itinerario", itinerario);
            }
            
            itinerario.add(lugar);           
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Agregar.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Agregar.class.getName()).log(Level.SEVERE, null, ex);
        }
        
       
        return "itinerario.jsp";
    }
            
}
