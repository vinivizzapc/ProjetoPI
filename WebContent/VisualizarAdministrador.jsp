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
</head>
<body>
<div class="modal fade" id="delete-modal" tabindex="-1" role="dialog"
	aria-labelledby="modalLabel">

	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">

				<button type="button" class="close" data-dismiss="modal"
					aria-label="Fechar">
					<span aria-hidden="true">&times;</span>

				</button>
				<h4 class="modal-title" id="modalLabel">Excluir Administrador</h4>
			</div>
			<div class="modal-body">Deseja realmente excluir este Administrador?
			</div>
			<div class="modal-footer">
				<form action="controller.do" method="post">
					<input type="hidden" name="idAdministrador" id="id_excluir" />
					<button type="submit" class="btn btn-primary" name="command"
						value="ExcluirAdministrador">Sim</button>

					<button type="button" class="btn btn-default" data-dismiss="modal">N&atilde;o</button>

				</form>
			</div>
		</div>
	</div>
</div>
<c:import url="MenuAdmLista.jsp"/>
<div id="main" class="container">
	<h3 class="page-header" align="center">Visualizar Informações do Administrador</h3>
	<br>
	<c:if test="${not empty alterAdm}">
		<div class="alert alert-warning" role="alert"> ${alterAdm}</div> 
	</c:if>
	<form action="controller.do" method="post">
		<div class="row">
			<div class="form-group col-md-12 linha">
				<p>
					<strong>Nome: </strong> <br> ${administrador.nome}
				</p>
			</div>
			</div>
				<div class="row">
			<div class="form-group col-md-12">
				<p>
					<strong>Email: </strong> <br> ${administrador.email}
				</p>
			</div>
			</div>
			<div class="row">
			<div class="form-group col-md-12">
				<p>
					<strong>Senha: </strong> <br> ${administrador.senha }
				</p>
			</div>
			</div>
			<hr />
			<div class="containerLogin">
				<div id="actions" class="row">
					<div class="md-col-12">
						<a class="btn btn-primary btn-sm"
							href="controller.do?command=EditarAdministrador&idAdministrador=${administrador.idAdministrador}">Editar</a>
						<button id="btn${administrador.idAdministrador }%>"
												type="button" class="btn btn-danger btn-sm deleteModal"
												data-toggle="modal" data-target="#delete-modal"
												data-cliente="${administrador.idAdministrador }">Excluir</button>

						<a href="controller.do?command=ListarAdministrador" class="btn btn-light btn-sm"
							role="button" aria-pressed="true">Voltar</a>
					</div>
				</div>
			</div>
	</form>
</div>
<script src="js/jquery.min.js"></script>
<script type="text/javascript">
	$(document).on('click',".deleteModal", function(event) {
		var button = $(this); //botao que disparou a modal
		var recipient = button.data('cliente');
		$(".modal-footer #id_excluir").val(recipient);
	});
	</script>
</body>
</HTML>