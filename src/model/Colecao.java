package model;

public class Colecao {
	private int idColecao;
	private String nome;
	private byte[] imagem_colecao;
	private String base64Image;
	
	public Colecao() {
		
	}
	
	public Colecao(int idColecao, String nome, byte[] imagem_colecao, String base64Image) {
		this.idColecao = idColecao;
		this.nome = nome;
		this.imagem_colecao = imagem_colecao;
	}

	public int getIdColecao() {
		return idColecao;
	}

	public void setIdColecao(int idColecao) {
		this.idColecao = idColecao;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public byte[] getImagem_colecao() {
		return imagem_colecao;
	}

	public void setImagem_colecao(byte[] imagem_colecao) {
		this.imagem_colecao = imagem_colecao;
	}
	public String getBase64Image() {
		return base64Image;
	}

	public void setBase64Image(String base64Image) {
		this.base64Image = base64Image;
	}
}
