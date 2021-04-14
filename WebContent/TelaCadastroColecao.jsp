<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<style>
	.page-header{
		padding-top: 80px;
	}
	
	.linha{
		padding-top: 40px;
	}
</style>
<head>
<!-- Bootstrap CSS -->
<link href="css/TelaCadastroColecao.css" rel="stylesheet">
</head>
<body>
<c:import url="MenuAdmLista.jsp"/>
<div class="cadastroletraColecao">
	<div id="main" class="container">
		<h1 class="page-header">Cadastro de Coleções</h1>
		<form enctype="multipart/form-data" action="controller.do" method="post">
		<div class="row">
			<div class="form-group col-md-12 linha">
				<label for="nome">Nome:</label> <input type="text"
					class="form-control" name="nome" id="nome" required maxlength="50"
					placeholder="Nome da Marca" />
			</div>
		</div>
		<div class="row">
			<div class="form-group col-md-12">
				<label for="imagem_colecao">Imagem da Coleção: </label> 
				<br>
				<input type="file"
					name="imagem_colecao" id="imagem_colecao" />
			</div>
		</div>
	<hr />
	<div class="containerLogin">
			<div id="actions" class="row">
				<div class="md-col-12">
					<button type="submit" class="botao" name="command"
						value="CriarColecao">Cadastrar</button>
					<a href="ListarColecoes.jsp" class="btn btn-link">Cancelar</a>
				</div>
			</div>
		</div>
		</form>
	</div>
</div>
<script src="js/jquery.min.js"></script>
</body>
</HTML>