<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<body>
<head>
<!-- Bootstrap CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/Coleções.css" rel="stylesheet">
</head>
	<c:import url="header.jsp"/>
	<c:import url="Menu.jsp"/>
	<div class="container-colecao">
	<div class="container">
<br>
<br>
	<h1>Coleções </h1></div>
		<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12" align="center">
		<c:forEach var="colecao" items="${listaColecao }">
		
		<a href="controller.do?command=ListarProdutosColecao&idColecao=${colecao.idColecao}"><img class="Logo" src="data:image/jpg;base64,${colecao.base64Image}" title="Navegue pela nossa coleção ${colecao.nome}" alt="Imagem${colecao.nome}"></a>
		
		</c:forEach>
	
		
		</div>
		<div class="clear"></div>
	</div>
	<c:import url="footer.jsp"/>
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</HTML>
