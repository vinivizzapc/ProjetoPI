<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Tela Administrador</title>
	<style>
		.page-header{
			padding-top: 30px;
		}
	</style>
</head>
<body>
	<c:import url="MenuAdm.jsp"/>
		<div class="containerAdm">
			<div id="main" class="container">
				<h1 class="page-header">Tela Administração</h1>
				<hr>
				<div class="insercoes">
					<a class="btn btn-light" href="ListarProdutos.jsp" role="button">Produtos</a>
					<a class="btn btn-light" href="ListarColecoes.jsp" role="button">Coleções</a>
					<a class="btn btn-light" href="ListarClientes.jsp" role="button">Clientes</a>
					<a class="btn btn-light" href="ListarPedidos.jsp" role="button">Pedidos</a>
					<a class="btn btn-light" href="ListarAdministradores.jsp" role="button">Administradores</a>
					
				
				</div>
			</div>
		</div>
</body>
</HTML>