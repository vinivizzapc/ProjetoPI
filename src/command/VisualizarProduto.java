package command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Produto;
import service.ProdutoService;

public class VisualizarProduto implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); 
		String pIdProduto = request.getParameter("idProduto");
		
		int idProduto = 1;
		
		try {
			idProduto = Integer.parseInt(pIdProduto);
		}catch (NumberFormatException e) {
			
		}
		
		
		Produto produto = new Produto();
		produto.setIdProduto(idProduto);

		
		ProdutoService ps = new ProdutoService();
		RequestDispatcher view = null;
		
		produto = ps.carregar(produto.getIdProduto());
		request.setAttribute("produto", produto);
		view = request.getRequestDispatcher("VisualizarProduto.jsp");
			
		view.forward(request, response);
	}
}