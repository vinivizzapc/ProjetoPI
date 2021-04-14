<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Buscar Clientes</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha256-L/W5Wfqfa0sdBNIKN9cG6QA5F2qx4qICmU2VgLruv9Y="
	crossorigin="anonymous" />
<link href="css/ListaAdministradores.css" rel="stylesheet">
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
					<h4 class="modal-title" id="modalLabel">Excluir Cliente</h4>
				</div>
				<div class="modal-body">Deseja realmente excluir este Cliente?</div>
				<div class="modal-footer">
					<form action="controller.do" method="post">
						<input type="hidden" name="idCliente" id="id_excluir" />
						<button type="submit" class="btn btn-primary" name="command"
							value="ExcluirCliente">Sim</button>

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
	<div id="main" class="container-fluid">
		<div class="divContainer">
			<form class="formTop" action="controller.do" method="post">
			<div class="row">
				<div class="col-md-12">
					<div class="titulo">Gerenciamento de Clientes</div>
				</div>
			</div>
			<c:if test="${not empty deleteCli}">
				<div class="alert alert-danger" role="alert"> ${deleteCli}</div> 
			</c:if>
			<hr>	
			<div class="botoes">
				<div id="top" class="row">
						<div class="col-md-4">
							<a href="controller.do?command=ListarClientesReiniciar"
								class="btn btn-light adm">Tela de Adm</a>
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
								placeholder="Pesquisar Clientes (deixe vazio para trazer todos)">

							<span class="input-group-btn">
								<button class="btn btn-secondary" type="submit" name="command"
									value="ListarCliente">
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
									<th class="classNome">Nome</th>
									<th class="classEmail">Email</th>
									<th class="classSenha">Senha</th>
									<th class="classCpf">CPF</th>
									<th class="classFone">Fone</th>
									<th class="classEndereco">Endereço</th>
									<th class="classPais">Pais</th>
									<th class="classEstado">Estado</th>
									<th class="classCep">CEP</th>
									<th class="classBairro">Bairro</th>
									<th class="classNumero">Numero</th>
									<th class="classComplemento">Complemento</th>
									<th class="actions">Ações</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="cliente" items="${lista }">
									<tr>
										<td>${cliente.idCliente}</td>
										<td>${cliente.nome}</td>
										<td>${cliente.email}</td>
										<td>${cliente.senha}</td>
										<td>${cliente.cpf}</td>
										<td>${cliente.fone}</td>
										<td>${cliente.endereco}</td>
										<td>${cliente.pais}</td>
										<td>${cliente.estado}</td>
										<td>${cliente.cep}</td>
										<td>${cliente.bairro}</td>
										<td>${cliente.numero}</td>
										<td>${cliente.complemento}</td>
										<td class="actions"><a class="btn btn-success btn-xs"
											href="controller.do?command=VisualizarCliente&idCliente=${cliente.idCliente }">Visualizar</a>

											<a class="btn btn-warning btn-xs"
											href="controller.do?command=EditarCliente&idCliente=${cliente.idCliente }">Editar</a>

											<button id="btn${cliente.idCliente }%>" type="button"
												class="btn btn-danger btn-xs deleteModal" data-toggle="modal"
												data-target="#delete-modal"
												data-cliente="${cliente.idCliente }">Excluir</button></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</c:if></div>
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
</html>