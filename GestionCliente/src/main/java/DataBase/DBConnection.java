package DataBase;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.swing.JOptionPane;

public class DBConnection {
    private String Clientedb="clientesdb";
	private String URL = "jdbc:mysql://localhost:3306/"+Clientedb+"?useUnicode=true&use"
    		+"JDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&"
    		+"serverTimezone=UTC";
    private String USER = "admin"; 
    private String PASSWORD = "admin";  
    
    static Connection conn=null;
    
    public DBConnection () throws SQLException {
    	try {
    		Class.forName("com.mysql.cj.jdbc.Driver");
    		conn=DriverManager.getConnection(URL,USER,PASSWORD);
    		if (conn!=null) {
    			System.out.println("Conexion Existosa a la base de Datos: "+Clientedb);
    		}
    	}catch (ClassNotFoundException e) {
    		System.out.println(" ocurre una ClassNotFoundException: " +e.getMessage());
    	}catch (SQLException e) {
    		System.out.println(" ocurre una SQLException: " +e.getMessage());
    	}
    }
    public static DBConnection getConnection() {
    	try {
			return (DBConnection) conn;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
    }
}
