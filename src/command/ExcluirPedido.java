package command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Pedido;
import service.PedidoService;

public class ExcluirPedido implements Command{

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
		
		PedidoService ps = new PedidoService();
		
		RequestDispatcher view = null;
		
		ps.excluir(pedido.getIdPedido());
		request.setAttribute("deletePedido", "Pedido Excluido");
		view = request.getRequestDispatcher("controller.do?command=ListarPedido");
		view.forward(request, response);
	}
	
	public int busca(Pedido colecao, ArrayList<Pedido> lista) {
		Pedido to;
		for (int i = 0; i < lista.size(); i++) {
			to = lista.get(i);
			if (to.getIdPedido() == colecao.getIdPedido()) {
				return i;
			}
		}
		return -1;
	}
}
