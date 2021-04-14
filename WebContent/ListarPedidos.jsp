<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Buscar Pedidos</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha256-L/W5Wfqfa0sdBNIKN9cG6QA5F2qx4qICmU2VgLruv9Y="
	crossorigin="anonymous" />
<link href="css/ListaPedidos.css" rel="stylesheet">
<script src="js/jquery.min.js"></script>
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
	<!-- Modal -->

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
				<div class="modal-body">Deseja realmente excluir este Pedido?</div>
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
	<!-- /.modal -->
	<!-- Barra superior com os menus de navegação -->
	<!-- Container Principal -->
	<c:import url="MenuAdmLista.jsp" />
	<div id="main" class="container-xl">
		<form class="formTop" action="controller.do" method="post">
			<div class="row">
				<div class="col-md-12">
					<div class="titulo">Gerenciamento de Pedidos</div>
				</div>
			</div>
			<c:if test="${not empty deletePedido}">
				<div class="alert alert-danger" role="alert"> ${deletePedido}</div> 
			</c:if>
			<hr>
			<div class="botoes">
				<div id="top" class="row">
					<div class="col-md-4">
						<div class="botaoAdm">
							<div class="col-md-4">
								<a href="controller.do?command=ListarPedidosReiniciar"
									class="btn btn-light adm">Tela de Adm</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<hr />
			<div class="pesquisa">
				<div id="top" class="row">
					<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
						<div class="input-group h2">
							<input name="data[search]" class="form-control" id="search"
								type="text"
								placeholder="Pesquisar Pedidos (deixe vazio para trazer todos)">

							<span class="input-group-btn">
								<button class="btn btn-secondary" type="submit" name="command"
									value="ListarPedido">
									<i class="material-icons icon"> search </i>
								</button>
							</span>
						</div>
					</div>
				</div>
			</div>
			<!-- /#top -->
		</form>
		<hr />
		<c:if test="${not empty lista}">
			<div class="tabelaNome">
				<div id="list" class="row">
					<div class="table-responsive col-md-12 ">
						<table class="table table-striped">
							<thead>
								<tr>
									<th class="classID">ID</th>
									<th class="classValor">Valor</th>
									<th class="class">Cliente</th>
									<th class="class">Forma de Pagamento</th>
									<th class="class">Status</th>
									<th class="class">DataPedido</th>
									<th class="actions">Ações</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="pedido" items="${lista }">
							<tr>
								<td>${pedido.idPedido }</td>
								<td class="preco">${pedido.valorTotal }</td>
								<td>${pedido.cliente_idCliente }</td>
								<td>
									<c:if test="${pedido.formaPagamento_idPagamento==1}">
										Transferência bancária
									</c:if>
									<c:if test="${pedido.formaPagamento_idPagamento==2}">
										Cartão de crédito
									</c:if>
								</td>
								<td>${pedido.status }</td>
								<td>${pedido.dataPedido }</td>
								<td class="actions"><a class="btn btn-success btn-xs"
									href="controller.do?command=VisualizarPedido&idPedido=${pedido.idPedido }">Visualizar</a>

									<a class="btn btn-warning btn-xs"
									href="controller.do?command=EditarPedido&idPedido=${pedido.idPedido }">Editar</a>

									<button id="btn${pedido.idPedido }%>" type="button"
										class="btn btn-danger btn-xs deleteModal" data-toggle="modal"
										data-target="#delete-modal"
										data-cliente="${pedido.idPedido }">Excluir</button> 
										</td>
								
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</c:if>
	</div>
	<script type="text/javascript">
	$(document).on('click',".deleteModal", function(event) {
		var button = $(this); //botao que disparou a modal
		var recipient = button.data('cliente');
		$(".modal-footer #id_excluir").val(recipient);
	});
	</script>
</body>
</html>