<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="pt-br">
<style>
	.page-header{
		padding-top: 80px;
	}
	
	.linha{
		padding-top: 40px;
	}
</style>
<head>
<link href="css/style.css" rel="stylesheet">
</head>
<body>
<c:import url="MenuAdmLista.jsp"/>
<div class="cadastroletraLogin">
	<div id="main" class="container">
		<h3 class="page-header" align="center">Editar Administrador</h3>
		<br>
		<form action="controller.do " method="post">
			<input type="hidden" name="idAdministrador" value="${administrador.idAdministrador}"/>
			<div class="row">
				<div class="form-group col-md-12 linha">
					<label for="nome">Nome:
					</label> <input value="${administrador.nome}" type="text" class="form-control"
						name="nome" id="nome" maxlength="50" />
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-6">
					<label for="email">E-mail:
					</label> <input value="${administrador.email}" type="text" class="form-control"
						name="email" id="email" maxlength="50" />
				</div>
				<div class="form-group col-md-6">
					<label for="senha">Senha:
					</label> <input value="${administrador.senha}" type="text" class="form-control"
						name="senha" id="senha" maxlength="100" />
				</div>
			</div>
			<hr />
			<div class="containerLogin">
				<div id="actions" class="row">
					<div class="md-col-12">
						<button type="submit" class="btn btn-primary" name="command" value="AlterarAdministrador">Alterar</button>
						<a href="ListarAdministradores.jsp" class="btn btn-danger"
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