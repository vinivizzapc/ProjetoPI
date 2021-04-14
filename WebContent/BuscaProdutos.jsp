<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<title>Darkcell ! - Explosão de Preços Baixo</title>
  	<meta charset="utf-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link href="css/bootstrap.min.css" rel="stylesheet">
  	<link href="css/BuscaProdutos.css" rel="stylesheet">
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
	<c:import url="header.jsp"/>
	<c:import url="Menu.jsp"/>
	<div class="container-busca">
		<div class="container">
			<br>
			<br>
			<c:choose>
				<c:when test="${lista==null}">
					<h1 class="titulo">Procure Produtos no nosso site</h1>
					<form action="controller.do" method="post">
						<input class="pesquisa col-md-8" name="data[search]" type="search" placeholder="Buscar...">
						<button class="btn btn-secondary" name="command" value="ListarProdutoPesquisa" type="submit">
						<i class="material-icons icon">search</i>
					</button>
					</form>
				</c:when>
				<c:when test="${not empty lista}">
					<h1 class="titulo">A sua pesquisa teve o seguinte resultado:</h1>
					<form action="controller.do" method="post">
						<input class="pesquisa2 col-md-8" name="data[search]" type="search" placeholder="Buscar...">
						<button class="btn btn-secondary" name="command" value="ListarProdutoPesquisa" type="submit">
						<i class="material-icons icon">search</i>
					</button>
					</form>
					<c:forEach var="produto" items="${lista}">
						<div class="ContainerProdutos">
							<a href="controller.do?command=VisualizarProdutoPagina&idProduto=${produto.idProduto}">
								<img  class="img_produto" height="180px" width="180px" src="data:image/jpg;base64,${produto.base64Image}">
								<span>${produto.nome}</span>
								<br>
								<span class="preco">${produto.valor}</span>
							</a> 
						</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<h1 class="titulo">A sua pesquisa não teve resultados.</h1>
					<form action="controller.do" method="post">
						<input class="pesquisa col-md-8" name="data[search]" type="search" placeholder="Buscar...">
						<button class="btn btn-secondary" name="command" value="ListarProdutoPesquisa" type="submit">
						<i class="material-icons icon">search</i>
					</button>
					</form>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<c:import url="footer.jsp"/>

</body>
</html>