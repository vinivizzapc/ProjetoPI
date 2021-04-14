<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>

	<title>Tela Administrador</title>
<meta charset="utf-8">
  		<meta name="viewport" content="width=device-width, initial-scale=1">
  		<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/MinhaConta.css" rel="stylesheet">
</head>
<body>
	<c:import url="header.jsp" />
	<c:import url="Menu.jsp" />
		<div class="containerAdm">
			<div id="main" class="container">
				<h1 class="page-header">Informações do Cliente</h1>
				<hr>
				<div class="insercoes">
					<a class="btn btn-dark" href="controller.do?command=VisualizarMeusDados&idCliente=${cliente.idCliente}" role="button">Meus Dados</a>
					<a class="btn btn-dark" href="controller.do?command=ListarPedidoCliente" role="button">Meus Pedidos</a>
				</div>
			</div>
		</div>
				<c:import url="footer.jsp"/>
		<script src="js/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
</body>
</HTML>