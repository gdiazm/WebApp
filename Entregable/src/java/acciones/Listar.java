/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package acciones;

import dao.LugarDAO;
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
public class Listar extends Accion
{
    public String execute(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        try
        {
            String ciudad=request.getParameter("busqueda");
            LugarDAO dao = LugarDAO.getInstance();
            HttpSession sesion= request.getSession();
            Collection<Lugar> lista = null;
            
            if(ciudad!=null)
            {
                lista = dao.findByCiudad(ciudad);

                if(lista!=null)
                {
                    String nombre= ciudad.toUpperCase();
                    sesion.setAttribute("ciudad",nombre);
                }
            }
            
            sesion.setAttribute("listaLugares",lista);
             
        }
        catch (ClassNotFoundException ex) 
        {
            Logger.getLogger(Listar.class.getName()).log(Level.SEVERE, null, ex);
        }
        catch (SQLException ex) 
        {
            Logger.getLogger(Listar.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "listadoLugares.jsp";
    }
}
