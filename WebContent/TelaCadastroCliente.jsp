<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<body>
<head>
<!-- Adicionando JQuery -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<!-- Adicionando Javascript -->

<script type="text/javascript">
	$(document).ready(
			function() {

				function limpa_formulário_cep() {
					// Limpa valores do formulário de cep.
					$("#endereco").val("");
					$("#bairro").val("");
					$("#estado").val("");
				}

				//Quando o campo cep perde o foco.
				$("#cep").blur(
						function() {

							//Nova variável "cep" somente com dígitos.
							var cep = $(this).val().replace(/\D/g, '');

							//Verifica se campo cep possui valor informado.
							if (cep != "") {

								//Expressão regular para validar o CEP.
								var validacep = /^[0-9]{8}$/;

								//Valida o formato do CEP.
								if (validacep.test(cep)) {

									//Preenche os campos com "..." enquanto consulta webservice.
									$("#endereco").val("...");
									$("#bairro").val("...");
									$("#estado").val("...");

									//Consulta o webservice viacep.com.br/
									$.getJSON("https://viacep.com.br/ws/" + cep
											+ "/json/?callback=?", function(
											dados) {

										if (!("erro" in dados)) {
											//Atualiza os campos com os valores da consulta.
											$("#endereco")
													.val(dados.logradouro);
											$("#bairro").val(dados.bairro);
											$("#estado").val(dados.uf);
										} //end if.
										else {
											//CEP pesquisado não foi encontrado.
											limpa_formulário_cep();
											alert("CEP não encontrado.");
										}
									});
								} //end if.
								else {
									//cep é inválido.
									limpa_formulário_cep();
									alert("Formato de CEP inválido.");
								}
							} //end if.
							else {
								//cep sem valor, limpa formulário.
								limpa_formulário_cep();
							}
						});
			});
</script>
<!-- Bootstrap CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/TelaCadastroCliente.css" rel="stylesheet">
</head>

<c:import url="header.jsp" />
<c:import url="Menu.jsp" />
<div class="cadastroletra">
	<div id="main" class="container">
		<br> <br>
		<h1 class="page-header">Cadastro</h1>
		<br>
		<c:if test="${not empty err}">
			<div class="alert alert-danger" role="alert">${err}</div>
		</c:if>
		<c:out value="${msg}"></c:out>
		<h4>
			<strong>Informações de login</strong>
		</h4>
		<br>
		<form action="controller.do" method="post">
			<div class="row">
				<div class="form-group col-md-12">
					<label class="control-label" for="email">Email: </label> <input
						type="email" class="form-control" name="email" id="email" required
						maxlength="50" placeholder="E-mail" />
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-12">
					<label for="senha">Senha: </label> <input type="password"
						class="form-control" name="senha" id="senha" required
						maxlength="100" placeholder="Digite uma senha" />
				</div>
			</div>
			<div class="checkNotificacao">
				<input class="notificaçao" type="checkbox" id="notificaçao"
					name="notificaçao"> <label for="notificaçao">Quero
					receber novidades e ofertas exclusiva</label>
			</div>
			<h5 class="page-header"></h5>
			<h4>
				<strong> Informações de contato </strong>
			</h4>
			<br>
			<div class="row">
				<div class="form-group col-md-12">
					<label for="nome">Nome: </label> <input type="text"
						class="form-control" name="nome" id="nome" required maxlength="60"
						placeholder="Nome Completo" />
				</div>
			</div>
						<div class="row">
				<div class="form-group col-md-12">
					<label for="cpf">CPF: </label> <input type="text"
						class="form-control" onkeypress='return event.charCode >= 48 && event.charCode <= 57' name="cpf" id="cpf" maxlength="11"
						placeholder="CPF" required />
				</div>
				
			</div>
			<div class="row">
				<div class="form-group col-md-12">
					<label for="fone">Telefone: </label> <input type="tel"
						class="form-control" name="fone" onkeypress='return event.charCode >= 48 && event.charCode <= 57' id="fone" required maxlength="12"
						placeholder="Telefone" required />
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-12">
					<label for="pais">País </label>
					<select class="form-control" name="pais" id="pais" required>
						<option value="Brasil">Brasil</option>
					</select>
				</div>

			</div>
			<div class="row">
				<div class="form-group col-md-4">
					<label for="endereco">CEP: </label> <input type="text"
						class="form-control" name="cep"
						onkeypress='return event.charCode >= 48 && event.charCode <= 57'
						id="cep" required maxlength="8" placeholder="CEP" required />
				</div>
				<div class="form-group col-md-4">
					<label for="estado">Estado: </label> <input type="text"
						class="form-control" name="estado" id="estado" required
						maxlength="2" placeholder="Sigla Estado" required />
				</div>
				<div class="form-group col-md-4">
					<label for="email">Bairro: </label> <input type="text"
						class="form-control" name="bairro" id="bairro"
						placeholder="Bairro" required />
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-12">
					<label for="pais">Endereço: </label> <input type="text"
						class="form-control" name="endereco" id="endereco" required
						maxlength="12" placeholder="Nome da rua" required />
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-6">
					<label for="estado">Numero: </label> <input type="text"
						class="form-control" name="numero"
						onkeypress='return event.charCode >= 48 && event.charCode <= 57'
						id="numero" required maxlength="12" placeholder="nª" required />
				</div>
				<div class="form-group col-md-6">
					<label for="email">Complemento: </label> <input type="text"
						class="form-control" name="complemento" id="complemento"
						placeholder="Complemento" />
				</div>
			</div>
			<hr />
			<div id="actions" class="row">
				<div class="md-col-12">
					<button type="submit" class="botao" name="command"
						value="CriarCliente">Cadastrar</button>
					<a href="index.jsp" class="btn btndefault">Cancelar</a>
				</div>
			</div>
		</form>
	</div>
</div>
<c:import url="footer.jsp" />
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>

</body>
</HTML>