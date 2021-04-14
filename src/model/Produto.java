package model;

import java.util.ArrayList;
import java.util.Arrays;

public class Produto {
	private int idProduto;
	private String nome;
	private String modelo;
	private double valor;
	private String capacidade;
	private String cor;
	private int quantidadeEstoque;
	private byte[] imagem_produto;
	private String base64Image;
	private int Fk_IdColecao;
	private ArrayList<Produto> produtos;
	
	public String Money(){
	return null;	
	}
	
	
	public Produto() {
		
	}
	
	public Produto(int idProduto){
		this.idProduto = idProduto;
	}
	
	public Produto(int idProduto, String nome, String modelo, double valor, String capacidade, String cor, String base64Image) {
		this.idProduto = idProduto;
		this.nome = nome;
		this.modelo = modelo;
		this.valor = valor;
		this.capacidade = capacidade;
		this.cor = cor;
		this.base64Image = base64Image;
	}
	
	public Produto(int idProduto, String nome, String modelo, double valor, String capacidade, String cor, int quantidadeEstoque, byte[] imagem_produto, String base64Image, int Fk_IdColecao) {
		this.idProduto = idProduto;
		this.nome = nome;
		this.modelo = modelo;
		this.valor = valor;
		this.capacidade = capacidade;
		this.cor = cor;
		this.quantidadeEstoque = quantidadeEstoque;
		this.imagem_produto = imagem_produto;
		this.base64Image = base64Image;
		this.Fk_IdColecao = Fk_IdColecao;
	}

	public int getIdProduto() {
		return idProduto;
	}

	public void setIdProduto(int idProduto) {
		this.idProduto = idProduto;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getModelo() {
		return modelo;
	}

	public void setModelo(String modelo) {
		this.modelo = modelo;
	}

	public double getValor() {
		return valor;
	}

	public void setValor(double valor) {
		this.valor = valor;
	}

	public String getCapacidade() {
		return capacidade;
	}

	public void setCapacidade(String capacidade) {
		this.capacidade = capacidade;
	}

	public String getCor() {
		return cor;
	}

	public void setCor(String cor) {
		this.cor = cor;
	}
	
	public int getQuantidadeEstoque() {
		return quantidadeEstoque;
	}

	public void setQuantidadeEstoque(int quantidadeEstoque) {
		this.quantidadeEstoque = quantidadeEstoque;
	}

	public byte[] getImagem_produto() {
		return imagem_produto;
	}
	public String getBase64Image() {
		return base64Image;
	}
	public void setBase64Image(String base64Image) {
		this.base64Image= base64Image;
	}

	public void setImagem_produto(byte[] imagem_produto) {
		this.imagem_produto = imagem_produto;
	}
	
	public int getFk_IdColecao() {
		return Fk_IdColecao;
	}

	public void setFk_IdColecao(int fk_IdColecao) {
		Fk_IdColecao = fk_IdColecao;
	}
	
	public ArrayList<Produto> getProdutos() {
		return produtos;
	}

	public void setProdutos(ArrayList<Produto> produtos) {
		this.produtos = produtos;
	}

	@Override
	public String toString() {
		return "Produto [idProduto=" + idProduto + ", nome=" + nome + ", modelo=" + modelo + ", valor=" + valor
				+ ", capacidade=" + capacidade + ", cor=" + cor + ", quantidadeEstoque=" + quantidadeEstoque
				+ ", imagem_produto=" + Arrays.toString(imagem_produto) + ", base64Image=" + base64Image + "]";
	}
}
