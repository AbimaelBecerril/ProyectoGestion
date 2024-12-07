<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List, modelo.Cliente, DataBase.ClienteDAO" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Lista de Clientes</title>
</head>
<body>
    <h2>Lista de Clientes</h2>

    <% 
        // Obtener la lista de clientes desde el request
        List<Cliente> clientes = (List<Cliente>) request.getAttribute("clientes");

        if (clientes != null && !clientes.isEmpty()) {
    %>
        <table border="1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Correo</th>
                    <th>Teléfono</th>
                    <th>Dirección</th>
                </tr>
            </thead>
            <tbody>
                <% for (Cliente cliente : clientes) { %>
                    <tr>
                        <td><%= cliente.getId() %></td>
                        <td><%= cliente.getNombre() %></td>
                        <td><%= cliente.getCorreo() %></td>
                        <td><%= cliente.getTelefono() %></td>
                        <td><%= cliente.getDireccion() %></td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    <% 
        } else {
            out.println("<p>No hay clientes registrados.</p>");
        }
    %>
      <li>
                <a href="index.jsp">Pagina de Inicio</a>
            </li>
    
</body>
</html>
