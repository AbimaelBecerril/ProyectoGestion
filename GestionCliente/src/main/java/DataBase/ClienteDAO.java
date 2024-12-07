package DataBase;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import modelo.Cliente;

public class ClienteDAO {
    private Connection connection;

    public ClienteDAO() {
        try {
            // Conectar a la base de datos (ajustar a tus credenciales)
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/clientesdb", "usuario", "contraseña");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Cliente> obtenerClientes() {
        List<Cliente> clientes = new ArrayList<>();
        String query = "SELECT * FROM clientes";
        
        try (Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
             
            while (rs.next()) {
                int id = rs.getInt("id");
                String nombre = rs.getString("nombre");
                String correo = rs.getString("correo");
                String telefono = rs.getString("telefono");
                String direccion = rs.getString("direccion");
                
                Cliente cliente = new Cliente(id, nombre, correo, telefono, direccion);
                clientes.add(cliente);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return clientes;
    }

	public static void registrarCliente(Cliente cliente) {
		// TODO Auto-generated method stub
		
	}
		
}
