	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
	<title>Darkcell ! - Explosão de Preços Baixo</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/Carrinho.css" rel="stylesheet">
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.16/jquery.mask.min.js" type="text/javascript"></script>
	<script>
		$(document).ready(function(){
			var qtdeOrignal = $("#quantidade").val(); 
			
			var changeval = function () {
			       var p = $(this).text();
			       var nval = new Intl.NumberFormat('pt-BR', { style: 'currency', currency: 'BRL', minimumFractionDigits: 2 }).format(p);
			       $(this).text(nval);
			    }
	
			     $('.preco')
			    .each(changeval)
			    .on('change', changeval);
			     	     
			var changeqtd = function (ev){
				if (parseInt($("#quantidade").val()) > parseInt($("#qtdEstoque").val())) {
					$("#quantidade").val(qtdeOrignal);
					qtdeOrignal = $("#quantidade").val(); 
					return false;
				}else {
					var formsm = $(this).parent();
					formsm.submit();	
					
				}
			}
				$('.qtdProd')
				.on('change', changeqtd);
				
			
		  });
	</script>
	</head>
<body>
	<c:import url="header.jsp" />
	<c:import url="Menu.jsp" />
	<div id="main" class="container">
		<h1 class="titulo">Seu Carrinho</h1>
		<c:choose>
			<c:when test="${not empty listaCarrinho}">
				<table class="table" >
					<thead>
						<tr>
							<th></th>
							<th>Preço</th>
							<th>Quantidade</th>
							<th>Total</th>
						</tr>
					</thead>
					<tbody>
					<c:set var="total" value="${0}"/>
					<c:set var="frete" value="${16}" />
					<c:set var="subtotal" value="${0}" />
						<c:forEach var="produto" items	="${listaCarrinho}">
							<tr>
							
								<td>
									<a href="controller.do?command=VisualizarProdutoPagina&idProduto=${produto.idProduto}">
										<img class="imgProduto" src="data:image/jpg;base64,${produto.produto.base64Image}">
										<strong class="nome">${produto.produto.nome}</strong>
									</a>
									<a class="text-danger remove" href="controller.do?command=ExcluirCarrinho&idPedido=${produto.idPedido}&idProduto=${produto.idProduto}">Remover do carrinho</a>
								</td>
								<td>
									<span class="preco">${produto.produto.valor}</span>
								</td>
								<td>
									<form action="controller.do?command=AlterarItem" method="post">
										<input type="number" class="checkBox8 qtdProd"  id="quantidade" name="quantidade" value="${produto.quantidade}" min="1" max="${produto.produto.quantidadeEstoque}"/>
										<input type="hidden" name="qtdEstoque" id="qtdEstoque" value="${produto.produto.quantidadeEstoque}"/>
										<input type="hidden" name="idPedido" value="${produto.idPedido}"/>
										<input type="hidden" name="idProduto" value="${produto.idProduto}"/>
									</form>
								</td>
								<td>
									<span class="preco">${produto.produto.valor*produto.quantidade}</span>
								</td>
								
							</tr>
							<c:set var="total" value="${total + (produto.produto.valor*produto.quantidade)}"/>
						</c:forEach>
					</tbody>
				</table>
				
				<div class="divBtn">
					<p>Subtotal <strong><span class="preco"><c:out value="${total}"/></span></strong></p>
					<p class="frete">Frete calculado no checkout</p>
					<a class="btn btn-outline-danger" href="index.jsp" role="button">VOLTAR À LOJA</a>
					<a class="btn btn-outline-danger" href="controller.do?command=CarregarPedido" role="button">FINALIZAR PEDIDO</a>
				<br><br><br>		
				</div>
				<div class="clear"></div>
			</c:when>
			<c:otherwise>
				<div class ="carrinhoVazio">
					<p>Seu carrinho de compras está vazio.</p>
				 	<a class ="btn btn-outline-success Botao-xb btn-vazio" href="index.jsp" >Voltar às Compras</a>	
				</div>
			</c:otherwise>
		</c:choose>
	</div>
	<c:import url="footer.jsp" />
</body>
</HTML>