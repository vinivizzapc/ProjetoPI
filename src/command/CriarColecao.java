package command;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Colecao;
import service.ColecaoService;

public class CriarColecao implements Command{

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String pNome = request.getParameter("nome");
		InputStream is  = request.getPart("imagem_colecao").getInputStream();
		ByteArrayOutputStream buffer = new ByteArrayOutputStream();
		
		int nRead;
		byte[] data = new byte[16384];

		while ((nRead = is.read(data, 0, data.length)) != -1) {
		  buffer.write(data, 0, nRead);
		}

		byte[] imagem_colecao = buffer.toByteArray();
		
		Colecao colecao = new Colecao();
		colecao.setNome(pNome);
		colecao.setImagem_colecao(imagem_colecao);
		
		ColecaoService cs = new ColecaoService();
		cs.inserir(colecao);
		
		RequestDispatcher view = null;
		request.setAttribute("successCol", "Coleção cadastrada com sucesso");
		view = request.getRequestDispatcher("controller.do?command=ListarColecao"); 
		view.forward(request, response);
	}
}
