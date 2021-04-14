package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.FormaPagamento;

public class FormaPagamentoDAO {

    public int inserir(FormaPagamento FormaPagamento){
        String sqlInsert = "INSERT INTO FormaPagamento(formaPagamento, statusPagamento) VALUES (?, ?)";
        try (Connection conn = ConnectionFactory.obtemConexao();
                PreparedStatement stm = conn.prepareStatement(sqlInsert);) {
			stm.setString(1, FormaPagamento.getFormaPagamento());
			stm.setString(2, FormaPagamento.getStatusPagamento());
			stm.execute();
			String sqlQuery  = "SELECT LAST_INSERT_ID()";
			try (PreparedStatement stm2 = conn.prepareStatement(sqlQuery);
					ResultSet rs = stm2.executeQuery();) {
				if (rs.next()) {
					FormaPagamento.setIdPagamento(rs.getInt(1));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return FormaPagamento.getIdPagamento();
	}
    
    public void atualizar(FormaPagamento formaPagamento) {
		String sqlUpdate = "UPDATE FormaPagamento SET formaPagamento=?, statusPagamento=? WHERE idPagamento=?";
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlUpdate);) {
			stm.setString(1, formaPagamento.getFormaPagamento());
			stm.setString(2, formaPagamento.getStatusPagamento());
			stm.setInt(3, formaPagamento.getIdPagamento());
			stm.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
    
    public void excluir(int idFormaPagamento) {
        String sqlDelete = "DELETE FROM FormaPagamento WHERE idPagamento = ?";
        try (Connection conn = ConnectionFactory.obtemConexao();
                PreparedStatement stm = conn.prepareStatement(sqlDelete);) {
            stm.setInt(1, idFormaPagamento);
            stm.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public FormaPagamento carregar(int idPagamento) {
    	FormaPagamento formaPagamento = new FormaPagamento();
    	formaPagamento.setIdPagamento(idPagamento);
		String sqlSelect = "SELECT formaPagamento, statusPagamento WHERE FormaPagamento.idPagamento = ?";
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlSelect);) {
			stm.setInt(1, formaPagamento.getIdPagamento());
			try (ResultSet rs = stm.executeQuery();) {
				if (rs.next()) {
					formaPagamento.setFormaPagamento(rs.getString("formaPagamento"));
					formaPagamento.setStatusPagamento(rs.getString("statusPagamento"));
				} else {
					formaPagamento.setIdPagamento(-1);
					formaPagamento.setFormaPagamento(null);
					formaPagamento.setStatusPagamento(null);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			System.out.print(e1.getStackTrace());
		}
		return formaPagamento;
	}
}