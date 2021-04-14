package command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Colecao;
import model.Produto;
import service.ColecaoService;
import service.ProdutoService;

public class ListarProdutosColecao implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String chave = request.getParameter("idColecao");
		ArrayList<Produto> lista = null;
		Colecao colecao = new Colecao();
		
		ProdutoService ps = new ProdutoService();
		ColecaoService cs = new ColecaoService();
		
		lista = ps.listarProdutosColecao(Integer.parseInt(chave));
		colecao = cs.carregar(Integer.parseInt(chave));
		
		request.setAttribute("colecao", colecao);
		request.setAttribute("lista", lista);

		RequestDispatcher dispatcher = request.getRequestDispatcher("TelaProdutosColecao.jsp");
		dispatcher.forward(request, response);
	}
}


