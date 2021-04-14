package command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Pedido;
import service.PedidoService;

public class ListarPedidoCliente implements Command{

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int idCliente = (Integer)request.getSession().getAttribute("idCliente");
		
		PedidoService ps = new PedidoService();
		ArrayList<Pedido> lista = null;
		lista = ps.VisualizarPedido(idCliente);
		
		request.setAttribute("lista", lista);
		RequestDispatcher dispatcher = request.getRequestDispatcher("VisualizarMeusPedidos.jsp");
		dispatcher.forward(request, response);
	}
}
