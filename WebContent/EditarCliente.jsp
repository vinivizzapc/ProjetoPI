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
<c:import url="MenuAdmLista.jsp"/>
<div class="cadastroletraLogin">
	<div id="main" class="container">
		<h3 class="page-header" align="center">Editar Cliente</h3>
		<br>
		<form action="controller.do " method="post">
			<h3>Informações do Usuário</h3>
			<input type="hidden" name="idCliente" value="${cliente.idCliente}"/>
			<div class="row">
				<div class="form-group col-md-12 linha">
					<label for="nome">Nome:
					</label> <input value="${cliente.nome}" type="text" class="form-control"
						name="nome" id="nome" maxlength="50" />
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-6">
					<label for="email">E-mail:
					</label> <input value="${cliente.email}" type="text" class="form-control"
						name="email" id="email" maxlength="50" />
				</div>
				<div class="form-group col-md-6">
					<label for="senha">Senha:
					</label> <input value="${cliente.senha}" type="text" class="form-control"
						name="senha" id="senha" maxlength="100" />
				</div>
				</div>
				<div class="row">
				<div class="form-group col-md-6">
					<label for="cpf">CPF: </label>
					<input value="${cliente.cpf}" type="text" class="form-control"
						name="cpf" id="cpf" maxlength="100" />
				</div>
					<div class="form-group col-md-6">
					<label for="fone">Telefone: </label>
					<input value="${cliente.fone}" type="text" class="form-control"
						name="fone" id="fone" maxlength="100" />
				</div>
			</div>
			<h3>Informações do Endereço</h3>
			<div class="row">
				<div class="form-group col-md-12">
					<label for="pais">País: </label> 
					<input value="${cliente.pais}" type="text" class="form-control"
						name="pais" id="pais" maxlength="50" />
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-6">
					<label for="cep">CEP: </label>
					<input value="${cliente.cep}" type="text" class="form-control"
						name="cep" id="cep" maxlength="100" />
				</div>
				<div class="form-group col-md-6">
					<label for="estado">Estado:
					</label> <input value="${cliente.estado}" type="text" class="form-control"
						name="estado" id="estado" maxlength="100" />
				</div>
				</div>
				<div class="row">
				<div class="form-group col-md-6">
					<label for="bairro">Bairro:
					</label> <input value="${cliente.bairro}" type="text" class="form-control"
						name="bairro" id="bairro"  maxlength="100" />
				</div>

				<div class="form-group col-md-6">
					<label for="endereco">Endereço:
					</label> <input value="${cliente.endereco}" type="text"
						class="form-control" name="endereco" id="endereco" 
						maxlength="50" />
				</div>
				</div>
				<div class="row">
				<div class="form-group col-md-6">
					<label for="numero">Número:
					</label> <input value="${cliente.numero}" type="text" class="form-control"
						name="numero" id="numero"  maxlength="100" />
				</div>
				<div class="form-group col-md-6">
					<label for="complemento">Complemento:
					</label> <input value="${cliente.complemento}" type="text"
						class="form-control" name="complemento" id="complemento" 
						maxlength="100" />
				</div>
			</div>
			<hr />
			<div class="containerLogin">
				<div id="actions" class="row">
					<div class="md-col-12">
						<button type="submit" class="btn btn-primary" name="command" value="AlterarCliente">Alterar</button>
						<a href="ListarClientes.jsp" class="btn btn-danger"
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