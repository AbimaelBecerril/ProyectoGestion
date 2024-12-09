package DataBase;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class Conexion{
	
	private static String usuario = "root";
	private static String password = "admin";
	private static String url = "jdbc:mysql://localhost:3306:listaclientes";
	
	public static Connection conectar() {
		Connection conn =null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn= DriverManager.getConnection(url, usuario, password);
		} catch(SQLException e) {
			e.printStackTrace();
			System.out.println("Error de Conexion");
		} catch (ClassNotFoundException e) {
			System.out.println("Error de Driver");
			e.printStackTrace();
		}
		return conn;
	}}