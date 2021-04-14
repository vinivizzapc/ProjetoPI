<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
	<link href="css/bootstrap.min.css" rel="stylesheet">
		<meta charset="UTF-8">
		<link href="./css/Menu.css" rel="stylesheet">
	</head>
	<body>
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-lg-6 col-sm-6 col-xs-12" align="center">
					<a href="index.jsp"><img src="./imagens/logo.png" alt="logo"></a>
				</div>
				<div class="col-md-6 col-lg-6 col-sm-6 col-xs-6" align="center">
					<nav class="desktop-menu" >
					<ul>
						<li><a href="index.jsp">PAGINA INICIAL</a></li> 
						<li><a href="controller.do?command=ListarColecao&v=1">COLEÇÃO</a></li>
						<li><a href="SobreNos.jsp">SOBRE NOS</a></li>
						<c:choose>
							<c:when test="${logNome!=null}">
							</c:when>
							<c:when test="${logNomeAdm!=null}">
							<li><a href="TelaAdmin.jsp">TELA ADM</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="TelaCadastroCliente.jsp">CADASTRAR-SE</a></li>
								<li><a href="Login.jsp">LOGIN</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
					</nav>
					<div class="clear"></div>
				</div>
			</div>
		</div>
	</body>
</html>