<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="pt-br">
<style>
	.page-header{
		padding-top: 80px;
	}
	
	.linha{
		padding-top: 50px;
	}
</style>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Editar Colecoes</title>
	<link href="css/style.css" rel="stylesheet">
</head>
<body>
<c:import url="MenuAdmLista.jsp"/>
<div class="cadastroletraLogin">
	<div id="main" class="container">
		<h3 class="page-header" align="center">Editar Coleção</h3>
		<form action="controller.do " method="post">
			<input type="hidden" name="idColecao" value="${colecao.idColecao}"/>
			<div class="row">
				<div class="form-group col-md-12 linha">
					<label for="nome">Nome:
					</label> <input value="${colecao.nome}" type="text" class="form-control"
						name="nome" id="nome" maxlength="50" />
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-12">
					<label for="nome">Imagem da Coleção:</label> 
					<br>
					<input type="file" name="imagem_colecao" id="imagem_colecao" maxlength="50" />
				</div>
			</div>				
			<hr>
			<div class="containerLogin">
				<div id="actions" class="row">
					<div class="md-col-12">
						<button type="submit" class="btn btn-primary" name="command" value="AlterarColecao">Alterar</button>
						<a href="ListarColecoes.jsp" class="btn btn-danger"
							role="button" aria-pressed="true">Cancelar</a>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>
<script src="js/jquery.min.js"></script>
</body>
</HTML>