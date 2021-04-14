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

public class Pedidos implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if(request.getSession().getAttribute("idCliente")==null) {
			response.sendRedirect("Login.jsp");
			return ;
		}
		int idCliente = (Integer)request.getSession().getAttribute("idCliente");
		String pIdPedido = request.getParameter("idPedido");
		
		int idPedido = -1;
		try {
			idPedido = Integer.parseInt(pIdPedido);
		}catch(NumberFormatException e) {
			
		}
		
		PedidoService ps = new PedidoService();
		Pedido carrinho = ps.listarPedidosClientes(idCliente, idPedido);
		
		ProdutoService produtoService = new ProdutoService();
		ArrayList<ItemPedido> lista = ps.ListarItensPedido(carrinho.getIdPedido());
		for(ItemPedido p:lista) {
			p.setProduto(produtoService.carregarProduto(p.getIdProduto()));
			p = ps.carregarItem(p.getIdPedido());
			request.setAttribute("itemPedido", p);
		}
		request.setAttribute("carrinho", carrinho);
		request.setAttribute("listaCarrinho", lista);
		request.getRequestDispatcher("MeusPedidos.jsp").forward(request, response);
	}
}
