package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Cliente;

public class ClienteDAO {
	public int criar(Cliente cliente) {
		String sqlInsert = "INSERT INTO Cliente(Nome, CPF, Email, Endereco, Pais, Estado, CEP, Fone, Senha, Notificacao, Bairro, Numero, Complemento) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlInsert);) {
			stm.setString(1, cliente.getNome());
			stm.setString(2, cliente.getCpf());
			stm.setString(3, cliente.getEmail());
			stm.setString(4, cliente.getEndereco());
			stm.setString(5, cliente.getPais());
			stm.setString(6, cliente.getEstado());
			stm.setString(7, cliente.getCep());
			stm.setString(8, cliente.getFone());
			stm.setString(9, cliente.getSenha());
			stm.setString(10, cliente.getNotificacao());
			stm.setString(11, cliente.getBairro());
			stm.setString(12, cliente.getNumero());
			stm.setString(13, cliente.getComplemento());
			stm.execute();
			String sqlQuery = "SELECT LAST_INSERT_ID()";
			try (PreparedStatement stm2 = conn.prepareStatement(sqlQuery); ResultSet rs = stm2.executeQuery();) {
				if (rs.next()) {
					cliente.setIdCliente(rs.getInt(1));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cliente.getIdCliente();
	}

	public void atualizar(Cliente cliente) {
        String sqlUpdate = "UPDATE cliente SET Nome=?, CPF=?, Email=?, Endereco=?, Pais=?, Estado=?, CEP=?, Fone=?, Senha=?, Bairro=?, Numero=?, Complemento=? WHERE idCliente=?";
        try (Connection conn = ConnectionFactory.obtemConexao();
                PreparedStatement stm = conn.prepareStatement(sqlUpdate);) {
            stm.setString(1, cliente.getNome());
            stm.setString(2, cliente.getCpf());
            stm.setString(3, cliente.getEmail());
            stm.setString(4, cliente.getEndereco());
            stm.setString(5, cliente.getPais());
            stm.setString(6, cliente.getEstado());
            stm.setString(7, cliente.getCep());
            stm.setString(8, cliente.getFone());
            stm.setString(9, cliente.getSenha());
            stm.setString(10, cliente.getBairro());
            stm.setString(11, cliente.getNumero());
            stm.setString(12, cliente.getComplemento());
            stm.setInt(13, cliente.getIdCliente());
            stm.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

	public void excluir(int idCliente) {
		String sqlDelete = "DELETE FROM cliente WHERE idCliente = ?";
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlDelete);) {
			stm.setInt(1, idCliente);
			stm.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Cliente carregar(int idCliente) {
		Cliente cliente = new Cliente();
		cliente.setIdCliente(idCliente);
		String sqlSelect = "SELECT idCliente, Nome, CPF, Email, Endereco, Pais, Estado, CEP, Fone, Senha, Notificacao, Bairro, Numero, Complemento FROM Cliente WHERE Cliente.idCliente = ?";
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlSelect);) {
			stm.setInt(1, cliente.getIdCliente());
			try (ResultSet rs = stm.executeQuery();) {
				if (rs.next()) {
					cliente.setNome(rs.getString("nome"));
					cliente.setCpf(rs.getString("cpf"));
					cliente.setEmail(rs.getString("email"));
					cliente.setEndereco(rs.getString("endereco"));
					cliente.setPais(rs.getString("pais"));
					cliente.setEstado(rs.getString("estado"));
					cliente.setCep(rs.getString("cep"));
					cliente.setFone(rs.getString("fone"));
					cliente.setSenha(rs.getString("senha"));
					cliente.setNotificacao(rs.getString("notificacao"));
					cliente.setBairro(rs.getString("bairro"));
					cliente.setNumero(rs.getString("numero"));
					cliente.setComplemento(rs.getString("complemento"));
				} else {
					cliente.setIdCliente(-1);
					cliente.setNome(null);
					cliente.setCpf(null);
					cliente.setEmail(null);
					cliente.setEndereco(null);
					cliente.setPais(null);
					cliente.setEstado(null);
					cliente.setCep(null);
					cliente.setFone(null);
					cliente.setSenha(null);
					cliente.setNotificacao(null);
					cliente.setBairro(null);
					cliente.setNumero(null);
					cliente.setComplemento(null);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			System.out.print(e1.getStackTrace());
		}
		return cliente;
	}
	
	public Cliente carregarEmail(String email) {
		Cliente cliente = new Cliente();
		cliente.setEmail(email);
		String sqlSelect = "SELECT idCliente, Nome, CPF, Email, Endereco, Pais, Estado, CEP, Fone, Senha, Notificacao, Bairro, Numero, Complemento FROM Cliente WHERE Cliente.email = ?";
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlSelect);) {
			stm.setString(1, cliente.getEmail());
			try (ResultSet rs = stm.executeQuery();) {
				if (rs.next()) {
					cliente.setIdCliente(rs.getInt("idCliente"));
					cliente.setNome(rs.getString("nome"));
					cliente.setCpf(rs.getString("cpf"));
					cliente.setEmail(rs.getString("email"));
					cliente.setEndereco(rs.getString("endereco"));
					cliente.setPais(rs.getString("pais"));
					cliente.setEstado(rs.getString("estado"));
					cliente.setCep(rs.getString("cep"));
					cliente.setFone(rs.getString("fone"));
					cliente.setSenha(rs.getString("senha"));
					cliente.setNotificacao(rs.getString("notificacao"));
					cliente.setBairro(rs.getString("bairro"));
					cliente.setNumero(rs.getString("numero"));
					cliente.setComplemento(rs.getString("complemento"));
				} else {
					cliente.setIdCliente(-1);
					cliente.setNome(null);
					cliente.setCpf(null);
					cliente.setEmail(null);
					cliente.setEndereco(null);
					cliente.setPais(null);
					cliente.setEstado(null);
					cliente.setCep(null);
					cliente.setFone(null);
					cliente.setSenha(null);
					cliente.setNotificacao(null);
					cliente.setBairro(null);
					cliente.setNumero(null);
					cliente.setComplemento(null);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			System.out.print(e1.getStackTrace());
		}
		return cliente;
	}

	public ArrayList<Cliente> listarClientes() {
		Cliente cliente;
		ArrayList<Cliente> lista = new ArrayList<>();
		String sqlSelect = "SELECT idCliente, Nome, CPF, Email, Endereco, Pais, Estado, CEP, Fone, Senha, Notificacao, Bairro, Numero, Complemento FROM Cliente";
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlSelect);) {
			try (ResultSet rs = stm.executeQuery();) {
				while (rs.next()) {
					cliente = new Cliente();
					cliente.setIdCliente(rs.getInt("idCliente"));
					cliente.setNome(rs.getString("nome"));
					cliente.setCpf(rs.getString("cpf"));
					cliente.setEmail(rs.getString("email"));
					cliente.setEndereco(rs.getString("endereco"));
					cliente.setPais(rs.getString("pais"));
					cliente.setEstado(rs.getString("estado"));
					cliente.setCep(rs.getString("cep"));
					cliente.setFone(rs.getString("fone"));
					cliente.setSenha(rs.getString("senha"));
					cliente.setNotificacao(rs.getString("notificacao"));
					cliente.setBairro(rs.getString("bairro"));
					cliente.setNumero(rs.getString("numero"));
					cliente.setComplemento(rs.getString("complemento"));
					lista.add(cliente);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			System.out.print(e1.getStackTrace());
		}
		return lista;
	}

	public ArrayList<Cliente> listarClientes(String chave) {
		Cliente cliente;
		ArrayList<Cliente> lista = new ArrayList<>();
		String sqlSelect = "SELECT idCliente, Nome, CPF, Email, Endereco, Pais, Estado, CEP, Fone, Senha, Notificacao, Bairro, Numero, Complemento FROM cliente where upper(nome)like ?";
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlSelect);) {
			stm.setString(1, "%" + chave.toUpperCase() + "%");
			try (ResultSet rs = stm.executeQuery();) {
				while (rs.next()) {
					cliente = new Cliente();
					cliente.setIdCliente(rs.getInt("idCliente"));
					cliente.setNome(rs.getString("nome"));
					cliente.setCpf(rs.getString("cpf"));
					cliente.setEmail(rs.getString("email"));
					cliente.setEndereco(rs.getString("endereco"));
					cliente.setPais(rs.getString("pais"));
					cliente.setEstado(rs.getString("estado"));
					cliente.setCep(rs.getString("cep"));
					cliente.setFone(rs.getString("fone"));
					cliente.setSenha(rs.getString("senha"));
					cliente.setNotificacao(rs.getString("notificacao"));
					cliente.setBairro(rs.getString("bairro"));
					cliente.setNumero(rs.getString("numero"));
					cliente.setComplemento(rs.getString("complemento"));
					lista.add(cliente);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			System.out.print(e1.getStackTrace());
		}
		return lista;
	}
	
	public boolean validar(Cliente cliente) {
		String sqlSelect = "SELECT nome, email, senha from cliente where email = ? and senha = ?";
		try {
			Connection conn = ConnectionFactory.obtemConexao();
			try(PreparedStatement stm = conn.prepareStatement(sqlSelect);){
				stm.setString(1, cliente.getEmail());
				stm.setString(2, cliente.getSenha());
				try(ResultSet rs = stm.executeQuery()){
					if(rs.next()) {
						return true;
					}
					else {
						return false;
					}
				}catch(SQLException e) {
					e.printStackTrace();
				}
			}catch(SQLException e1) {
				System.out.println(e1.getStackTrace());
			}
		}catch(SQLException e2) {
			e2.printStackTrace();
		}
		return false;
	}
}