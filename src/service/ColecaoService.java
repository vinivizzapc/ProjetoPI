package service;

import java.io.IOException;
import java.util.ArrayList;
import dao.ColecaoDAO;
import model.Colecao;

public class ColecaoService {
	ColecaoDAO dao = new ColecaoDAO();
	
	public ArrayList<Colecao> listarColecao() throws IOException{
		return dao.listarColecao();
	}
	
	public ArrayList<Colecao> listarColecaoCadastro() throws IOException{
		return dao.listarColecaoCadastro();
	}
	
	public ArrayList<Colecao> listarColecao(String chave) throws IOException{
		return dao.listarColecao(chave);
	}

    public int inserir(Colecao colecao) {
        return dao.inserir(colecao);
    }
    public void atualizar(Colecao colecao){
        dao.atualizar(colecao);
    }

    public void excluir(int idColecao){
        dao.excluir(idColecao);
    }

    public Colecao carregar(int idColecao)  throws IOException{
        return dao.carregar(idColecao);
    }
}
