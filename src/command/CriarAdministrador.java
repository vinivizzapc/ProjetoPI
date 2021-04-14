package command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Administrador;
import service.AdministradorService;

public class CriarAdministrador implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String pNome = request.getParameter("nome");
		String pEmail = request.getParameter("email");
		String pSenha = request.getParameter("senha");
		
		Administrador administrador = new Administrador();
		administrador.setNome(pNome); 
		administrador.setEmail(pEmail);
		administrador.setSenha(pSenha);
		
		AdministradorService as = new AdministradorService();
		as.criar(administrador);
		
		RequestDispatcher view = null;
		request.setAttribute("successAdm", "Administrador cadastrado com sucesso");
		view = request.getRequestDispatcher("controller.do?command=ListarAdministrador");
		view.forward(request, response);
	}

}
