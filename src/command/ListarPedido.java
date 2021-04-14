package command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Pedido;
import service.PedidoService;

public class ListarPedido implements Command{

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String chave = request.getParameter("data[search]"); 
		PedidoService ps = new PedidoService();
		ArrayList<Pedido> lista = null;
		HttpSession session = request.getSession();
		
			if (chave != null && chave.length() > 0) {
				lista = ps.listarPedidos(chave);
			} 
			else {
				lista = ps.listarPedidos();
			}
			session.setAttribute("lista", lista);
			
		RequestDispatcher dispatcher = request
		.getRequestDispatcher("ListarPedidos.jsp");
		dispatcher.forward(request, response);
	}
}
