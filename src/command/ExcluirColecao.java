package command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Colecao;
import service.ColecaoService;

public class ExcluirColecao implements Command{

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String pIdColecao = request.getParameter("idColecao");
		int idColecao = -1;
		
		try {
			idColecao = Integer.parseInt(pIdColecao);
		} catch (NumberFormatException e) {
		}
		
		Colecao colecao = new Colecao();
		colecao.setIdColecao(idColecao);
		
		ColecaoService cs = new ColecaoService();
		
		RequestDispatcher view = null;
		
		cs.excluir(colecao.getIdColecao());
		request.setAttribute("deleteCol", "Coleção Excluida");
		view = request.getRequestDispatcher("controller.do?command=ListarColecao");
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
