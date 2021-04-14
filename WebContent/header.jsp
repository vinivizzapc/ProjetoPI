<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="logo.ico" type="image/x-icon">
<link
	href="https://fonts.googleapis.com/css2?family=Baloo+Paaji+2:wght@700;800&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/material-design-icons/3.0.1/iconfont/material-icons.min.css"
	integrity="sha256-x8PYmLKD83R9T/sYmJn1j3is/chhJdySyhet/JuHnfY="
	crossorigin="anonymous" />
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/Header.css" rel="stylesheet">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container header">
			<span class="navbar-brand">SUPORTE DAS 8:00 ÀS 20:00 HORAS</span>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSite" aria-controls="navbarSite"
				aria-expand="true" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSite">
				<ul class="navbar-nav ml-auto">
					<c:choose>
						<c:when test="${logNome==null}">
						</c:when>
						<c:otherwise>
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" data-toggle="dropdown"
								id="navDrop"> <i class="material-icons icon">person</i> <c:out
										value="Olá, ${logNome}!"></c:out></a>
								<div class="dropdown-menu">
									<a class="dropdown-item" href="MinhaConta.jsp">Minha conta</a> <a
										class="dropdown-item"
										href="controller.do?command=EfetuarLogoffCli">Fazer Logoff</a>
								</div></li>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${logNomeAdm==null}">
						</c:when>
						<c:otherwise>
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" data-toggle="dropdown"
								id="navDrop"> <i class="material-icons icon">person</i> <c:out
										value="Olá, ${logNomeAdm}!"></c:out></a>
								<div class="dropdown-menu">
									 <a	class="dropdown-item"
										href="controller.do?command=EfetuarLogoffAdm">Fazer Logoff</a>
								</div></li>
						</c:otherwise>
					</c:choose>
					
					<li class="nav-item"><a class="nav-link" href="controller.do?command=Carrinho">
							<i class="material-icons icon">shopping_cart</i>Carrinho 
					</a></li>
					<li class="nav-item seila"><a class="nav-link"
						href="index.jsp"><i class="material-icons icon">home</i>Pagina
							Inicial</a></li>
					<li class="nav-item seila"><a class="nav-link"
						href="controller.do	?command=ListarColecao&v=1"><i class="material-icons icon">android</i>Coleção</a></li>
					<li class="nav-item seila"><a class="nav-link"
						href="SobreNos.jsp"><i class="material-icons icon">group</i>Sobre
							nós</a></li>
					<c:choose>
						<c:when test="${logNome!=null}">
						</c:when>
						<c:when test="${logNomeAdm!=null}">
						<li class="nav-item seila"><a class="nav-link"
								href="TelaAdmin.jsp"><i class="material-icons icon">settings</i>Tela Adm</a></li>
						</c:when>
						<c:otherwise>
							<li class="nav-item seila"><a class="nav-link"
								href="TelaCadastroCliente.jsp"><i class="material-icons icon">shopping_cart</i>Cadastrar-se</a></li>
							<li class="nav-item seila"><a class="nav-link"
								href="Login.jsp"><i class="material-icons icon">face</i>Login</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
				<form action="controller.do" method="post" class="form-inline">
					<input class="form-control" name="data[search]" type="search" placeholder="Buscar...">
					<button class="btn btn-secondary" name="command" value="ListarProdutoPesquisa" type="submit">
						<i class="material-icons icon">search</i>
					</button>
				</form>
			</div>
		</div>
	</nav>
	<script src="bootstrap.js"></script>
	<script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.js"></script>
	<script src="js/jquery.min.cs"></script>
</body>
</html>