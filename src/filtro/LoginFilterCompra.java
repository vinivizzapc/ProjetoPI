package filtro;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Cliente;

/**
 * Servlet Filter implementation class LoginFilter
 */
@WebFilter(filterName="LoginFilterCompra", urlPatterns= {"/FinalizarCompra.jsp", "/CarrinhoVazio.jsp","/MeusDados.jsp", "/Carrinho.jsp", "/MeusDadosCompra.jsp",  "/MeusDados.jsp", "/MinhaConta.jsp", "/ConcluirPagamento.jsp", "/TelaFrete.jsp", "/CompraFinalizada.jsp", "/CompraFinalizadaErro.jsp", "/MeusPedidos.jsp", "/VisualizarMeusPedidos.jsp", })
public class LoginFilterCompra implements Filter {

	public LoginFilterCompra() {

	}

	public void destroy() {

	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();

		Cliente cliente = (Cliente) session.getAttribute("logado");

		String path = req.getContextPath();
		String uri = req.getRequestURI();

		String comando = req.getParameter("command");

		if (comando == null) {
			comando = "";
		}
		if (cliente == null && !uri.equals(path + "/Login.jsp") && !comando.equals("FazerLoginCli")) {
			((HttpServletResponse) response).sendRedirect(path + "/Login.jsp");

		} else {
			chain.doFilter(request, response);
		}
	}

	public void init(FilterConfig fConfig) throws ServletException {

	}

}
