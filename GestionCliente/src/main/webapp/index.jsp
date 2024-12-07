<%@ page import="modelo.Cliente" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión de Clientes</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 100%;
            max-width: 600px;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: #333;
        }
        ul {
            list-style-type: none;
            padding: 0;
        }
        li {
            margin: 20px 0;
            text-align: center;
        }
        a {
            font-size: 18px;
            text-decoration: none;
            color: white;
            background-color: #4CAF50;
            padding: 10px 20px;
            border-radius: 5px;
        }
        a:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Gestión de Clientes</h1>
        <ul>
            <li>
                <a href="registroCliente.jsp">Registrar Cliente</a>
            </li>
            <li>
                <a href="actualizarCliente.jsp">Actualizar Datos del Cliente</a>
            </li>
            <li>
                <a href="eliminarCliente.jsp">Eliminar Cliente</a>
            </li>
             <li>
                <a href="listacliente.jsp">Clientes Registrados</a>
            </li>
        </ul>
    </div>
</body>
</html>
