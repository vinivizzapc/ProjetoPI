<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
	<meta charset="UTF-8">
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href= "css/TelaFrete.css" rel="stylesheet">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.16/jquery.mask.min.js" type="text/javascript"></script>
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script>
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
	<div class="container">
		<div class="principal" align="center">
			<div class="container">
				<a href="index.jsp"><img class="imgLogo" src="./imagens/logo.png" ></a>
				<div class="caminho">
					<a class="linkHead" href="controller.do?command=Carrinho"><span>Carrinho</span></a> › 
					<a class="linkHead" href="controller.do?command=CarregarPedido"><span>Frete</span></a> › <span class="pagmt">Pagamento</span>
				</div>
				<div class="wraper">
					<div class="alinhamento">
					<span class="contato">Contato: </span><span class="texto-contato"> ${cliente.email} </span></div><div class="alinhaBtn"><a class="linkBtn" href="controller.do?command=VisualizarMeusDadosCompra&idCliente=${cliente.idCliente}">Alterar</a></div><div class="clear"></div>
					<hr>
					<div class="alinhamento">
					<span class="contato">Enviar para: </span> <span class="texto-contato"> ${cliente.endereco}, ${cliente.numero}, ${cliente.cpf}, ${cliente.bairro}, ${cliente.estado}, ${cliente.cep} </span></div><div class="alinhaBtn"><a class="linkBtn" href="controller.do?command=VisualizarMeusDadosCompra&idCliente=${cliente.idCliente}">Alterar</a></div><div class="clear"></div> 
				</div>
				<div class="divBtn">
					<a class="text-dark voltar" href="controller.do?command=Carrinho">‹ Voltar para o carrinho</a>
					<a class="btn btn-danger btn-lg pagto" href="controller.do?command=CarregarPagamento" role="button">Continuar com o pagamento</a>
				</div>
			</div>
		</div>
		<div class="itens">
			<c:set var="total" value="${0}"/>
			<c:if test="${cliente.estado=='SP'}">
			<c:set var="frete" value="${15}"/>
			</c:if>
			<c:if test="${cliente.estado!='SP'}">
			<c:set var="frete" value="${30}"/>
			</c:if>
			<c:set var="subtotal" value="${0}"/>
			<c:forEach var="produto" items	="${listaCarrinho}">
				<div class="prod">
					<a class="puxar">
						<img class="imgProduto" src="data:image/jpg;base64,${produto.produto.base64Image}">
						<strong class="nome">${produto.produto.nome}</strong>
					</a>
					<span class="preco vlrqtd">${produto.produto.valor*produto.quantidade}</span>
					
				</div>
				<div class="clear"></div>
				<c:set var="total" value="${total + (produto.produto.valor*produto.quantidade)}"/>
				<c:set var="subtotal" value="${total + frete}"/>
			</c:forEach>
			<hr>
			<div class="separacao">
				<p>Total<span class="preco"><c:out value="${total}"/></span></p>
			</div>
			<div class="separacao">
				<p>Frete<span class="preco"><c:out value="${frete}"/></span></p>
			</div>
			<hr>
			<div class="separacao">
				<p>SubTotal<span class="preco"><c:out value="${subtotal}"/></span></p>
			</div>
		</div>
		</div>
		<div class="clear"></div>
</body>
</HTML>

