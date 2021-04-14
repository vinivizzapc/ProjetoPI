<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="pt-br">
<style>

.page-header{
	padding-top: 85px;
}

.linha{
	padding-top:100px;
}

</style>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Buscar Colecoes</title>
</head>
<body>
<c:import url="MenuAdmLista.jsp"/>
<div class="modal fade" id="delete-modal" tabindex="-1" role="dialog"
	aria-labelledby="modalLabel">

	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">

				<button type="button" class="close" data-dismiss="modal"
					aria-label="Fechar">
					<span aria-hidden="true">&times;</span>

				</button>
				<h4 class="modal-title" id="modalLabel">Excluir Colecao</h4>
			</div>
			<div class="modal-body">Deseja realmente excluir este colecao?
			</div>
			<div class="modal-footer">
				<form action="controller.do" method="post">
					<input type="hidden" name="idColecao" id="id_excluir" />
					<button type="submit" class="btn btn-primary" name="command"
						value="ExcluirColecao">Sim</button>

					<button type="button" class="btn btn-default" data-dismiss="modal">N&atilde;o</button>

				</form>
			</div>
		</div>
	</div>
</div>
<div id="main" class="container">
	<h3 class="page-header" align="center">Visualizar Informações da Coleção</h3>
	<br>
	<c:if test="${not empty alterCol}">
		<div class="alert alert-warning" role="alert"> ${alterCol}</div> 
	</c:if>
	<form action="controller.do" method="post">
	<div class="row">
			<div class="form-group col-md-12 linha">
				<p>
					<strong>Id: </strong> <br> ${colecao.idColecao}
				</p>
			</div>
			</div>
		<div class="row">
			<div class="form-group col-md-12">
				<p>
					<strong>Nome: </strong> <br> ${colecao.nome}
				</p>
			</div>
			</div>	
			<div class="row">
			<div class="form-group col-md-12">
				<p>
					<strong>Imagem: </strong> <br> 
					<img class="img_colecao" src="data:image/jpg;base64,${colecao.base64Image}">
				</p>
			</div>
			</div>
			<hr />
			<div class="containerLogin">
				<div id="actions" class="row">
					<div class="md-col-12">
						<a class="btn btn-primary btn-sm"
							href="controller.do?command=EditarColecao&idColecao=${colecao.idColecao}">Editar</a>
						<a id="btn${colecao.idColecao }>" type="button"
										class="btn btn-danger btn-sm deleteModal" data-toggle="modal"
										data-target="#delete-modal" data-idColecao="${colecao.idColecao}" data-cliente="${colecao.idColecao }" href="#delete-modal">Excluir</a></td>


						<a href="controller.do?command=ListarColecao" class="btn btn-light btn-sm"
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