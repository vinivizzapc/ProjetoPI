package command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Administrador;
import service.AdministradorService;

public class EditarAdministrador implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String pIdAdministrador = request.getParameter("idAdministrador");
		String pNome = request.getParameter("nome");
		String pEmail = request.getParameter("email");
		String pSenha = request.getParameter("senha");
		
		int idAdministrador = -1;
		try {
			idAdministrador = Integer.parseInt(pIdAdministrador);
		 } catch (NumberFormatException e) {
		}
		
		Administrador administrador = new Administrador();
		administrador.setIdAdministrador(idAdministrador);
		administrador.setNome(pNome);
		administrador.setEmail(pEmail);
		administrador.setSenha(pSenha);
		
		AdministradorService as = new AdministradorService();
		RequestDispatcher view = null;
		
		administrador = as.carregar(administrador.getIdAdministrador());
		request.setAttribute("administrador", administrador);
		view = request.getRequestDispatcher("EditarAdministrador.jsp");
		view.forward(request,response); 
	}
}
