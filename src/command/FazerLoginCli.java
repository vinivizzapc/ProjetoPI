package command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Administrador;
import model.Cliente;
import service.AdministradorService;
import service.ClienteService;

public class FazerLoginCli implements Command{

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String pIdAdministrador = request.getParameter("idAdministrador");
		String pIdCliente = request.getParameter("idCliente");
		String pNome = request.getParameter("nome");
		String pEmail = request.getParameter("email");
		String pSenha = request.getParameter("senha");
		String pCpf = request.getParameter("cpf");
		String pEndereco = request.getParameter("endereco");
		String pPais = request.getParameter("pais");
		String pEstado = request.getParameter("estado");
		String pCep = request.getParameter("cep");
		String pFone = request.getParameter("fone");		
		String pNotificacao = request.getParameter("notificacao");
		String pBairro = request.getParameter("bairro");
		String pNumero = request.getParameter("numero");
		String pComplemento = request.getParameter("complemento");	
		
		int idCliente = -1;
		try {
			idCliente = Integer.parseInt(pIdCliente);
		} catch (NumberFormatException e) {
		}
		int idAdministrador = -1;
		try {
			idAdministrador = Integer.parseInt(pIdAdministrador);
		} catch (NumberFormatException e) {
		}
		
		Cliente cliente = new Cliente();
		cliente.setIdCliente(idCliente);
		cliente.setNome(pNome);
		cliente.setEmail(pEmail);
		cliente.setSenha(pSenha);
		cliente.setCpf(pCpf);
		cliente.setEndereco(pEndereco);
		cliente.setPais(pPais);
		cliente.setEstado(pEstado);
		cliente.setCep(pCep);
		cliente.setFone(pFone);
		cliente.setNotificacao(pNotificacao);
		cliente.setBairro(pBairro);
		cliente.setNumero(pNumero);
		cliente.setComplemento(pComplemento);	
		
		Administrador administrador = new Administrador();
		administrador.setIdAdministrador(idAdministrador);
		administrador.setNome(pNome);
		administrador.setEmail(pEmail);
		administrador.setSenha(pSenha);
		
		AdministradorService adm = new AdministradorService();	
		
		ClienteService cs = new ClienteService();
		cliente.setEmail(pEmail);
		cliente.setSenha(pSenha);
		
		if(cs.validar(cliente)) {
			HttpSession session = request.getSession();
			cliente = cs.carregarEmail(cliente.getEmail());
			session.setAttribute("logado", cliente);
			session.setAttribute("idCliente", cliente.getIdCliente());
			session.setAttribute("logNome", cliente.getNome());
			System.out.println("logou" + cliente);
			response.sendRedirect("index.jsp");
			
		}
		else if(adm.validar(administrador)) {
			HttpSession session = request.getSession();
			administrador = adm.carregarEmail(administrador.getEmail());
			session.setAttribute("logado", administrador);
			session.setAttribute("logNomeAdm", administrador.getNome());			
			System.out.println("logou" + administrador);
			response.sendRedirect("TelaAdmin.jsp");
			
		}
		else {
			System.out.println("Não logou" + cliente);
			request.setAttribute("erro", "Usuário e/ou senha inválidos");
			request.getRequestDispatcher("Login.jsp").forward(request, response);
		return;
		}
	}
}
