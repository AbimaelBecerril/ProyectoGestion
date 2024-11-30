<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>Actualizar Cliente</title>
</head>
<body>
    <h1>Actualizar Cliente</h1>
    <form action="ClienteServlet" method="post">
        <input type="hidden" name="accion" value="actualizar"/>
        <input type="hidden" name="index" value="${param.index}"/>
        Nombre: <input type="text" name="nombre" value="${cliente.nombre}"/><br/>
        Correo: <input type="text" name="correo" value="${cliente.correo}"/><br/>
        Teléfono: <input type="text" name="telefono" value="${cliente.telefono}"/><br/>
        Dirección: <input type="text" name="direccion" value="${cliente.direccion}"/><br/>
        <input type="submit" value="Actualizar"/>
    </form>
    <br/>
    <a href="index.jsp">Volver</a>
</body>
</html>