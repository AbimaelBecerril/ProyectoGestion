package DataBase;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import modelo.Cliente;

public class ClienteDAO {

    private static Connection connection;

    // Constructor que recibe la conexión desde la clase Conexion
    public ClienteDAO() {
        // Usamos la conexión estática proporcionada por la clase Conexion
        ClienteDAO.connection = Conexion.conectar();
    }

    // Método para insertar un nuevo cliente
    public static boolean insertarCliente(Cliente cliente) {
        String query = "INSERT INTO clientes (nombre, telefono, correo, direccion) VALUES (?, ?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, cliente.getNombre());
            stmt.setString(2, cliente.getTelefono());
            stmt.setString(3, cliente.getCorreo());
            stmt.setString(4, cliente.getDireccion());
            int filasAfectadas = stmt.executeUpdate();
            return filasAfectadas > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Método para obtener todos los clientes
    public List<Cliente> obtenerClientes() {
        List<Cliente> clientes = new ArrayList<>();
        String query = "SELECT * FROM clientes";
        try (Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                int id = rs.getInt("id");
                String nombre = rs.getString("nombre");
                String telefono = rs.getString("telefono");
                String correo = rs.getString("correo");
                String direccion = rs.getString("direccion");
                Cliente cliente = new Cliente(id, nombre, telefono, correo, direccion);
                clientes.add(cliente);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return clientes;
    }

    // Método para obtener un cliente por ID
    public Cliente obtenerClientePorId(int id) {
        String query = "SELECT * FROM clientes WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    String nombre = rs.getString("nombre");
                    String telefono = rs.getString("telefono");
                    String correo = rs.getString("correo");
                    String direccion = rs.getString("direccion");
                    return new Cliente(id, nombre, telefono, correo, direccion );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Método para actualizar un cliente
    public boolean actualizarCliente(Cliente cliente) {
        String query = "UPDATE clientes SET nombre = ?, telefono = ?, correo = ?, direccion = ? WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, cliente.getNombre());
            stmt.setString(2, cliente.getTelefono());
            stmt.setString(3, cliente.getCorreo());
            stmt.setString(4, cliente.getDireccion());
            stmt.setInt(5, cliente.getId());
            int filasAfectadas = stmt.executeUpdate();
            return filasAfectadas > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Método para eliminar un cliente
    public boolean eliminarCliente(int id) {
        String query = "DELETE FROM clientes WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, id);
            int filasAfectadas = stmt.executeUpdate();
            return filasAfectadas > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static void registrarCliente(Cliente cliente) {
        // TODO Auto-generated method stub
    }
}