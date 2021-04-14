<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha256-L/W5Wfqfa0sdBNIKN9cG6QA5F2qx4qICmU2VgLruv9Y="
	crossorigin="anonymous" />

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/material-design-icons/3.0.1/iconfont/material-icons.min.css"
	integrity="sha256-x8PYmLKD83R9T/sYmJn1j3is/chhJdySyhet/JuHnfY="
	crossorigin="anonymous" />
<link rel="stylesheet" href="css/style1.css" />
</head>

<body>
	<nav
		class="navbar navbar-expand-lg navbar-dark bg-mattBlackLight fixed-top">

		<a class="navbar-brand"
			href="controller.do?command=ListarProdutosReiniciar">Administração</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ml-auto">
				<c:choose>
					<c:when test="${logNomeAdm==null}">
					</c:when>
					<c:otherwise>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle p-0" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <i class="material-icons icon">
									person </i> <span class="text"> <c:out value="${logNomeAdm}"></c:out></span>
						</a>
							<div class="dropdown-menu dropdown-menu-right"
								aria-labelledby="navbarDropdown">
								<a class="dropdown-item"
									href="controller.do?command=EfetuarLogoffAdm">Logoff</a>
							</div></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</nav>
	<div class="wrapper d-flex">
		<div class="sideMenu bg-mattBlackLight">
			<div class="sidebar">
				<ul class="navbar-nav">
					<li class="nav-item"><a href="ListarProdutos.jsp"
						class="nav-link px-2"> <i class="material-icons icon">
								phone_iphone </i> <span class="text">Produtos</span>
					</a></li>
					<li class="nav-item"><a href="ListarColecoes.jsp"
						class="nav-link px-2"> <i class="material-icons icon">
								android </i> <span class="text">Coleções</span>
					</a></li>
					<li class="nav-item"><a href="ListarClientes.jsp"
						class="nav-link px-2"> <i class="material-icons icon">
								person </i> <span class="text">Clientes</span>
					</a></li>
					<li class="nav-item"><a href="ListarPedidos.jsp"
						class="nav-link px-2"> <i class="material-icons icon">
								local_mall </i> <span class="text">Pedidos</span>
					</a></li>
					<li class="nav-item"><a href="ListarAdministradores.jsp"
						class="nav-link px-2"> <i class="material-icons icon">
								settings </i> <span class="text">Administradores</span>
					</a></li>
					<li class="nav-item"><a href="index.jsp"
						class="nav-link px-2"> <i class="material-icons icon">
								home </i> <span class="text">Tela Inicial</span>
					</a></li>

				</ul>
			</div>
		</div>
	</div>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"
		integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/js/bootstrap.bundle.min.js"
		integrity="sha256-OUFW7hFO0/r5aEGTQOz9F/aXQOt+TwqI1Z4fbVvww04="
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jQuery-slimScroll/1.3.8/jquery.slimscroll.min.js"
		integrity="sha256-qE/6vdSYzQu9lgosKxhFplETvWvqAAlmAuR+yPh/0SI="
		crossorigin="anonymous"></script>

	<script src="./js/script.js"></script>
</body>
</html>