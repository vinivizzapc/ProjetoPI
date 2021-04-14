<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/Login.css" rel="stylesheet">
</head>
<body>
	<c:import url="header.jsp" />
	<c:import url="Menu.jsp" />
	<div class="cadastroletraLogin">
		<div id="main" class="container">
		<br>
		<br>
		<c:if test="${not empty erro}"> 
			<div class="alert alert-danger" role="alert"> ${erro}</div> 
		</c:if>
			<h1 class="page-header">Login</h1>
			<form action="controller.do" method="post">
				<div class="row">
					<div class="form-group col-md-12">
						<label for="email"><font color="black" size="2">Email:
						</font></label> <input type="email" class="form-control" name="email" id="email"
							required maxlength="50" placeholder="Digite seu E-mail" />
					</div>
				</div>
				<div class="row">
					<div class="form-group col-md-12">
						<label for="senha"><font color="black" size="2">Senha:
						</font></label> <input type="password" class="form-control" name="senha"
							id="senha" required maxlength="100"
							placeholder="Digite sua senha" />
					</div>
				</div>
								<div class="row">
					<div class="form-group col-md-12">
						<label for="senha"><font color="grey" size="2">Ainda não possui cadastro? <a href="TelaCadastroCliente.jsp">Clique Aqui</a></font></label>
					</div>
				</div>
				<hr />
				<div class="containerLogin">
					<div id="actions" class="row">
						<div class="md-col-12">
							<button type="submit" class="botao" name="command"
								value="FazerLoginCli">Entrar</button>
							<a href="index.jsp" class="btn btndefault">Cancelar</a>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	<c:import url="footer.jsp" />
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</HTML>