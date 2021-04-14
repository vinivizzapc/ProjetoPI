package service;

import model.Cliente;

import java.util.ArrayList;

import dao.ClienteDAO;

public class ClienteService {
	ClienteDAO dao = new ClienteDAO();

	public int criar(Cliente cliente) {
		return dao.criar(cliente);
	}

	public void atualizar(Cliente cliente) {
		dao.atualizar(cliente);
	}

	public void excluir(int idCliente) {
		dao.excluir(idCliente);
	}

	public Cliente carregar(int idCliente) {
		return dao.carregar(idCliente);
	}
	
	public Cliente carregarEmail(String email) {
		return dao.carregarEmail(email);
	}

	public ArrayList<Cliente> listarClientes() {
		return dao.listarClientes();
	}

	public ArrayList<Cliente> listarClientes(String chave) {
		return dao.listarClientes(chave);
	}
	
	public boolean validar(Cliente cliente) {
		ClienteDAO dao = new ClienteDAO();
		return dao.validar(cliente);
	}
}
