package model;

public class FormaPagamento {
	private int idPagamento;
	private String formaPagamento;
	private String statusPagamento;
	
	public FormaPagamento() {
		
	}

	public FormaPagamento(int idPagamento, String formaPagamento, String statusPagamento) {
		super();
		this.idPagamento = idPagamento;
		this.formaPagamento = formaPagamento;
		this.statusPagamento = statusPagamento;
	}

	public int getIdPagamento() {
		return idPagamento;
	}

	public void setIdPagamento(int idPagamento) {
		this.idPagamento = idPagamento;
	}

	public String getFormaPagamento() {
		return formaPagamento;
	}

	public void setFormaPagamento(String formaPagamento) {
		this.formaPagamento = formaPagamento;
	}

	public String getStatusPagamento() {
		return statusPagamento;
	}

	public void setStatusPagamento(String statusPagamento) {
		this.statusPagamento = statusPagamento;
	}

	@Override
	public String toString() {
		return "FormaPagamento [idPagamento=" + idPagamento + ", formaPagamento=" + formaPagamento
				+ ", statusPagamento=" + statusPagamento + "]";
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		FormaPagamento other = (FormaPagamento) obj;
		if (formaPagamento == null) {
			if (other.formaPagamento != null)
				return false;
		} else if (!formaPagamento.equals(other.formaPagamento))
			return false;
		if (idPagamento != other.idPagamento)
			return false;
		if (statusPagamento == null) {
			if (other.statusPagamento != null)
				return false;
		} else if (!statusPagamento.equals(other.statusPagamento))
			return false;
		return true;
	}
}
