<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*, DataBase.Conexion" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Registrar Cliente</title>
</head>
<body>
    <h2>Registrar Nuevo Cliente</h2>
    <form action="registroCliente.jsp" method="post">
        Nombre: <input type="text" name="nombre" required><br>
        Correo: <input type="email" name="correo" required><br>
        Teléfono: <input type="text" name="telefono" required><br>
        Dirección: <input type="text" name="direccion" required><br>
        <input type="submit" value="Registrar">
        <li>
            <a href="index.jsp">Página de Inicio</a>
        </li>
    </form>

    <% 
        // Verificamos si es un POST (es decir, si el formulario fue enviado)
        if (request.getMethod().equalsIgnoreCase("POST")) {
            // Obtención de los datos del formulario
            String nombre = request.getParameter("nombre");
            String correo = request.getParameter("correo");
            String telefono = request.getParameter("telefono");
            String direccion = request.getParameter("direccion");

            // Usamos la clase Conexion para obtener la conexión a la base de datos
            Connection conn = null;
            PreparedStatement stmt = null;

            try {
                // Crear una instancia de Conexion y obtener la conexión
                Conexion conexion = new Conexion(); // Asegúrate de usar el nombre correcto
                conn = conexion.conectar(); // Método estático o de instancia según la clase Conexion

                // Verificar si la conexión es válida
                if (conn == null) {
                    out.println("<p>Error: No se pudo establecer la conexión a la base de datos.</p>");
                    return; // Detenemos la ejecución si no hay conexión
                }

                // Crear la consulta SQL para insertar el cliente
                String sql = "INSERT INTO clientes (nombre, correo, telefono, direccion) VALUES (?, ?, ?, ?)";
                stmt = conn.prepareStatement(sql);
                stmt.setString(1, nombre);
                stmt.setString(2, correo);
                stmt.setString(3, telefono);
                stmt.setString(4, direccion);

                // Ejecutar la consulta
                int rowsAffected = stmt.executeUpdate();
                if (rowsAffected > 0) {
                    out.println("<p>Cliente registrado exitosamente.</p>");
                } else {
                    out.println("<p>Error al registrar cliente.</p>");
                }
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<p>Error: " + e.getMessage() + "</p>");
            } finally {
                // Cerrar recursos
                try {
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    %>
</body>
</html>
