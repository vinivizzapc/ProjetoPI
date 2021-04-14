<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<body>
<head>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/TelaApple.css" rel="stylesheet">

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

<c:import url="header.jsp" />
<c:import url="Menu.jsp" />
<div id="main" class="container">
	<div id="main" class="containerApple">
		<div class="TopoApple">
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="index.jsp">Pagina Inicial</a></li>
					<li class="breadcrumb-item active" aria-current="page">${colecao.nome}</li>
				</ol>
			</nav>
		</div>
		<h1 class="TituloApple">
			<strong>${colecao.nome}</strong>
		</h1>
	</div>
	<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
	<c:forEach var="produto" items="${lista}">
		<div class="ContainerProdutos">
			<a href="controller.do?command=VisualizarProdutoPagina&idProduto=${produto.idProduto}"><img  class="img_produto" height="180px" width="180px" 
				src="data:image/jpg;base64,${produto.base64Image}">
											<span>${produto.nome}</span>
											<br>
											<span class="preco">${produto.valor}</span></a> 
		</div>
	</c:forEach>
	</div>
</div>
<c:import url="footer.jsp" />
</body>
</HTML>
