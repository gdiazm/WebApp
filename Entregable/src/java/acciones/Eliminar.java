/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package acciones;

import dominio.Lugar;
import java.io.IOException;
import java.util.Collection;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Eliminar extends Accion {

    
    public String execute(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        int id = Integer.parseInt(request.getParameter("id"));
        HttpSession sesion = request.getSession();
        Collection<Lugar> itinerario = (Collection<Lugar>) sesion.getAttribute("itinerario");
        
        if(itinerario != null)
        {
            itinerario.remove(new Lugar(id));
        }
        
        for(Lugar l: itinerario)
            System.out.println(l.toString());
        
        return "/itinerario.jsp";
        
    }
}