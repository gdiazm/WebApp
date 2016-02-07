package dao;

import java.sql.*;
import java.util.*;

import dominio.Comentario;

public class ComentarioDAO
{
    private static String QUERY_COMENTARIO_BY_LUGAR = "SELECT * FROM Comentario WHERE idlugar = ?";
    private static String QUERY_TODOS_COMENTARIOS = "SELECT * FROM Comentario";
    private static String ESCRIBIR="INSERT into Comentario(usuario, idcomentario, idlugar, nota, opinion) values(?, ?, ?, ?, ?)";
    
    private static ComentarioDAO dao;
    private static Connection c;

    private ComentarioDAO() throws ClassNotFoundException, SQLException
    {
	Class.forName("com.mysql.jdbc.Driver");
        String bd = "jdbc:mysql://127.0.0.1/java";
	c = DriverManager.getConnection(bd, "root", "");
    }
    
    public static ComentarioDAO getInstance() throws ClassNotFoundException, SQLException
    {
        if(dao == null || !c.isValid(0))
        {
            dao = new ComentarioDAO();
            System.out.println("Nueva DAO");
        }
            
        return dao;
    }
    
    public void close() throws SQLException
    {
            c.close();
    }

   
    public Collection<Comentario> findByLugar(int idLugar) throws SQLException
    {
        ArrayList<Comentario> lista = new ArrayList<Comentario>();
        PreparedStatement ps = c.prepareStatement(QUERY_COMENTARIO_BY_LUGAR);
        ps.setInt(1, idLugar);
        ResultSet rs = ps.executeQuery();

        while (rs.next())
        {
            String usuario= rs.getString("usuario");
            int idComentario= rs.getInt("idcomentario");
            float nota= rs.getFloat("nota");
            String opinion= rs.getString("opinion");
            Comentario c= new Comentario(usuario,idComentario,idLugar,nota,opinion);
            lista.add(c);
        }

        rs.close();
        ps.close();
        return lista;
    }
    
    public int getTotal()throws SQLException
    {
        int total=0;
        PreparedStatement ps = c.prepareStatement(QUERY_TODOS_COMENTARIOS);
        ResultSet rs = ps.executeQuery();
        
        while (rs.next())
        {
            total++;
        }
        
        total+=1;
        
        return total;
    }
    
    public void escribir(Comentario com)throws SQLException
    {
        PreparedStatement ps = c.prepareStatement(ESCRIBIR);
        
        ps.setString(1,com.getUsuario());
        ps.setInt(2,com.getIdcomentario());
        ps.setInt(3,com.getIdlugar());
        ps.setFloat(4,com.getNota());
        ps.setString(5,com.getOpinion());
        ps.executeUpdate();
        
        ps.close();
        
    }
    
    
}
