package dao;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;

import model.Colecao;

public class ColecaoDAO {
	public ArrayList<Colecao> listarColecao() throws IOException {
		Colecao colecao;
		ArrayList<Colecao> lista = new ArrayList<>();
		String sqlSelect = "SELECT idColecao, nome, imagem_colecao FROM colecao";
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlSelect);) {
			try (ResultSet rs = stm.executeQuery();) {
				while (rs.next()) {
					colecao = new Colecao();
					colecao.setIdColecao(rs.getInt("idColecao"));
					colecao.setNome(rs.getString("nome"));
					colecao.setImagem_colecao(rs.getBytes("imagem_colecao"));
					try {
						Blob blob = rs.getBlob("imagem_colecao");

						InputStream inputStream = blob.getBinaryStream();
						ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
						byte[] buffer = new byte[4096];
						int bytesRead = -1;

						while ((bytesRead = inputStream.read(buffer)) != -1) {
							outputStream.write(buffer, 0, bytesRead);
						}

						byte[] imageBytes = outputStream.toByteArray();
						String base64Image = Base64.getEncoder().encodeToString(imageBytes);

						inputStream.close();
						outputStream.close();
						colecao.setBase64Image(base64Image);
					} catch (SQLException e) {
						e.printStackTrace();
					}
					lista.add(colecao);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			System.out.print(e1.getStackTrace());
		}
		return lista;
	}

	public ArrayList<Colecao> listarColecao(String chave) throws IOException {
		Colecao colecao;
		ArrayList<Colecao> lista = new ArrayList<>();
		String sqlSelect = "SELECT idColecao, nome, imagem_colecao FROM colecao where upper(nome)like ?";
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlSelect);) {
			stm.setString(1, "%" + chave.toUpperCase() + "%");
			try (ResultSet rs = stm.executeQuery();) {
				while (rs.next()) {
					colecao = new Colecao();
					colecao.setIdColecao(rs.getInt("idColecao"));
					colecao.setNome(rs.getString("nome"));
					colecao.setImagem_colecao(rs.getBytes("imagem_colecao"));
					try {
						Blob blob = rs.getBlob("imagem_colecao");

						InputStream inputStream = blob.getBinaryStream();
						ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
						byte[] buffer = new byte[4096];
						int bytesRead = -1;

						while ((bytesRead = inputStream.read(buffer)) != -1) {
							outputStream.write(buffer, 0, bytesRead);
						}

						byte[] imageBytes = outputStream.toByteArray();
						String base64Image = Base64.getEncoder().encodeToString(imageBytes);

						inputStream.close();
						outputStream.close();
						colecao.setBase64Image(base64Image);
					} catch (SQLException e) {
						e.printStackTrace();
					}
					lista.add(colecao);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			System.out.print(e1.getStackTrace());
		}
		return lista;
	}

	public int inserir(Colecao colecao) {
		String sqlInsert = "INSERT INTO Colecao(nome, imagem_colecao) VALUES (?, ?)";

		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlInsert);) {
			stm.setString(1, colecao.getNome());
			stm.setBytes(2, colecao.getImagem_colecao());
			stm.execute();
			String sqlQuery = "SELECT LAST_INSERT_ID()";
			try (PreparedStatement stm2 = conn.prepareStatement(sqlQuery); ResultSet rs = stm2.executeQuery();) {
				if (rs.next()) {
					colecao.setIdColecao(rs.getInt(1));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return colecao.getIdColecao();
	}

	public void atualizar(Colecao colecao) {
		String sqlUpdate = "UPDATE Colecao SET nome=? WHERE idColecao=?";
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlUpdate);) {
			stm.setString(1, colecao.getNome());
			stm.setInt(2, colecao.getIdColecao());
			stm.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void excluir(int idColecao) {
		String sqlDelete = "DELETE FROM colecao WHERE idColecao=?";
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlDelete);) {
			stm.setInt(1, idColecao);
			stm.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public Colecao carregar(int idColecao)  throws IOException {
		Colecao colecao = new Colecao();
		colecao.setIdColecao(idColecao);
		String sqlSelect = "SELECT nome, imagem_colecao FROM Colecao WHERE Colecao.idColecao = ?";
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlSelect);) {
			stm.setInt(1, colecao.getIdColecao());
			try (ResultSet rs = stm.executeQuery();) {
				if (rs.next()) {
					colecao.setNome(rs.getString("nome"));
					try {
						Blob blob = rs.getBlob("imagem_colecao");
		                 
		                InputStream inputStream = blob.getBinaryStream();
		                ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
		                byte[] buffer = new byte[4096];
		                int bytesRead = -1;
		                 
		                while ((bytesRead = inputStream.read(buffer)) != -1) {
		                    outputStream.write(buffer, 0, bytesRead);                  
		                }
		                 
		                byte[] imageBytes = outputStream.toByteArray();
		                String base64Image = Base64.getEncoder().encodeToString(imageBytes);
		                 
		                 
		                inputStream.close();
		                outputStream.close();
		                colecao.setBase64Image(base64Image);
					    }catch(SQLException e){
					    	e.printStackTrace();
					    }
					
				} else {
					colecao.setIdColecao(-1);
					colecao.setNome(null);
					colecao.setImagem_colecao(null);
					
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			System.out.print(e1.getStackTrace());
		}
		return colecao;
	}
	
	public ArrayList<Colecao> listarColecaoCadastro() throws IOException {
		Colecao colecao;
		ArrayList<Colecao> lista = new ArrayList<>();
		String sqlSelect = "SELECT idColecao, nome FROM colecao";
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlSelect);) {
			try (ResultSet rs = stm.executeQuery();) {
				while (rs.next()) {
					colecao = new Colecao();
					colecao.setIdColecao(rs.getInt("idColecao"));
					colecao.setNome(rs.getString("nome"));

					lista.add(colecao);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			System.out.print(e1.getStackTrace());
		}
		return lista;
	}

}