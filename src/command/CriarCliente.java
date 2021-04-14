package command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Cliente;
import service.ClienteService;

public class CriarCliente implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
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
		
		ClienteService cs = new ClienteService();
		int retorno = cs.criar(cliente);
		
		RequestDispatcher view = null;
		if(retorno == -1) {
			System.out.println("Não Cadastrou" + cliente);
			request.setAttribute("err", "Email ou CPF ja existente");
			request.getRequestDispatcher("TelaCadastroCliente.jsp").forward(request, response);
		}
		
		if(cs.validar(cliente)) {
			HttpSession session = request.getSession();
			cliente = cs.carregarEmail(cliente.getEmail());
			session.setAttribute("logado", cliente);
			session.setAttribute("idCliente", cliente.getIdCliente());
			session.setAttribute("logNome", cliente.getNome());
			System.out.println("logou" + cliente);
			
		}
		view = request.getRequestDispatcher("index.jsp");
		view.forward(request, response);
	}
}
