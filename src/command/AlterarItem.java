package command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ItemPedido;
import service.PedidoService;

public class AlterarItem implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String pIdPedido = request.getParameter("idPedido");
		String pIdProduto = request.getParameter("idProduto");
		String pQuantidade = request.getParameter("quantidade");

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
		
		int quantidade = 1;
		try {
			quantidade = Integer.parseInt(pQuantidade);
		}catch (NumberFormatException e) {
			
		}
		
		ItemPedido itemPedido = new ItemPedido();
		itemPedido.setIdPedido(idPedido);
		itemPedido.setIdProduto(idProduto);
		itemPedido.setQuantidade(quantidade); 
		
		PedidoService ps = new PedidoService();
		
		
		RequestDispatcher view = null;
		
		ps.atualizarItem(itemPedido);
		request.setAttribute("itemPedido", itemPedido);
		view = request.getRequestDispatcher("controller.do?command=Carrinho");
		 view.forward(request, response);
	}

}
