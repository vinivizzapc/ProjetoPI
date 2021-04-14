package command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Pedido;
import service.PedidoService;

public class AlterarPedido implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String pIdPedido = request.getParameter("idPedido");
		String pIdCliente = request.getParameter("idCliente");
		String pValorTotal = request.getParameter("valorTotal");
		String pFormaPagamento = request.getParameter("formaPagamento_idPagamento");
		String pStatus = request.getParameter("status");
		
		int idPedido = -1;
		try {
			idPedido = Integer.parseInt(pIdPedido);
		} catch (NumberFormatException e) {
		
		}
		
		double valorTotal = 0.0;
		try {
			valorTotal = Double.parseDouble(pValorTotal);
		}catch(NumberFormatException e) {
			
		}
		
		int idCliente = -1;
		try {
			idCliente = Integer.parseInt(pIdCliente);
		} catch (NumberFormatException e) {
		
		}
		
		int formaPagamento_idPagamento = -1;
		try {
			formaPagamento_idPagamento = Integer.parseInt(pFormaPagamento);
		} catch (NumberFormatException e) {
		
		}
		
		Pedido pedido = new Pedido();
		pedido.setIdPedido(idPedido);
		pedido.setValorTotal(valorTotal);
		pedido.setStatus(pStatus);
		pedido.setCliente_idCliente(idCliente);
		pedido.setFormaPagamento_idPagamento(formaPagamento_idPagamento);

		
		PedidoService cs = new PedidoService();
		RequestDispatcher view = null;
		
		cs.atualizarAdm(pedido);
		request.setAttribute("pedido", pedido);
		request.setAttribute("alterPedido", "Pedido Alterado");
		view = request.getRequestDispatcher("VisualizarPedido.jsp");
		
		 view.forward(request, response);
	}

	public int busca(Pedido pedido, ArrayList<Pedido> lista) {
		Pedido to;
		for (int i = 0; i < lista.size(); i++) {
			to = lista.get(i);
			if (to.getIdPedido() == pedido.getIdPedido()) {

				return i;
			}
		}
		return -1;
	} 
}
