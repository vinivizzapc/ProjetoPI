package command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Produto;
import service.ProdutoService;

public class ExcluirProduto implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
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
		 
		ps.excluir(produto.getIdProduto());
		
		request.setAttribute("delete", "Produto Excluido");
		view = request.getRequestDispatcher("controller.do?command=ListarProduto");
		view.forward(request, response);
	}

	public int busca(Produto produto, ArrayList<Produto> lista) {
		Produto to;
		for (int i = 0; i < lista.size(); i++) {
			to = lista.get(i);
			if (to.getIdProduto() == produto.getIdProduto()) {

				return i;
			}
		}
		return -1;
	}
	
}
