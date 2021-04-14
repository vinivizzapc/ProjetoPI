<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<html lang="pt-br">
	<head>
  		<title>Darkcell ! - Explosão de Preços Baixo</title>
  		<link rel="icon" href="logo.ico" type="image/x-icon">
  		<meta charset="utf-8">
  		<meta name="viewport" content="width=device-width, initial-scale=1">
  		<link href="css/bootstrap.min.css" rel="stylesheet">
  		<link href="css/TelaInicial.css" rel="stylesheet">
	</head>
	<body>
		<c:import url="header.jsp"/>
		<c:import url="Menu.jsp"/>
		<div class="container">
			<div id="carouselSite" class="carousel slide" data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#carouselSite" data-slide-to="0" class="active"></li>
					<li data-target="#carouselSite" data-slide-to="1"></li>
					<li data-target="#carouselSite" data-slide-to="2"></li>
					<li data-target="#carouselSite" data-slide-to="3"></li>
				</ol>
			
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img src="imagens/IMAGEM1.SLIDE.png" class="img-fluid d-block">
					</div>
					<div class="carousel-item">
						<img src="imagens/IMAGEM2.SLIDE.png" class="img-fluid d-block">
					</div>
					<div class="carousel-item">
						<img src="imagens/IMAGEM3.SLIDE.png" class="img-fluid d-block">
					</div>
					<div class="carousel-item">
						<img src="imagens/IMAGEM4.SLIDE.png" class="img-fluid d-block">
					</div>
				</div>
				<a class="carousel-control-prev" href="#carouselSite" role="button" data-slide="prev">
					<span class="carousel-control-prev-icon"></span>
					<span class="sr-only">Anterior</span>
				</a>
				<a class="carousel-control-next" href="#carouselSite" role="button" data-slide="next">
					<span class="carousel-control-next-icon"></span>
					<span class="sr-only">Proximo</span>
				</a>			
			</div>
		</div>
    	<div class="container-colecao">
			<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12" align="center"><a href="controller.do?command=ListarProdutosColecao&idColecao=1"><img class="Logo" src="./imagens/Logo.Xiaomi.jpg" title="Navegue pela nossa coleção Xiaomi" alt="ImagemXiaomi"></a>
				<a href="controller.do?command=ListarProdutosColecao&idColecao=5"><img class="Logo" src="./imagens/Logo.Apple.jpg" title="Navegue pela nossa coleção Apple" alt="ImagemApple"></a>
				<a href="controller.do?command=ListarProdutosColecao&idColecao=2"><img class="Logo" src="./imagens/Logo.Samsung.png" title="Navegue pela nossa coleção Samsung" alt="ImagemSamsung"></a>
				<a href="controller.do?command=ListarProdutosColecao&idColecao=3"><img class="Logo" src="./imagens/Logo.Smartwatch.jpg" title="Navegue pela nossa coleção Smartwatches" alt="ImagemSmartwatch"></a>
				<a href="controller.do?command=ListarProdutosColecao&idColecao=4"><img class="Logo" src="./imagens/Logo.Fones.jpg" title="Navegue pela nossa coleção Fones" alt="ImagemFones"></a>
			</div>
		</div>	
		<c:import url="footer.jsp"/>
		<script src="js/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
	</body>
</html>