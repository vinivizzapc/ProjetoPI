package command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ItemPedido;
import service.PedidoService;

public class ExcluirCarrinho implements Command{

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String pIdProduto = request.getParameter("idProduto");
		String pIdPedido = request.getParameter("idPedido");
		
		int idPedido = 1;
		
		try {
			idPedido = Integer.parseInt(pIdPedido);
		}catch (NumberFormatException e) {
			
		}
		
		int idProduto = 1;
		
		try {
			idProduto = Integer.parseInt(pIdProduto);
		}catch (NumberFormatException e) {
			
		}
		
		ItemPedido item = new ItemPedido();
		item.setIdPedido(idPedido);
		item.setIdProduto(idProduto); 
		
		PedidoService ps = new PedidoService();
		
		RequestDispatcher view = null;
		 
		ps.excluirItem(idPedido, idProduto);
		
		view = request.getRequestDispatcher("controller.do?command=Carrinho");
		view.forward(request, response);
	}
}
