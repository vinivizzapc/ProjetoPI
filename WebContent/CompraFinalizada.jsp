<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/CompraFinalizada.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/material-design-icons/3.0.1/iconfont/material-icons.min.css"
	integrity="sha256-x8PYmLKD83R9T/sYmJn1j3is/chhJdySyhet/JuHnfY="
	crossorigin="anonymous" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.16/jquery.mask.min.js"
	type="text/javascript"></script>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script>
	$(document).ready(function() {
		var changeval = function() {
			var p = $(this).text();
			var nval = new Intl.NumberFormat('pt-BR', {
				style : 'currency',
				currency : 'BRL',
				minimumFractionDigits : 2
			}).format(p);
			$(this).text(nval);
		}

		$('.preco').each(changeval).on('change', changeval);
	});
</script>
</head>
<body>
	<form action="controller.do" method="post">
		<div class="container">
			<div class="principal" align="center">
				<div class="container">
					<a href="index.jsp"><img class="imgLogo"
						src="./imagens/logo.png"></a>
					<div class="caminho">
					</div>
					<div class="Pagamento">
						<p class="cortext">Compra Finalizada com sucesso!!</p>
						<hr>
						<br>
						<p class="cormsg">Agora só aguardar, após a aprovação do pagamento, seu pedido chegará em até 30 dias úteis.</p>
						
						
					</div>

					<div class="divBtn">
						<a class="btn btn-dark btn-lg btn-block pagto" href="controller.do?command=ListarPedidoCliente"><strong>Visualizar meus pedidos</strong></a>
					
						<a class="btn btn-danger btn-lg btn-block pagto" href="index.jsp"><strong>Voltar para o site</strong></a>

					</div>

				</div>
			</div>
		</div>
	</form>
	<div class="clear"></div>
</body>
</HTML>

