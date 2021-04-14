package command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Administrador;
import service.AdministradorService;

public class ListarAdministrador implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String chave = request.getParameter("data[search]"); 
		AdministradorService as = new AdministradorService();
		ArrayList<Administrador> lista = null;
		
			if (chave != null && chave.length() > 0) {
				lista = as.listarAdministradores(chave);
			} 
			else {
				lista = as.listarAdministradores();
			}
			request.setAttribute("lista", lista);
			
			
		RequestDispatcher dispatcher = request
		.getRequestDispatcher("ListarAdministradores.jsp");
		dispatcher.forward(request, response);

	}

}
