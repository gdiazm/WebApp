/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package acciones;

import dominio.Lugar;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DyO
 */
public class VaciarItinerario extends Accion {

    
    public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        HttpSession sesion = request.getSession();
        Collection<Lugar> itinerario = (Collection<Lugar>) sesion.getAttribute("itinerario");
        
        if(itinerario == null)
        {
           itinerario = new ArrayList<Lugar>();
           sesion.setAttribute("itinerario", itinerario);
        }
        
        itinerario.clear(); 
        
        return "/itinerario.jsp";
    }
}
