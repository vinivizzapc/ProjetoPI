package command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Pedido;
import service.PedidoService;

public class AdicionarCarrinho implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if(request.getSession().getAttribute("idCliente")==null) {
			response.sendRedirect("Login.jsp");
			return ;
		}
		int idCliente = (Integer)request.getSession().getAttribute("idCliente");
		int idProduto = Integer.parseInt(request.getParameter("idProduto"));
		PedidoService ps = new PedidoService();
		Pedido carrinho = ps.listarPedidosCarrinho(idCliente);
		
		ps.inserirCarrinho(carrinho.getIdPedido(), idProduto);
		
		new Carrinho().executar(request, response);
	}
}
