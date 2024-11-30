<%@ page import="modelo.Cliente"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Gestión de Clientes</title>
    <style>
        /* Agrega tu estilo aquí */
    </style>
</head>
<body>
    <div class="container">
        <h1>Gestión de Clientes</h1>

        <!-- Mensaje de éxito o error -->
        <% 
            String successMessage = (String) request.getAttribute("successMessage");
            String errorMessage = (String) request.getAttribute("errorMessage");
            if (successMessage != null) { 
        %>
        <div class="message success">
            <%= successMessage %>
        </div>
        <% } %>
        
        <% if (errorMessage != null) { %>
        <div class="message error">
            <%= errorMessage %>
        </div>
        <% } %>

        <!-- Formulario para registrar un cliente -->
        <form action="ClienteServlet" method="post">
            <h3>Registrar Cliente</h3>
            <label for="nombre">Nombre</label>
            <input type="text" id="nombre" name="nombre" required />

            <label for="correo">Correo Electrónico</label>
            <input type="email" id="correo" name="correo" required />

            <label for="telefono">Teléfono</label>
            <input type="text" id="telefono" name="telefono" required />

            <label for="direccion">Dirección</label>
            <input type="text" id="direccion" name="direccion" required />

            <input type="submit" value="Registrar Cliente" />
        </form>

        <!-- Lista de Clientes -->
        <h3>Clientes Registrados</h3>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Correo</th>
                    <th>Teléfono</th>
                    <th>Dirección</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    List <Cliente> clientes = (List<Cliente>) request.getAttribute("cliente");
                    if (clientes != null && !clientes.isEmpty()) {
                        for (Cliente cliente : clientes) {
                %>
                <tr>
                    <td><%= cliente.getId() %></td>
                    <td><%= cliente.getNombre() %></td>
                    <td><%= cliente.getCorreo() %></td>
                    <td><%= cliente.getTelefono() %></td>
                    <td><%= cliente.getDireccion() %></td>
                    <td>
                        <a class="action-btn" href="ActualizarCliente?id=<%= cliente.getId() %>">Actualizar</a>
                        <a class="action-btn" href="EliminarCliente?id=<%= cliente.getId() %>">Eliminar</a>
                    </td>
                </tr>
                <% 
                        }
                    } else {
                %>
                <tr>
                    <td colspan="6" style="text-align: center;">No hay clientes registrados.</td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</body>
</html>