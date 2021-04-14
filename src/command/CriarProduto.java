package command;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Produto;
import service.ProdutoService;

public class CriarProduto implements Command {

	
	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String pNome = request.getParameter("nome");
		String pModelo = request.getParameter("modelo");
		String pValor = request.getParameter("valor");
		String pCapacidade = request.getParameter("capacidade");
		String pCor = request.getParameter("cor");
		String pQuantidadeEstoque = request.getParameter("quantidadeEstoque");
		String pFk_IdColecao = request.getParameter("Fk_IdColecao");
		double valor = 0.0;
		int quantidadeEstoque = 1;
		
		try {
			quantidadeEstoque = Integer.parseInt(pQuantidadeEstoque);
		}catch (NumberFormatException e) {
			
		}
		
		try {
			valor = Double.parseDouble(pValor);
		}catch (NumberFormatException e) {
			
		}
		
		int Fk_IdColecao = 1;
		
		try {
			Fk_IdColecao = Integer.parseInt(pFk_IdColecao);
		}catch (NumberFormatException e) {
			
		}
		
		InputStream is = request.getPart("imagem_produto").getInputStream();
		ByteArrayOutputStream buffer = new ByteArrayOutputStream();

		int nRead;
		byte[] data = new byte[16384];

		while ((nRead = is.read(data, 0, data.length)) != -1) {
			buffer.write(data, 0, nRead);
		}

		byte[] imagem_produto = buffer.toByteArray();

		Produto produto = new Produto();
		produto.setNome(pNome);
		produto.setModelo(pModelo);
		produto.setValor(valor);
		produto.setCapacidade(pCapacidade);
		produto.setCor(pCor);
		produto.setQuantidadeEstoque(quantidadeEstoque);
		produto.setImagem_produto(imagem_produto);
		produto.setFk_IdColecao(Fk_IdColecao);

		ProdutoService ps = new ProdutoService();
		ps.criar(produto);

		RequestDispatcher view = null;
		request.setAttribute("success", "Produto cadastrado com sucesso");
		view = request.getRequestDispatcher("controller.do?command=ListarProduto");
		view.forward(request, response);
	}

}
