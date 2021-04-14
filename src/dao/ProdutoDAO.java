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

import model.Produto;

public class ProdutoDAO {
	public int criar(Produto produto) {
		String sqlInsert = "INSERT INTO Produto(nome, modelo, valor, capacidade, cor, quantidadeEstoque, imagem_produto, Fk_IdColecao) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlInsert);) {
			stm.setString(1, produto.getNome());
			stm.setString(2, produto.getModelo());
			stm.setDouble(3, produto.getValor());
			stm.setString(4, produto.getCapacidade());
			stm.setString(5, produto.getCor());
			stm.setInt(6, produto.getQuantidadeEstoque());
			stm.setBytes(7, produto.getImagem_produto());
			stm.setInt(8, produto.getFk_IdColecao());
			stm.execute();
			String sqlQuery = "SELECT LAST_INSERT_ID()";
			try (PreparedStatement stm2 = conn.prepareStatement(sqlQuery); ResultSet rs = stm2.executeQuery();) {
				if (rs.next()) {
					produto.setIdProduto(rs.getInt(1));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return produto.getIdProduto();
	}

	public void atualizar(Produto produto) {
        String sqlUpdate = "UPDATE produto SET Nome=?, Modelo=?, Valor=?, Capacidade=?, Cor=?, quantidadeEstoque=? WHERE idProduto=?";
        try (Connection conn = ConnectionFactory.obtemConexao();
                PreparedStatement stm = conn.prepareStatement(sqlUpdate);) {
            stm.setString(1, produto.getNome());
            stm.setString(2, produto.getModelo());
            stm.setDouble(3, produto.getValor());
            stm.setString(4, produto.getCapacidade());
            stm.setString(5, produto.getCor());
            stm.setInt(6, produto.getQuantidadeEstoque());
            stm.setInt(7, produto.getIdProduto());

            stm.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

	public void excluir(int idProduto) {
		String sqlDelete = "DELETE FROM produto WHERE idProduto=?";
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlDelete);) {
			stm.setInt(1, idProduto);
			stm.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public Produto carregarProduto(int idProduto) throws IOException{
		Produto produto = new Produto();
		produto.setIdProduto(idProduto);
		String sqlSelect = "SELECT nome, valor, capacidade, cor, imagem_produto, quantidadeEstoque FROM Produto WHERE Produto.idProduto = ?";
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlSelect);) {
			stm.setInt(1, produto.getIdProduto());
			try (ResultSet rs = stm.executeQuery();) {
				if (rs.next()) {
					produto.setNome(rs.getString("nome"));
					produto.setValor(rs.getDouble("valor"));
					produto.setCapacidade(rs.getString("capacidade"));
					produto.setCor(rs.getString("cor"));
					produto.setQuantidadeEstoque(rs.getInt("quantidadeEstoque"));
					try {
						Blob blob = rs.getBlob("imagem_produto");
		                 
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
		                produto.setBase64Image(base64Image);
					    }catch(SQLException e){
					    	e.printStackTrace();
					    }
					
				} else {
					produto.setIdProduto(-1);
					produto.setNome(null);
					produto.setValor(0.0);
					produto.setCapacidade(null);
					produto.setCor(null);
					produto.setImagem_produto(null);
					produto.setQuantidadeEstoque(-1);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			System.out.print(e1.getStackTrace());
		}
		return produto;
	}
	
	public Produto carregar(int idProduto) throws IOException {
		Produto produto = new Produto();
		produto.setIdProduto(idProduto);
		String sqlSelect = "SELECT nome, modelo, valor, capacidade, cor, quantidadeEstoque, imagem_produto FROM Produto WHERE Produto.idProduto = ?";
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlSelect);) {
			stm.setInt(1, produto.getIdProduto());
			try (ResultSet rs = stm.executeQuery();) {
				if (rs.next()) {
					produto.setNome(rs.getString("nome"));
					produto.setModelo(rs.getString("modelo"));
					produto.setValor(rs.getDouble("valor"));
					produto.setCapacidade(rs.getString("capacidade"));
					produto.setCor(rs.getString("cor"));
					produto.setQuantidadeEstoque(rs.getInt("quantidadeEstoque"));
					try {
						Blob blob = rs.getBlob("imagem_produto");
		                 
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
		                produto.setBase64Image(base64Image);
					    }catch(SQLException e){
					    	e.printStackTrace();
					    }
				} else {
					produto.setIdProduto(-1);
					produto.setNome(null);
					produto.setModelo(null);
					produto.setValor(0.0);
					produto.setCapacidade(null);
					produto.setCor(null);
					produto.setQuantidadeEstoque(0);
					produto.setImagem_produto(null);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			System.out.print(e1.getStackTrace());
		}
		return produto;
	}
	
	public ArrayList<Produto> listarProdutos() throws IOException {
		Produto produto;
		ArrayList<Produto> lista = new ArrayList<>();
		String sqlSelect = "SELECT idProduto, nome, modelo, valor, capacidade, cor, quantidadeEstoque, imagem_produto FROM Produto where imagem_produto is not null";
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlSelect);) {
			try (ResultSet rs = stm.executeQuery();) {
				while (rs.next()) {
					produto = new Produto();
					produto.setIdProduto(rs.getInt("idProduto"));
					produto.setNome(rs.getString("nome"));
					produto.setModelo(rs.getString("modelo"));
					produto.setValor(rs.getDouble("valor"));
					produto.setCapacidade(rs.getString("capacidade"));
					produto.setCor(rs.getString("cor"));
					produto.setQuantidadeEstoque(rs.getInt("quantidadeEstoque"));
					try {
						Blob blob = rs.getBlob("imagem_produto");
		                 
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
		                produto.setBase64Image(base64Image);
					    }catch(SQLException e){
					    	e.printStackTrace();
					    }
					lista.add(produto);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			System.out.print(e1.getStackTrace());
		}
		return lista;
	}

	public ArrayList<Produto> listarProdutos(String chave) throws IOException {
		Produto produto;
		ArrayList<Produto> lista = new ArrayList<>();
		String sqlSelect = "SELECT idProduto, nome, modelo, valor, capacidade, cor, quantidadeEstoque, imagem_produto FROM produto where upper(nome)like ?";
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlSelect);) {
			stm.setString(1, "%" + chave.toUpperCase() + "%");
			try (ResultSet rs = stm.executeQuery();) {
				while (rs.next()) {
					produto = new Produto();
					produto.setIdProduto(rs.getInt("idProduto"));
					produto.setNome(rs.getString("nome"));
					produto.setModelo(rs.getString("modelo"));
					produto.setValor(rs.getDouble("valor"));
					produto.setCapacidade(rs.getString("capacidade"));
					produto.setCor(rs.getString("cor"));
					produto.setQuantidadeEstoque(rs.getInt("quantidadeEstoque"));
					try {
						Blob blob = rs.getBlob("imagem_produto");
		                 
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
		                produto.setBase64Image(base64Image);
					    }catch(SQLException e){
					    	e.printStackTrace();
					    }
					lista.add(produto);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			System.out.print(e1.getStackTrace());
		}
		return lista;
	}
	
	public ArrayList<Produto> listarProdutosColecao(int idColecao) throws IOException {
		Produto produto;
		ArrayList<Produto> lista = new ArrayList<>();
		String sqlSelect = "SELECT idProduto, nome, valor, imagem_produto FROM projetopi.produto where fk_IdColecao = ? AND quantidadeEstoque > 0";
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlSelect);) {
				stm.setInt(1, idColecao);
				try (ResultSet rs = stm.executeQuery();) {
				while (rs.next()) {
					produto = new Produto();
					produto.setIdProduto(rs.getInt("idProduto"));
					produto.setNome(rs.getString("nome"));
					produto.setValor(rs.getDouble("valor"));
					try {
						Blob blob = rs.getBlob("imagem_produto");
		                 
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
		                produto.setBase64Image(base64Image);
					    }catch(SQLException e){
					    	e.printStackTrace();
					    }
					
					lista.add(produto);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			System.out.print(e1.getStackTrace());
		}
		return lista;
	}
	public boolean atualizarEstoque(Produto produto, int qtde) {
        String sqlUpdate = "UPDATE produto SET quantidadeEstoque=quantidadeEstoque-? WHERE idProduto=? AND (quantidadeEstoque-?)>=0";
        try (Connection conn = ConnectionFactory.obtemConexao();
                PreparedStatement stm = conn.prepareStatement(sqlUpdate);) {
            stm.setInt(1, qtde);
            stm.setInt(2, produto.getIdProduto());
            stm.setInt(3, qtde);
            int rows_updated = stm.executeUpdate();
            System.out.println(stm);
            
            if (rows_updated > 0 ) {
            	System.out.print("Funcionou: " + rows_updated + " sqlUpdate: " + sqlUpdate + "\n");
            	return true;
            }
            System.out.print("Nao Funcionou: " + rows_updated + " sqlUpdate: " +  sqlUpdate  + "\n");
            return false;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
	public boolean retornarEstoque(int produto, int qtde) {
        String sqlUpdate = "UPDATE produto SET quantidadeEstoque=quantidadeEstoque+? WHERE idProduto=?";
        try (Connection conn = ConnectionFactory.obtemConexao();
                PreparedStatement stm = conn.prepareStatement(sqlUpdate);) {
            stm.setInt(1, qtde);
            stm.setInt(2, produto);
            int rows_updated = stm.executeUpdate();
            System.out.println(stm);
            
            if (rows_updated > 0 ) {
            	System.out.print("Funcionou: " + rows_updated + " sqlUpdate: " + sqlUpdate + "\n");
            	return true;
            }
            System.out.print("Nao Funcionou: " + rows_updated + " sqlUpdate: " +  sqlUpdate  + "\n");
            return false;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
	
}