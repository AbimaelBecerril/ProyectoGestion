<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Eliminar Cliente</title>
</head>
<body>
    <h2>Eliminar Cliente</h2>
    <form action="eliminarCliente.jsp" method="post">
        <label for="id">ID Cliente a Eliminar:</label><br>
        <input type="text" id="id" name="id" required><br><br>

        <input type="submit" value="Eliminar Cliente">
        <li>
                <a href="index.jsp">Pagina de Inicio</a>
          </li>
    </form>
</body>
</html>
