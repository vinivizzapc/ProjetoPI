package command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Cliente;
import service.ClienteService;

public class ExcluirCliente implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		String pIdCliente = request.getParameter("idCliente");
		int idCliente = 1;
		
		try {
			idCliente = Integer.parseInt(pIdCliente);
		}catch (NumberFormatException e) {
			
		}
		
		Cliente cliente = new Cliente();
		cliente.setIdCliente(idCliente);
		
		ClienteService cs = new ClienteService();
		
		RequestDispatcher view = null;
		 
		cs.excluir(cliente.getIdCliente());
		request.setAttribute("deleteCli", "Cliente Excluido");
		view = request.getRequestDispatcher("controller.do?command=ListarCliente");
		view.forward(request, response);
	}

	public int busca(Cliente cliente, ArrayList<Cliente> lista) {
		Cliente to;
		for (int i = 0; i < lista.size(); i++) {
			to = lista.get(i);
			if (to.getIdCliente() == cliente.getIdCliente()) {

				return i;
			}
		}
		return -1;
	}
	
}
