package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Administrador;

public class AdministradorDAO {
	public int criar(Administrador administrador) {
		String sqlInsert = "INSERT INTO Administrador(Nome, Email, Senha) VALUES (?, ?, ?)";

		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlInsert);) {
			stm.setString(1, administrador.getNome());
			stm.setString(2, administrador.getEmail());
			stm.setString(3, administrador.getSenha());
			stm.execute();
			String sqlQuery = "SELECT LAST_INSERT_ID()";
			try (PreparedStatement stm2 = conn.prepareStatement(sqlQuery); ResultSet rs = stm2.executeQuery();) {
				if (rs.next()) {
					administrador.setIdAdministrador(rs.getInt(1));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return administrador.getIdAdministrador();
	}

	public void atualizar(Administrador administrador) {
        String sqlUpdate = "UPDATE administrador SET Nome=?, Email=?, Senha=? WHERE idAdministrador=?";
        try (Connection conn = ConnectionFactory.obtemConexao();
                PreparedStatement stm = conn.prepareStatement(sqlUpdate);) {
            stm.setString(1, administrador.getNome());
            stm.setString(2, administrador.getEmail());
            stm.setString(3, administrador.getSenha());
            stm.setInt(4, administrador.getIdAdministrador());
            stm.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

	public void excluir(int idAdministrador) {
		String sqlDelete = "DELETE FROM administrador WHERE idAdministrador = ?";
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlDelete);) {
			stm.setInt(1, idAdministrador);
			stm.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Administrador carregar(int idAdministrador) {
		Administrador administrador = new Administrador();
		administrador.setIdAdministrador(idAdministrador);
		String sqlSelect = "SELECT idAdministrador, Nome, Email, Senha FROM Administrador WHERE Administrador.idAdministrador = ?";
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlSelect);) {
			stm.setInt(1, administrador.getIdAdministrador());
			try (ResultSet rs = stm.executeQuery();) {
				if (rs.next()) {
					administrador.setNome(rs.getString("nome"));
					administrador.setEmail(rs.getString("email"));
					administrador.setSenha(rs.getString("senha"));
				} else {
					administrador.setIdAdministrador(-1);
					administrador.setNome(null);
					administrador.setEmail(null);
					administrador.setSenha(null);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			System.out.print(e1.getStackTrace());
		}
		return administrador;
	}
	
	public Administrador carregarEmail(String email) {
		Administrador administrador = new Administrador();
		administrador.setEmail(email);
		String sqlSelect = "SELECT idAdministrador, Nome, Email, Senha FROM Administrador WHERE Administrador.email = ?";
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlSelect);) {
			stm.setString(1, administrador.getEmail());
			try (ResultSet rs = stm.executeQuery();) {
				if (rs.next()) {
					administrador.setNome(rs.getString("nome"));
					administrador.setEmail(rs.getString("email"));
					administrador.setSenha(rs.getString("senha"));
				} else {
					administrador.setIdAdministrador(-1);
					administrador.setNome(null);
					administrador.setEmail(null);
					administrador.setSenha(null);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			System.out.print(e1.getStackTrace());
		}
		return administrador;
	}

	public ArrayList<Administrador> listarAdministradores() {
		Administrador administrador;
		ArrayList<Administrador> lista = new ArrayList<>();
		String sqlSelect = "SELECT idAdministrador, Nome, Email, Senha FROM Administrador";
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlSelect);) {
			try (ResultSet rs = stm.executeQuery();) {
				while (rs.next()) {
					administrador = new Administrador();
					administrador.setIdAdministrador(rs.getInt("idAdministrador"));
					administrador.setNome(rs.getString("nome"));
					administrador.setEmail(rs.getString("email"));
					administrador.setSenha(rs.getString("senha"));
					lista.add(administrador);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			System.out.print(e1.getStackTrace());
		}
		return lista;
	}

	public ArrayList<Administrador> listarAdministradores(String chave) {
		Administrador administrador;
		ArrayList<Administrador> lista = new ArrayList<>();
		String sqlSelect = "SELECT idAdministrador, Nome, Email, Senha FROM administrador where upper(nome)like ?";
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlSelect);) {
			stm.setString(1, "%" + chave.toUpperCase() + "%");
			try (ResultSet rs = stm.executeQuery();) {
				while (rs.next()) {
					administrador = new Administrador();
					administrador.setIdAdministrador(rs.getInt("idAdministrador"));
					administrador.setNome(rs.getString("nome"));
					administrador.setEmail(rs.getString("email"));
					administrador.setSenha(rs.getString("senha"));
					lista.add(administrador);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			System.out.print(e1.getStackTrace());
		}
		return lista;
	}
	
	public boolean validar(Administrador administrador) {
		String sqlSelect = "SELECT email, senha from administrador where email = ? and senha = ?";
		try {
			Connection conn = ConnectionFactory.obtemConexao();
			try(PreparedStatement stm = conn.prepareStatement(sqlSelect);){
				stm.setString(1, administrador.getEmail());
				stm.setString(2, administrador.getSenha());
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