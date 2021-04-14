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
<link href="css/style.css" rel="stylesheet">
<script src="js/bootstrap.min.js"></script>
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
<c:import url="MenuAdmLista.jsp"/>

<div class="cadastroletraLogin">
	<div id="main" class="container">
		<h3 class="page-header" align="center">Editar Produto</h3>
		<br>
		<form action="controller.do " method="post">
			<input type="hidden" name="idProduto" value="${produto.idProduto}" />
			<div class="row">
				<div class="form-group col-md-12">
					<label for="nome">Nome: </label> <input value="${produto.nome}"
						type="text" class="form-control" name="nome" id="nome"
						maxlength="50" />
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-12">
					<label for="modelo">Modelo: </label> <input
						value="${produto.modelo}" type="text" class="form-control"
						name="modelo" id="modelo" maxlength="50" />
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-12">
					<label for="valor">Valor: </label> <input
						value="${produto.valor}" type="text" class="form-control preco"
						name="valor" id="valor" maxlength="50" />
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-12">
					<label for="capacidade">Capacidade: </label> <input
						value="${produto.capacidade}" type="text" class="form-control"
						name="capacidade" id="capacidade" maxlength="100" />
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-12">
					<label for="cor">Cor: </label> <input value="${produto.cor}"
						type="text" class="form-control" name="cor" id="cor"
						maxlength="100" />
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-12">
					<label for="cor">Quantidade: </label> <input value="${produto.quantidadeEstoque}"
						type="text" class="form-control" name="quantidadeEstoque" id="quantidadeEstoque"
						maxlength="100" />
				</div>
			</div>
			<hr />
			<div class="containerLogin">
				<div id="actions" class="row">
					<div class="md-col-12">
						<button type="submit" class="btn btn-primary" name="command"
							value="AlterarProduto">Alterar</button>
						<a href="ListarProdutos.jsp" class="btn btn-danger" role="button"
							aria-pressed="true">Cancelar</a>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>
<script src="js/jquery.min.js"></script>

</body>
</HTML>