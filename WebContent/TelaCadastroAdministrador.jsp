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
<link href="css/TelaCadastroAdministrador.css" rel="stylesheet">
</head>
<body>
<c:import url="MenuAdmLista.jsp"/>
<div class="cadastroletraColecao">
	<div id="main" class="container">
		<h1 class="page-header">Cadastro de Administrador</h1>
		<form action="controller.do" method="post">
			<div class="row">
				<div class="form-group col-md-12 linha">
					<label for="nome">Nome:</label> <input type="text"
						class="form-control" name="nome" id="nome" required maxlength="50"
						placeholder="Nome do Administrador" />
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-12">
					<label for="email">Email: </label> <input type="text"
					 class="form-control" name="email" id="email " required maxlength="70" placeholder="Criar um E-mail" />
				</div>
			</div>

			<div class="row">
				<div class="form-group col-md-12">
					<label for="senha">Senha: </label> <input type="password"
					  class="form-control" name="senha" id="senha" required maxlength="50" placeholder="Criar uma Senha"/>
				</div>
			</div>
			<hr />
			<div class="containerLogin">
				<div id="actions" class="row">
					<div class="md-col-12">
						<button type="submit" class="botao" name="command"
							value="CriarAdministrador">Cadastrar</button>
						<a href="ListarAdministradores.jsp" class="btn btn-link">Cancelar</a>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>
<script src="js/jquery.min.js"></script>

</body>
</HTML>