/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dominio;

/**
 *
 * @author Gonzalo
 */
public class Comentario 
{
    private String usuario;
    private int idcomentario;
    private int idlugar;
    private float nota;
    private String opinion;

    public Comentario(String usuario, int idcomentario, int idlugar, float nota, String opinion) {
        this.usuario = usuario;
        this.idcomentario = idcomentario;
        this.idlugar = idlugar;
        this.nota = nota;
        this.opinion = opinion;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public int getIdcomentario() {
        return idcomentario;
    }

    public void setIdcomentario(int idcomentario) {
        this.idcomentario = idcomentario;
    }

    public int getIdlugar() {
        return idlugar;
    }

    public void setIdlugar(int idlugar) {
        this.idlugar = idlugar;
    }

    public float getNota() {
        return nota;
    }

    public void setNota(float nota) {
        this.nota = nota;
    }

    public String getOpinion() {
        return opinion;
    }

    public void setOpinion(String opinion) {
        this.opinion = opinion;
    }

    @Override
    public String toString() {
        return "Comentario{" + "usuario=" + usuario + ", idcomentario=" + idcomentario + ", idlugar=" + idlugar + ", nota=" + nota + ", opinion=" + opinion + '}';
    }
    
    
}
