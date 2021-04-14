package command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Pedido;
import service.PedidoService;

public class CancelarPedido implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String pIdPedido = request.getParameter("idPedido");
		
		int idPedido = -1;
		try {
			idPedido = Integer.parseInt(pIdPedido);
		} catch (NumberFormatException e) {
		
		}
		
		Pedido pedido = new Pedido();
		pedido.setIdPedido(idPedido);
		
		PedidoService cs = new PedidoService();
		RequestDispatcher view = null;
		
		cs.atualizarCancel(pedido);
		request.setAttribute("pedido", pedido);
		view = request.getRequestDispatcher("controller.do?command=ListarPedidoCliente");
		
		view.forward(request, response);
	}
}
