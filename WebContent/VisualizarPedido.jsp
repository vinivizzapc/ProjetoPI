<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<style>
.page-header {
	padding-top: 80px;
}

.linha {
	padding-top: 40px;
}
</style>
<head>
<script src="js/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.16/jquery.mask.min.js"
	type="text/javascript"></script>
<script>
	$(document).ready(function() {
		var changeval = function() {
			var p = $(this).text();
			var nval = new Intl.NumberFormat('pt-BR', {
				style : 'currency',
				currency : 'BRL',
				minimumFractionDigits : 2
			}).format(p);
			$(this).text(nval);
		}

		$('.preco').each(changeval).on('change', changeval);
	});
</script>
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
					<h4 class="modal-title" id="modalLabel">Excluir Pedido</h4>
				</div>
				<div class="modal-body">Deseja realmente excluir este Pedido?
				</div>
				<div class="modal-footer">
					<form action="controller.do" method="post">
						<input type="hidden" name="idPedido" id="id_excluir" />
						<button type="submit" class="btn btn-primary" name="command"
							value="ExcluirPedido">Sim</button>

						<button type="button" class="btn btn-default" data-dismiss="modal">N&atilde;o</button>

					</form>
				</div>
			</div>
		</div>
	</div>
	<c:import url="MenuAdmLista.jsp" />
	<div id="main" class="container">
		<h3 class="page-header" align="center">Visualizar Informações do
			Pedido</h3>
		<br>
		<c:if test="${not empty pedidoEnv}">
				<div class="alert alert-success" role="alert"> ${pedidoEnv}</div> 
		</c:if>
		<c:if test="${not empty alterPedido}">
				<div class="alert alert-warning" role="alert"> ${alterPedido}</div> 
		</c:if>
		<form action="controller.do" method="post">
			<div class="row">
				<div class="form-group col-md-12 linha">
					<p>
						<strong>Id: </strong> <br> ${pedido.idPedido}
					</p>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-12">
					<p>
						<strong>Id Cliente: </strong> <br>
						${pedido.cliente_idCliente}
					</p>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-12">
					<p>
						<strong>Valor Total: </strong> <br> <span class="preco">${pedido.valorTotal}</span>
					</p>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-12">
					<p>
						<strong>Forma de Pagamento: </strong> <br>
						<c:if test="${pedido.formaPagamento_idPagamento==1}">
										Transferência bancária
									</c:if>
									<c:if test="${pedido.formaPagamento_idPagamento==2}">
										Cartão de crédito
									</c:if>
					</p>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-12">
					<p>
						<strong>Status: </strong> <br> ${pedido.status}
					</p>
				</div>
			</div>

			<div class="row">
				<div class="form-group col-md-12">
					<p>
						<strong>Data do Pedido: </strong> <br> ${pedido.dataPedido}
					</p>
				</div>
			</div>

			<hr />
			<div class="containerLogin">
				<div id="actions" class="row">
					<div class="md-col-12">
						<a class="btn btn-primary btn-sm"
							href="controller.do?command=EditarPedido&idPedido=${pedido.idPedido}">Editar</a>
						<button id="btn${pedido.idPedido }%>" type="button"
							class="btn btn-danger btn-sm deleteModal" data-toggle="modal"
							data-target="#delete-modal" data-cliente="${pedido.idPedido }">Excluir</button>
						<c:if test="${pedido.status=='em andamento'}">
							<a class="btn btn-success btn-sm"
								href="controller.do?command=EnviarPedido&idPedido=${pedido.idPedido}">Enviar Pedido</a>
						</c:if>
						<a href="controller.do?command=ListarPedido"
							class="btn btn-light btn-sm" role="button" aria-pressed="true">Voltar</a>
					</div>
				</div>
			</div>
		</form>
	</div>
	<script src="js/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).on('click', ".deleteModal", function(event) {
			var button = $(this); //botao que disparou a modal
			var recipient = button.data('cliente');
			$(".modal-footer #id_excluir").val(recipient);
		});
	</script>
</body>
</HTML>