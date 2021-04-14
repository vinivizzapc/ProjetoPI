package command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class EfetuarLogoffCli implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();	

			session.setAttribute("logado", null);
			System.out.println("Logoff efetuado com sucesso!!	");
			session.setAttribute("logNome",null);
			session.invalidate();	
		response.sendRedirect("index.jsp");
	}
	

}
