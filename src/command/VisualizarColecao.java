package command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Colecao;
import service.ColecaoService;

public class VisualizarColecao implements Command{

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); 
		String pIdColecao = request.getParameter("idColecao");
		String pNome = request.getParameter("nome");
		int idColecao = -1;
		
		try {
			idColecao = Integer.parseInt(pIdColecao);
		} catch (NumberFormatException e) {
		}
		
		Colecao colecao = new Colecao();
		colecao.setIdColecao(idColecao);
		colecao.setNome(pNome);
		
		ColecaoService cs = new ColecaoService();
		
		RequestDispatcher view = null;
		
		colecao = cs.carregar(colecao.getIdColecao());
		request.setAttribute("colecao", colecao);
		view = request.getRequestDispatcher("VisualizarColecao.jsp");
			
		view.forward(request, response);
	}
}
