package service;

import model.Administrador;

import java.util.ArrayList;

import dao.AdministradorDAO;

public class AdministradorService {
	AdministradorDAO dao = new AdministradorDAO();

	public int criar(Administrador administrador) {
		return dao.criar(administrador);
	}

	public void atualizar(Administrador administrador) {
		dao.atualizar(administrador);
	}

	public void excluir(int idAdministrador) {
		dao.excluir(idAdministrador);
	}

	public Administrador carregar(int idAdministrador) {
		return dao.carregar(idAdministrador);
	}
	
	public Administrador carregarEmail(String email) {
		return dao.carregarEmail(email);
	}

	public ArrayList<Administrador> listarAdministradores() {
		return dao.listarAdministradores();
	}

	public ArrayList<Administrador> listarAdministradores(String chave) {
		return dao.listarAdministradores(chave);
	}
	
	public boolean validar(Administrador administrador) {
		return dao.validar(administrador);
	}
}
