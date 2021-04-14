<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<style>
.cadastroletra {
	padding-top: 95px;
}
</style>

<head>
<!-- Bootstrap CSS -->
<link href="css/TelaCadastroProduto.css" rel="stylesheet">
</head>
<body>
	<c:import url="MenuAdmLista.jsp" />
	<div class="cadastroletra">
		<div id="main" class="container">
			<h1 class="page-header">Cadastro de Produtos</h1>
			<form enctype="multipart/form-data" action="controller.do"
				method="post">
				<div class="row">
					<div class="form-group col-md-12">
						<label for="nome">Nome: </label> <input type="text"
							class="form-control" name="nome" id="nome" required
							maxlength="50" placeholder="Nome Produto" />
					</div>
				</div>
				<div class="row">
					<div class="form-group col-md-12">
						<label for="modelo">Modelo: </label> <input type="text"
							class="form-control" name="modelo" id="modelo" required
							maxlength="60" placeholder="Modelo Produto" />
					</div>
				</div>
				<div class="row">
					<div class="form-group col-md-12">
						<label for="Fk_IdColecao">Nome da Coleção: </label>
							<select class="form-control" name="Fk_IdColecao"
							id="Fk_IdColecao" required>
								<c:forEach var="colecao" items="${lista}">
									<option value="${colecao.idColecao}">${colecao.nome}</option> 
								</c:forEach>
							</select>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-md-12">
						<label for="valor">Valor: </label> <input type="text"
							class="form-control" name="valor" id="valor" required
							maxlength="100" placeholder="Valor do Produto" />
					</div>
				</div>
				<div class="row">
					<div class="form-group col-md-12">
						<label for="capacidade">Capacidade: </label> <input type="text"
							class="form-control" name="capacidade" id="capacidade"
							maxlength="11" placeholder="Capacidade Produto" required />
					</div>
				</div>
				<div class="row">
					<div class="form-group col-md-12">
						<label for="cor">Cor: </label> <input type="text"
							class="form-control" name="cor" id="cor" required maxlength="12"
							placeholder="Cor Produto" required />
					</div>
				</div>

				<div class="row">
					<div class="form-group col-md-12">
						<label for="quantidadeEstoque">Quantidade: </label> <input
							type="text" class="form-control" name="quantidadeEstoque"
							id="quantidadeEstoque" required maxlength="12"
							placeholder="Quantidade em Estoque" required />
					</div>
				</div>

				<div class="row">
					<div class="form-group col-md-12">
						<label for="imagem_produto">Imagem: </label><br>
						<input type="file" name="imagem_produto" id="imagem_produto"
							required maxlength="12" placeholder="Imagem Produto" required />
					</div>
				</div>
				<hr />
				<div id="actions" class="row">
					<div class="md-col-12">
						<button type="submit" class="botao" name="command"
							value="CriarProduto">Cadastrar</button>
						<a href="controller.do?command=ListarProdutosReiniciarCad" class="btn btn-link">Cancelar</a>
					</div>
				</div>
			</form>

		</div>
	</div>
	<script src="js/jquery.min.js"></script>
</body>
</HTML>