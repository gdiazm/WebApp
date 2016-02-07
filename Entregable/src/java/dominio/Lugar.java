/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dominio;

/**
 *
 * @author Gonzalo
 */
public class Lugar {

    private String nombre;
    private int id;
    private String ciudad;
    private String tipo;
    private String imagen;
    private float valoracion;
    private String comentario;
    private String url;
    private String direccion;

    public Lugar(String nombre, int id, String ciudad, String tipo, String imagen, float valoracion, String comentario, String url, String direccion) {
        this.nombre = nombre;
        this.id = id;
        this.ciudad = ciudad;
        this.tipo = tipo;
        this.imagen = imagen;
        this.valoracion = valoracion;
        this.comentario = comentario;
        this.url = url;
        this.direccion = direccion;
    }
    
    
    
    public Lugar(int id)
    {
        this.id = id;
    }
    
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public float getValoracion() {
        return valoracion;
    }

    public void setValoracion(float valoracion) {
        this.valoracion = valoracion;
    }

    public String getComentario() {
        return comentario;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }
    
    
    @Override
    public String toString()
    {
        return this.nombre;
    }

      @Override
    public boolean equals(Object o) 
    {
        Lugar l = (Lugar) o;
        if (id == l.getId())
            return true;
        else
            return false;
    }    

    @Override
    public int hashCode() 
    {
        return id;
    }  

    
    
}
