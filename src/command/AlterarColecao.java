package command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Colecao;
import service.ColecaoService;

public class AlterarColecao implements Command{

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
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
		
		cs.atualizar(colecao);
		request.setAttribute("colecao", colecao);
		request.setAttribute("alterCol", "Colecao Alterada");
		view = request.getRequestDispatcher("VisualizarColecao.jsp");
		view.forward(request, response);
	}
	
	public int busca(Colecao colecao, ArrayList<Colecao> lista) {
		Colecao to;
		for (int i = 0; i < lista.size(); i++) {
			to = lista.get(i);
			if (to.getIdColecao() == colecao.getIdColecao()) {
				return i;
			}
		}
		return -1;
	}
}