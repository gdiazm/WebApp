/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package acciones;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author DyO
 */
public abstract class Accion 
{
    
    /* Devuelve la vista */
    public abstract String execute(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException ;    
}
