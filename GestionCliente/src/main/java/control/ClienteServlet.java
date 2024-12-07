package control;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DataBase.ClienteDAO;
import modelo.Cliente;

/**
 * Servlet implementation class ClienteServlet
 */
@WebServlet("/ClienteServlet")
public class ClienteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	private ClienteDAO clienteDAO;

    @Override
    public void init() throws ServletException {
        clienteDAO = new ClienteDAO();
    }
        
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		List<Cliente> clientes = null;
		clientes = clienteDAO.obtenerClientes();
        request.setAttribute("clientes", clientes);

        // Enviar la lista de clientes a la JSP
        RequestDispatcher dispatcher = request.getRequestDispatcher("registroCliente.jsp");
        dispatcher.forward(request, response);
	}

		

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		 String nombre = request.getParameter("nombre");
	        String correo = request.getParameter("correo");
	        String telefono = request.getParameter("telefono");
	        String direccion = request.getParameter("direccion");

	        Cliente cliente = new Cliente(0, nombre, correo, telefono, direccion);
	        ClienteDAO.registrarCliente(cliente);
	        response.sendRedirect("registroCliente.jsp");
	}
}