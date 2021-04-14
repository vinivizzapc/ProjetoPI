package command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Pedido;
import service.PedidoService;

public class CriarPedido implements Command{

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); 
		String pIdPedido = request.getParameter("idPedido");
		String pValorTotal = request.getParameter("valorTotal");
		
		int idPedido = -1;
		try {
			idPedido = Integer.parseInt(pIdPedido);
		} catch (NumberFormatException e) {
		
		}
		
		float valorTotal = 0;
		try {
			valorTotal = Float.parseFloat(pValorTotal);
		} catch (NumberFormatException e) {
		
		}
		
		Pedido pedido = new Pedido();
		pedido.setIdPedido(idPedido);
		pedido.setValorTotal(valorTotal);
		
		PedidoService ps = new PedidoService();
		ps.criar(pedido);
		
		RequestDispatcher view = null;
		HttpSession session = request.getSession();
		
		ArrayList<Pedido> lista = new ArrayList<>();
		lista.add(pedido);
		session.setAttribute("lista", lista);
		view = request.getRequestDispatcher("ListarPedidos.jsp");
		view.forward(request, response);
	}
}
