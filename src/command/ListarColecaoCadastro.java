package command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Colecao;
import service.ColecaoService;

public class ListarColecaoCadastro implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ColecaoService cs = new ColecaoService();
		ArrayList<Colecao> lista = null;
		HttpSession session = request.getSession();
		
			lista = cs.listarColecaoCadastro();

			session.setAttribute("lista", lista);
			
			
		RequestDispatcher dispatcher = request
		.getRequestDispatcher("TelaCadastroProduto.jsp");
		dispatcher.forward(request, response);

	}

}
