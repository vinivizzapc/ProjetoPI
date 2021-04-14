<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
	<meta charset="UTF-8">
	<title>Pedido</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/MeusPedidos.css" rel="stylesheet">
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
		  });
	</script>
</head>
<body>
	<c:import url="header.jsp" />
	<c:import url="Menu.jsp" />
	<div id="main" class="container">
	
		<h1 class="titulo">Pedido #${carrinho.idPedido}</h1>
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
                    <c:set var="frete" value="${16}"/>
                    <c:set var="subtotal" value="${0}"/>
                        <c:forEach var="produto" items="${listaCarrinho}">
                            <tr>

                                <td>
                                    <a>
                                        <img class="imgProduto" src="data:image/jpg;base64,${produto.produto.base64Image}">
                                        <strong class="nome">${produto.produto.nome}</strong>
                                    </a>
                                </td>
                                <td>
                                    <span class="preco">${produto.produto.valor}</span>
                                </td>
                                <td>
                                        <span >${produto.quantidade}</span>
                                </td>
                                <td>
                                    <span class="preco">${produto.produto.valor * produto.quantidade}</span>
                                </td>

                            </tr>
                            <c:set var="total" value="${total + (produto.produto.valor * produto.quantidade)}"/>
                        </c:forEach>
                    </tbody>
                </table>
                <hr>
    				<a class="btn btn-dark" href="controller.do?command=ListarPedidoCliente" role="button">Voltar aos Meus Pedidos</a>
                   	<a class="btn btn-dark" href="MinhaConta.jsp" role="button">Voltar à Minha Conta</a>
                	<c:if test="${carrinho.status=='enviado'}">
                	<a class="btn btn-dark" href="https://www2.correios.com.br/sistemas/rastreamento/default.cfm" role="button">Rastrear Pedido</a>
               		</c:if>
                <div class="valores">
                	<h3 class="tituloResumo">Resumo do Pedido</h3>
                	<hr>
                	<div>
                		<span class="maizin">(+)</span> <strong> SubTotal: </strong><span class="span preco"> <c:out value="${total}"/></span>
                	</div>
                	<br>
                	<div>
                		<span class="maizin">(+)</span> <strong> Frete: </strong><span class="span preco"> <c:out value="${frete}"/></span>
                	</div>
                	<hr>
                	<div >
                		<strong class="tota">Total: </strong><span class="span 	preco"> ${carrinho.valorTotal}</span>
                	</div>
                </div>
                <div class="clear"></div>
	</div>
	<br>
	<c:import url="footer.jsp" />
</body>
</html>