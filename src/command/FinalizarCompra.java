package command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Pedido;
import model.Produto;
import service.PedidoService;
import service.ProdutoService;

public class FinalizarCompra implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String pIdPedido = request.getParameter("idPedido");
		int idCliente = (Integer)request.getSession().getAttribute("idCliente");
		String idFormaPagamento = request.getParameter("pagamento");	
		String valorTotal = request.getParameter("total");
		String[] idProdutos = request.getParameterValues("idProduto");
		String[] qtdeEstoqProdutos = request.getParameterValues("Quantidade");
		
		int[] produtosOK = new int[idProdutos.length];
		int[] quantidadeOK = new int[qtdeEstoqProdutos.length];
		int  contador = 0;
		
		int pedidosOK = 0;
		int pedidosRollback = 0;
		int idPedido = -1;
		int idProduto = -1;
		int quantidade = -1;	
		
		try {
			idPedido = Integer.parseInt(pIdPedido);
		} catch (NumberFormatException e) {
		
		}
		
		int pagamento = -1;
		try {
			pagamento = Integer.parseInt(idFormaPagamento);
		} catch (NumberFormatException e) {
		
		}
		
		double total = 0.0;
		try {
			total = Double.parseDouble(valorTotal);
		} catch (NumberFormatException e) {
		
		}
		
		Pedido pedido = new Pedido();
		pedido.setIdPedido(idPedido);
		pedido.setCliente_idCliente(idCliente);
		pedido.setFormaPagamento_idPagamento(pagamento);
		pedido.setValorTotal(total);
		

		for (int i=0;i< idProdutos.length;i++) {
			System.out.println("Produto: " + idProdutos[i] + " - Quantidade: " + qtdeEstoqProdutos[i]);
			try {
				idProduto = Integer.parseInt(idProdutos[i]);
			} catch (NumberFormatException e) {
			
			}
			try {
				quantidade = Integer.parseInt(qtdeEstoqProdutos[i]);
			} catch (NumberFormatException e) {
			
			}
			
			
			Produto produto = new Produto();
			produto.setQuantidadeEstoque(quantidade);
			produto.setIdProduto(idProduto);

			
			
			ProdutoService ps = new ProdutoService();
			
			if (quantidade >= 0 ) {
				System.out.println("Quantidade: " +quantidade);
				if (ps.atualizarEstoque(produto, quantidade)) {
				  //OK
					produtosOK[contador] = idProduto;
					quantidadeOK[contador] = quantidade;
					
					PedidoService cs = new PedidoService();
					
					cs.atualizar(pedido);
					request.setAttribute("pedido", pedido);
					contador++;
					pedidosOK++;
				};
			}			
		}
		if (pedidosOK == idProdutos.length) {
			RequestDispatcher view = null;
			view = request.getRequestDispatcher("CompraFinalizada.jsp");
			view.forward(request, response);				
		}else {
			
			for (int i=0; i < produtosOK.length; i++) {
				ProdutoService psRollback = new ProdutoService();
				if (psRollback.retornarEstoque(produtosOK[i], quantidadeOK[i])) {
					pedidosRollback++;
				};				
			}
			System.out.println("pedidosRollback: " +pedidosRollback + " - pedidosOK" + pedidosOK );
			
			
			
			
			
			
			RequestDispatcher viewErro = null;
			viewErro = request.getRequestDispatcher("CompraFinalizadaErro.jsp");
            viewErro.forward(request, response);								
		}

	}
}
