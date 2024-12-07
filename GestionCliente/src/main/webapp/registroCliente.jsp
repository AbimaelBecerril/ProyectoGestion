<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*" %>
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
        // Verificamos si es un post (es decir, si el formulario fue enviado)
        if (request.getMethod().equalsIgnoreCase("POST")) {
            // Obtención de los datos del formulario
            String nombre = request.getParameter("nombre");
            String correo = request.getParameter("correo");
            String telefono = request.getParameter("telefono");
            String direccion = request.getParameter("direccion");
            
            // Establecer conexión a la base de datos
            String url = "jdbc:mysql://localhost:3306/clientesdb";  // Cambia por tu URL
            String user = "admin";  // Cambia por tu usuario
            String password = "admin";  // Cambia por tu contraseña

            Connection conn = null;
            PreparedStatement stmt = null;

            try {
                // Cargar el driver JDBC
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Establecer la conexión
                conn = DriverManager.getConnection(url, user, password);

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
