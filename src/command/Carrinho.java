package command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ItemPedido;
import model.Pedido;
import service.PedidoService;
import service.ProdutoService;

public class Carrinho implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if(request.getSession().getAttribute("idCliente")==null) {
			response.sendRedirect("Login.jsp");
			return ;
		}
		int idCliente = (Integer)request.getSession().getAttribute("idCliente");
		
		PedidoService ps = new PedidoService();
		Pedido carrinho = ps.listarPedidosCarrinho(idCliente);
		
		ProdutoService produtoService = new ProdutoService();
		ArrayList<ItemPedido> lista = ps.ListarItensPedido(carrinho.getIdPedido());
		for(ItemPedido p:lista) {
			p.setProduto(produtoService.carregarProduto(p.getIdProduto()));
			p = ps.carregarItem(p.getIdPedido());
			request.setAttribute("itemPedido", p);
		}
		request.setAttribute("carrinho", carrinho);
		request.setAttribute("listaCarrinho", lista);
		request.getRequestDispatcher("Carrinho.jsp").forward(request, response);
	}
}
