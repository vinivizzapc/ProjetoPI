<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
	<meta charset="utf-8">
  		<meta name="viewport" content="width=device-width, initial-scale=1">
  		<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/MeusDadosCompra.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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
</head>
<body>
	<c:import url="header.jsp" />
	<c:import url="Menu.jsp" />
<div class="cadastroletraLogin">
	<div class="container">
	<br>
		<h3 class="page-header" align="center"> <strong></strong></h3>
		<br>
		<form action="controller.do " method="post">
			<h3><strong>Informações do Usuário</strong></h3>
			<br>
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
					<label for="pais">País </label>
					<select class="form-control" name="pais" id="pais" required>
						<option value="Brasil">Brasil</option>
					</select>
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
						<button type="submit" class="btn btn-primary" name="command" value="AlterarMeusDadosCompra">Salvar</button>
						<a href="controller.do?command=CarregarPedido" class="btn btn-danger"
							role="button" aria-pressed="true">Cancelar</a>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>
		<c:import url="footer.jsp"/>
		<script src="js/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
</body>
</HTML>

