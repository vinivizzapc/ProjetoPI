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
	<link href="css/VisualizarMeusPedido.css" rel="stylesheet">
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.16/jquery.mask.min.js" type="text/javascript"></script>
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
			     	     
			var changeqtd = function (){
				var formsm = $(this).parent();
				formsm.submit();	
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
		<h1 class="titulo">Meus Pedidos</h1>
		<c:choose>
			<c:when test="${not empty lista}">
				<c:forEach var="pedido" items="${lista}">
					<div class="principal">
						<div class="codigo">
							<span class="titulo-id">Codigo do Pedido #${pedido.idPedido}</span>
							<div class="tot"><strong>Data do Pedido: </strong><span> ${pedido.dataPedido}</span></div>
						</div>
						<div class="visual">
							<a class="btn btn-dark" href="controller.do?command=Pedidos&idPedido=${pedido.idPedido}">Visualizar Pedido</a>
							<div class="tot ali"><strong>Total: </strong><span class="preco"> ${pedido.valorTotal}</span></div>
						</div>
						<div class="status">
							<span class="stats"><strong>Status: </strong> ${pedido.status}</span>
							<c:if test="${pedido.status=='em andamento'}">
								<a class="btn btn-danger btn-sm" href="controller.do?command=CancelarPedido&idPedido=${pedido.idPedido}">Cancelar Pedido</a>
							</c:if>
							
						</div>
					</div>
				</c:forEach>								
			</c:when>
			<c:otherwise>
				<div class ="carrinhoVazio">
					<p class="msgVazio">Voce ainda nao realizou nenhum pedido</p>
				 	<a class ="btn btn-outline-success Botao-xb btn-vazio" href="index.jsp" >Voltar às Compras</a>	
				</div>
			</c:otherwise>
		</c:choose>
	</div>
	<c:import url="footer.jsp" />
</body>
</HTML>