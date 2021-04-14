<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<style>
.page-header {
	padding-top: 80px;
}

.col-md-12 {
	margin-top: 20px;
}
</style>

<head>
<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.16/jquery.mask.min.js" type="text/javascript"></script>	<script>
		$(document).ready(function(){
			var changeval = function () {
			       var p = $(this).text();
			       var nval = new Intl.NumberFormat('pt-BR', { style: 'currency', currency: 'BRL', minimumFractionDigits: 2 }).format(p);
			       $(this).text(nval);
			    }
	
			     $('.preco')
			    .each(changeval)
			    .on('change', changeval);     	    
		  });
	</script>
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
					<h4 class="modal-title" id="modalLabel">Excluir Produto</h4>
				</div>
				<div class="modal-body">Deseja realmente excluir este
					Produto?</div>
				<div class="modal-footer">
					<form action="controller.do" method="post">
						<input type="hidden" name="idProduto" id="id_excluir" />
						<button type="submit" class="btn btn-primary" name="command"
							value="ExcluirProduto">Sim</button>

						<button type="button" class="btn btn-default" data-dismiss="modal">N&atilde;o</button>

					</form>
				</div>
			</div>
		</div>
	</div>
	<c:import url="MenuAdmLista.jsp" />
	<div id="main" class="container">
		<h3 class="page-header" align="center">Visualizar Informações do
			Produto</h3>
		<br>
		<c:if test="${not empty alter}">
				<div class="alert alert-warning" role="alert"> ${alter}</div> 
		</c:if>
		<form action="controller.do" method="post">

			<div class="row">
				<div class="form-group col-md-12">
					<p>
						<strong>Id: </strong> <br> ${produto.idProduto }
					</p>
				</div>
			</div>

			<div class="row">
				<div class="form-group col-md-12">
					<p>
						<strong>Nome: </strong> <br> ${produto.nome }
					</p>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-12">
					<p>
						<strong>Modelo: </strong> <br> ${produto.modelo }
					</p>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-12">
					<p>
						<strong>Valor: </strong> <br><span class="preco">${produto.valor }</span>
					</p>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-12">
					<p>
						<strong>Capacidade: </strong> <br> ${produto.capacidade }
					</p>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-12">
					<p>
						<strong>Cor: </strong> <br> ${produto.cor }
					</p>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-12">
					<p>
						<strong>Quantidade: </strong> <br> ${produto.quantidadeEstoque}
					</p>
				</div>
			</div>
			<div class="row">
			<div class="form-group col-md-12">
				<p>
					<strong>Imagem: </strong> <br> 
					<img width="150px" src="data:image/jpg;base64,${produto.base64Image}">
				</p>
			</div>
			</div>
			
			<hr />
			<div class="containerLogin">
				<div id="actions" class="row">
					<div class="md-col-12">
						<a class="btn btn-primary btn-sm"
							href="controller.do?command=EditarProduto&idProduto=${produto.idProduto}">Editar</a>
						<button id="btn${produto.idProduto }%>" type="button"
										class="btn btn-danger btn-sm deleteModal" data-toggle="modal"
										data-target="#delete-modal"
										data-cliente="${produto.idProduto }">Excluir</button>

						<a href="controller.do?command=ListarProduto" class="btn btn-light btn-sm"
							role="button" aria-pressed="true">Voltar</a>
					</div>
				</div>
			</div>
		</form>
	</div>
	<script type="text/javascript">
	$(document).on('click',".deleteModal", function(event) {
		var button = $(this); //botao que disparou a modal
		var recipient = button.data('cliente');
		$(".modal-footer #id_excluir").val(recipient);
	});
	</script>
</body>
</HTML>