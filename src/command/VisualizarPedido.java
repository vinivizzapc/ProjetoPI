package command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Pedido;
import service.PedidoService;

public class VisualizarPedido implements Command{

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); 
		String pIdPedido = request.getParameter("idPedido");
		
		int idPedido = -1;
		try {
			idPedido = Integer.parseInt(pIdPedido);
		} catch (NumberFormatException e) {
		
		}
		
		Pedido pedido = new Pedido();
		pedido.setIdPedido(idPedido);
		
		PedidoService ps = new PedidoService();
		RequestDispatcher view = null;
		
		pedido = ps.carregar(pedido.getIdPedido());
		request.setAttribute("pedido", pedido);
		view = request.getRequestDispatcher("VisualizarPedido.jsp");
		view.forward(request, response);
	}
}
