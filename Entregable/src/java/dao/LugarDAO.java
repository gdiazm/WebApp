package dao;

import java.sql.*;
import java.util.*;

import dominio.Lugar;

public class LugarDAO
{
    private static String QUERY_LUGAR_BY_CIUDAD = "SELECT * FROM Lugar WHERE ciudad LIKE ?";
    private static String QUERY_LUGAR_BY_ID = "SELECT * FROM Lugar WHERE id = ?";
    private static String QUERY_LUGAR_BY_CIUDAD_AND_TIPO = "SELECT * FROM Lugar WHERE ciudad LIKE ? AND tipo = ?";
    private static String QUERY_FIND_ALL="SELECT * FROM LUGAR ORDER BY valoracion DESC";
    
    private static LugarDAO dao;
    private static Connection c;

    private LugarDAO() throws ClassNotFoundException, SQLException
    {
	Class.forName("com.mysql.jdbc.Driver");
        String bd = "jdbc:mysql://127.0.0.1/java";
	c = DriverManager.getConnection(bd, "root", "");
    }
    
    public static LugarDAO getInstance() throws ClassNotFoundException, SQLException
    {
        if(dao == null || !c.isValid(0))
        {
            dao = new LugarDAO();
            System.out.println("Nueva DAO");
        }
            
        return dao;
    }
    
    public void close() throws SQLException
    {
            c.close();
    }

   
    public Collection<Lugar> findByCiudad(String ciudad) throws SQLException
    {
        ArrayList<Lugar> lista = new ArrayList<Lugar>();
        PreparedStatement ps = c.prepareStatement(QUERY_LUGAR_BY_CIUDAD);
        ps.setString(1, "%" + ciudad + "%");
        ResultSet rs = ps.executeQuery();

        while (rs.next())
        {
            String nombre = rs.getString("nombre");
            int id = rs.getInt("id");
            String cd = rs.getString("ciudad");
            String tipo = rs.getString("tipo");
            String imagen = rs.getString("imagen");
            float valoracion= rs.getFloat("valoracion");
            String comentario= rs.getString("comentario");
            String url= rs.getString("url");
            String direccion=rs.getString("direccion");
            Lugar l = new Lugar(nombre,id,cd,tipo,imagen,valoracion,comentario,url,direccion);
            lista.add(l);
        }

        rs.close();
        ps.close();
        return lista;
    }   
    
     public Lugar findById(int id) throws SQLException
    {
        ArrayList<Lugar> lista = new ArrayList<Lugar>();
        PreparedStatement ps = c.prepareStatement(QUERY_LUGAR_BY_ID);
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();

        Lugar l = null;
        
        while (rs.next())
        {
            String nombre = rs.getString("nombre");
            String cd = rs.getString("ciudad");
            String tipo = rs.getString("tipo");
            String imagen = rs.getString("imagen");
            float valoracion= rs.getFloat("valoracion");
            String comentario= rs.getString("comentario");
            String url= rs.getString("url");
            String direccion=rs.getString("direccion");
            l = new Lugar(nombre,id,cd,tipo,imagen,valoracion,comentario,url,direccion);
        }

        rs.close();
        ps.close();
        return l;
    }   

    
    public Collection<Lugar> findByCiudadAndTipo(String ciudad,String tipo) throws SQLException
    {
        ArrayList<Lugar> lista = new ArrayList<Lugar>();
        PreparedStatement ps = c.prepareStatement(QUERY_LUGAR_BY_CIUDAD_AND_TIPO);
        ps.setString(1, "%" + ciudad + "%");
        ps.setString(2, "%" + tipo + "%");
        ResultSet rs = ps.executeQuery();

        Lugar l = null;
        
        while (rs.next())
        {
            String nombre = rs.getString("nombre");
            int id = rs.getInt("id");
            String cd = rs.getString("ciudad");
            String t = rs.getString("tipo");
            String imagen = rs.getString("imagen");
            float valoracion= rs.getFloat("valoracion");
            String comentario= rs.getString("comentario");
            String url= rs.getString("url");
            String direccion=rs.getString("direccion");
            l = new Lugar(nombre,id,cd,t,imagen,valoracion,comentario,url,direccion);
            lista.add(l);
        }

        rs.close();
        ps.close();
        return lista;
    }  
    
    public Collection<Lugar> findAll() throws SQLException
    {
        PreparedStatement ps = c.prepareStatement(QUERY_FIND_ALL);
        ResultSet rs = ps.executeQuery();
        ArrayList<Lugar> lista = new ArrayList<Lugar>();

        while (rs.next())
        {
            String nombre = rs.getString("nombre");
            int id = rs.getInt("id");
            String cd = rs.getString("ciudad");
            String tipo=rs.getString("tipo");
            String imagen = rs.getString("imagen");
            float valoracion= rs.getFloat("valoracion");
            String comentario= rs.getString("comentario");
            String url= rs.getString("url");
            String direccion=rs.getString("direccion");
            Lugar l = new Lugar(nombre,id,cd,tipo,imagen,valoracion,comentario,url,direccion);
            lista.add(l);
        }

        rs.close();
        ps.close();
        return lista;
    }   
        
    
    
}
