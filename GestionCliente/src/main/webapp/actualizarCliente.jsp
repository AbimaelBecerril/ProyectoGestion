<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Actualizar Cliente</title>
</head>
<body>
    <h2>Actualizar Datos de Cliente</h2>
    <form action="actualizarCliente.jsp" method="post">
        <label for="id">ID Cliente:</label><br>
        <input type="text" id="id" name="id" required><br><br>

        <label for="nombre">Nombre:</label><br>
        <input type="text" id="nombre" name="nombre"><br><br>

        <label for="email">Email:</label><br>
        <input type="email" id="email" name="email"><br><br>

        <label for="telefono">Teléfono:</label><br>
        <input type="text" id="telefono" name="telefono"><br><br>
        
        <label for="direccion">Direccion:</label><br>
        <input type="text" id="direccion" name="telefono"><br><br>

        <input type="submit" value="Actualizar Cliente">
        <li>
                <a href="index.jsp">Pagina de Inicio</a>
          </li>
    </form>
</body>
</html>
