package command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Administrador;
import service.AdministradorService;

public class AlterarAdministrador implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String pIdAdministrador = request.getParameter("idAdministrador");
		String pNome = request.getParameter("nome");
		String pEmail = request.getParameter("email");
		String pSenha = request.getParameter("senha");
		int idAdministrador = 1;
		
		try {
			idAdministrador = Integer.parseInt(pIdAdministrador);
		}catch (NumberFormatException e) {
			
		}
		
		Administrador administrador = new Administrador();
		administrador.setIdAdministrador(idAdministrador);
		administrador.setNome(pNome); 
		administrador.setEmail(pEmail);
		administrador.setSenha(pSenha);	
		
		AdministradorService as = new AdministradorService();
		RequestDispatcher view = null;
		
		as.atualizar(administrador);
		request.setAttribute("alterAdm", "Administrador Alterado");
		request.setAttribute("administrador", administrador);
		view = request.getRequestDispatcher("VisualizarAdministrador.jsp");
		
		 view.forward(request, response);
	}

	public int busca(Administrador administrador, ArrayList<Administrador> lista) {
		Administrador to;
		for (int i = 0; i < lista.size(); i++) {
			to = lista.get(i);
			if (to.getIdAdministrador() == administrador.getIdAdministrador()) {

				return i;
			}
		}
		return -1;
	} 
}
