package service;

import model.FormaPagamento;
import dao.FormaPagamentoDAO;

public class FormaPagamentoService {
	FormaPagamentoDAO dao = new FormaPagamentoDAO();

    public int inserir(FormaPagamento formaPagamento) {
        return dao.inserir(formaPagamento);
    }
    public void atualizar(FormaPagamento formaPagamento){
        dao.atualizar(formaPagamento);
    }

    public void excluir(int idFormaPagamento){
        dao.excluir(idFormaPagamento);
    }

    public FormaPagamento carregar(int idFormaPagamento){
        return dao.carregar(idFormaPagamento);
    }
}