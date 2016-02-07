/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servicios;

import acciones.Accion;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author DyO
 */
public class MVC 
{
    public static Accion getAccion(String url)
    {
        Accion accion = null;
        try
        {
            int pos = url.indexOf('.');
            String nombreClaseAccion = url.substring(1, pos);
            Class claseAccion = Class.forName("acciones." + nombreClaseAccion);
            accion = (Accion)claseAccion.newInstance();
        }
        catch (ClassNotFoundException ex) 
        {
            Logger.getLogger(MVC.class.getName()).log(Level.SEVERE, null, ex);
        }
        catch (InstantiationException ex) 
        {
            Logger.getLogger(MVC.class.getName()).log(Level.SEVERE, null, ex);
        } 
        catch (IllegalAccessException ex) 
        {
            Logger.getLogger(MVC.class.getName()).log(Level.SEVERE, null, ex);
        }
        return accion;
    }
}
