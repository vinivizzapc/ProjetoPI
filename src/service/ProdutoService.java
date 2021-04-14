package service;

import java.io.IOException;
import java.util.ArrayList;

import dao.ProdutoDAO;
import model.Produto;

public class ProdutoService {
    ProdutoDAO dao = new ProdutoDAO();
    
    public int criar(Produto produto) {
        return dao.criar(produto);
    }
    public void atualizar(Produto produto){
        dao.atualizar(produto);
    }
    public boolean atualizarEstoque(Produto produto, int quantidade){
		 return dao.atualizarEstoque(produto, quantidade);
    }
    
    public void excluir(int idProduto){
        dao.excluir(idProduto);
    }

    public Produto carregar(int idProduto) throws IOException {
        return dao.carregar(idProduto);
    }
    
    public Produto carregarProduto(int idProduto) throws IOException{
    	return dao.carregarProduto(idProduto);
    }
    
    public ArrayList<Produto> listarProdutos() throws IOException {
		return dao.listarProdutos();
	}

	public ArrayList<Produto> listarProdutos(String chave) throws IOException {
		return dao.listarProdutos(chave);
	}
	public ArrayList<Produto> listarProdutosColecao(int idColecao) throws IOException {
		return dao.listarProdutosColecao(idColecao);
		
	}
	
    public boolean retornarEstoque(int produto, int quantidade){
		 return dao.retornarEstoque(produto, quantidade);
    }
	
}
