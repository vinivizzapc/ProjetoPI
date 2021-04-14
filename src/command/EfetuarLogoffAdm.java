 package command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Administrador;
import service.AdministradorService;

public class EfetuarLogoffAdm implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		
		Administrador administrador = (Administrador)session.getAttribute("logado");
		AdministradorService as = new AdministradorService();
		
		
		if (administrador!=null&&as.validar(administrador))
		{
			session.setAttribute("logado", null);
			session.invalidate();
			System.out.println("Logoff efetuado com sucesso!!	");
		}	
		response.sendRedirect("index.jsp");
	}
	

}
