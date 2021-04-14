package model;

import java.util.ArrayList;
import java.util.Date;

public class Pedido {
	private int idPedido;
	private double valorTotal;
	private String status;
	private int cliente_idCliente;
	private ArrayList<ItemPedido> itens;
	private int formaPagamento_idPagamento;
	private Date dataPedido;
	
	public Pedido() {
		itens = new ArrayList<ItemPedido>();
	}
	
	public Pedido(int idPedido, double valorTotal, String status, int cliente_idCliente, int formaPagamento_idPagamento) {
		this.idPedido = idPedido;
		this.valorTotal = valorTotal;
		this.status = status;
		this.cliente_idCliente = cliente_idCliente;
		this.formaPagamento_idPagamento = formaPagamento_idPagamento;
		itens = new ArrayList<ItemPedido>();
	}

	public ArrayList<ItemPedido> getItens() {
		return itens;
	}

	public void setItens(ArrayList<ItemPedido> itens) {
		this.itens = itens;
	}

	public int getIdPedido() {
		return idPedido;
	}


	public void setIdPedido(int idPedido) {
		this.idPedido = idPedido;
	}


	public double getValorTotal() {
		return valorTotal;
	}


	public void setValorTotal(double valorTotal) {
		this.valorTotal = valorTotal;
	}


	public int getCliente_idCliente() {
		return cliente_idCliente;
	}


	public void setCliente_idCliente(int cliente_idCliente) {
		this.cliente_idCliente = cliente_idCliente;
	}


	public int getFormaPagamento_idPagamento() {
		return formaPagamento_idPagamento;
	}


	public void setFormaPagamento_idPagamento(int formaPagamento_idPagamento) {
		this.formaPagamento_idPagamento = formaPagamento_idPagamento;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}
	
	public Date getDataPedido() {
		return dataPedido;
	}

	public void setDataPedido(Date dataPedido) {
		this.dataPedido = dataPedido;
	}
}