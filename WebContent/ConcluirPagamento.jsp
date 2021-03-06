<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/ConcluirPagamento.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/material-design-icons/3.0.1/iconfont/material-icons.min.css"
	integrity="sha256-x8PYmLKD83R9T/sYmJn1j3is/chhJdySyhet/JuHnfY="
	crossorigin="anonymous" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.16/jquery.mask.min.js"
	type="text/javascript"></script>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


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

<script>
	$(document).ready(function() {
		var changeval = function() {
			var p = $(this).text();
			var nval = new Intl.NumberFormat('pt-BR', {
				style : 'currency',
				currency : 'BRL',
				minimumFractionDigits : 2
			}).format(p);
			$(this).text($(this).val()+' - '+nval+ ' sem juros');
		}

		$('.preco1').each(changeval).on('change', changeval);
	});
</script>

<script>
	$(document).ready(function() {
		$("#flip").click(function() {
			$("#panelT").slideToggle("slow");
			$("#panelT").show();
			$("#panelC").hide();
		});
	});
</script>



<script>
	$(document).ready(function() {
		$("#flip1").click(function() {
			$("#panelC").slideToggle("slow");
			$("#panelC").show();
			$("#panelT").hide();
		});
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
						<a class="linkHead" href="controller.do?command=Carrinho"><span>Carrinho</span></a>
						??? <a class="linkHead" href="controller.do?command=CarregarPedido"><span>Frete</span></a>
						??? <a class="linkHead"
							href="controller.do?command=CarregarPagamento"><span>Pagamento</span></a>
					</div>




					<div class="Pagamento">
						<div class="Cartao">
							<i class="material-icons icon">credit_card</i> <input
								type="radio" value="2" name="pagamento" id="flip" required>
							<span class="CartaoS">Cart??o</span>
						</div>
						<div class=transf>
							<i class="material-icons icon">monetization_on</i> <input
								type="radio" value="1" name="pagamento" id="flip1"> <span
								class="BoletoS">Transfer??ncia online</span>
						</div>

						<hr>
						<div id="panelT" style="display: none">
							<div class="row">
								<div class="form-group col-md-4">
									<label for="modelo">Nome do Titular: </label>
								</div>
								<div class="form-group col-md-8">
									<input type="text" class="form-control" name="nomeTitular"
										id="nomeTitular" maxlength="60"
										placeholder="Nome do Titular" />
								</div>
							</div>

							<div class="row">
								<div class="form-group col-md-4">
									<label for="modelo">N??mero do Cart??o: </label>
								</div>
								<div class="form-group col-md-8">
									<input type="text" class="form-control" name="NumeroCartao"
										id="NumeroCartao" maxlength="16"
										placeholder="N??mero do Cart??o" />
								</div>
							</div>

							<div class="row">
								<div class="form-group col-md-4">
									<label for="modelo">CVV: </label>
								</div>
								<div class="form-group col-md-2">
									<input type="text" class="form-control" name="CVV" id="CVV"
										 maxlength="3" placeholder="CVV" />
								</div>
							</div>
							<div class="row">
								<div class="form-group col-md-4">
									<label for="modelo">Data de Vencimento: </label>
								</div>
								<div class="form-group col-md-4">
									<select class="form-control" name="Mes" id="Mes">
										<option value="Jan">Jan</option>
										<option value="Fev">Fev</option>
										<option value="Mar">Mar</option>
										<option value="Abr">Abr</option>
										<option value="Mai">Mai</option>
										<option value="Jun">Jun</option>
										<option value="Jul">Jul</option>
										<option value="Ago">Ago</option>
										<option value="Set">Set</option>
										<option value="Out">Out</option>
										<option value="Nov">Nov</option>
										<option value="Dez">Dez</option>

									</select>
								</div>
								<div class="form-group col-md-4">
									<select class="form-control" name="Ano" id="Ano">
										<option value="2020">2020</option>
										<option value="2021">2021</option>
										<option value="2022">2022</option>
										<option value="2023">2023</option>
										<option value="2024">2024</option>
										<option value="2025">2025</option>
										<option value="2026">2026</option>
										<option value="2027">2027</option>
										<option value="2028">2028</option>
										<option value="2029">2029</option>
										<option value="2030">2030</option>
									</select>
								</div>
							</div>
							<div class="row">
								<div class="form-group col-md-4">
									<label for="modelo">Pa??s </label>
								</div>
								<div class="form-group col-md-8">
									<select class="form-control" name="Pais" id="Pais">
										<option value="Brasil" selected="selected">Brasil</option>
										<option value="Afeganist??o">Afeganist??o</option>
										<option value="??frica do Sul">??frica do Sul</option>
										<option value="Alb??nia">Alb??nia</option>
										<option value="Alemanha">Alemanha</option>
										<option value="Andorra">Andorra</option>
										<option value="Angola">Angola</option>
										<option value="Anguilla">Anguilla</option>
										<option value="Antilhas Holandesas">Antilhas
											Holandesas</option>
										<option value="Ant??rctida">Ant??rctida</option>
										<option value="Ant??gua e Barbuda">Ant??gua e Barbuda</option>
										<option value="Argentina">Argentina</option>
										<option value="Arg??lia">Arg??lia</option>
										<option value="Arm??nia">Arm??nia</option>
										<option value="Aruba">Aruba</option>
										<option value="Ar??bia Saudita">Ar??bia Saudita</option>
										<option value="Austr??lia">Austr??lia</option>
										<option value="??ustria">??ustria</option>
										<option value="Azerbaij??o">Azerbaij??o</option>
										<option value="Bahamas">Bahamas</option>
										<option value="Bahrein">Bahrein</option>
										<option value="Bangladesh">Bangladesh</option>
										<option value="Barbados">Barbados</option>
										<option value="Belize">Belize</option>
										<option value="Benim">Benim</option>
										<option value="Bermudas">Bermudas</option>
										<option value="Bielorr??ssia">Bielorr??ssia</option>
										<option value="Bol??via">Bol??via</option>
										<option value="Botswana">Botswana</option>
										<option value="Brunei">Brunei</option>
										<option value="Bulg??ria">Bulg??ria</option>
										<option value="Burkina Faso">Burkina Faso</option>
										<option value="Burundi">Burundi</option>
										<option value="But??o">But??o</option>
										<option value="B??lgica">B??lgica</option>
										<option value="B??snia e Herzegovina">B??snia e
											Herzegovina</option>
										<option value="Cabo Verde">Cabo Verde</option>
										<option value="Camar??es">Camar??es</option>
										<option value="Camboja">Camboja</option>
										<option value="Canad??">Canad??</option>
										<option value="Catar">Catar</option>
										<option value="Cazaquist??o">Cazaquist??o</option>
										<option value="Chade">Chade</option>
										<option value="Chile">Chile</option>
										<option value="China">China</option>
										<option value="Chipre">Chipre</option>
										<option value="Col??mbia">Col??mbia</option>
										<option value="Comores">Comores</option>
										<option value="Coreia do Norte">Coreia do Norte</option>
										<option value="Coreia do Sul">Coreia do Sul</option>
										<option value="Costa do Marfim">Costa do Marfim</option>
										<option value="Costa Rica">Costa Rica</option>
										<option value="Cro??cia">Cro??cia</option>
										<option value="Cuba">Cuba</option>
										<option value="Dinamarca">Dinamarca</option>
										<option value="Djibouti">Djibouti</option>
										<option value="Dominica">Dominica</option>
										<option value="Egito">Egito</option>
										<option value="El Salvador">El Salvador</option>
										<option value="Emirados ??rabes Unidos">Emirados
											??rabes Unidos</option>
										<option value="Equador">Equador</option>
										<option value="Eritreia">Eritreia</option>
										<option value="Esc??cia">Esc??cia</option>
										<option value="Eslov??quia">Eslov??quia</option>
										<option value="Eslov??nia">Eslov??nia</option>
										<option value="Espanha">Espanha</option>
										<option value="Estados Federados da Micron??sia">Estados
											Federados da Micron??sia</option>
										<option value="Estados Unidos">Estados Unidos</option>
										<option value="Est??nia">Est??nia</option>
										<option value="Eti??pia">Eti??pia</option>
										<option value="Fiji">Fiji</option>
										<option value="Filipinas">Filipinas</option>
										<option value="Finl??ndia">Finl??ndia</option>
										<option value="Fran??a">Fran??a</option>
										<option value="Gab??o">Gab??o</option>
										<option value="Gana">Gana</option>
										<option value="Ge??rgia">Ge??rgia</option>
										<option value="Gibraltar">Gibraltar</option>
										<option value="Granada">Granada</option>
										<option value="Gronel??ndia">Gronel??ndia</option>
										<option value="Gr??cia">Gr??cia</option>
										<option value="Guadalupe">Guadalupe</option>
										<option value="Guam">Guam</option>
										<option value="Guatemala">Guatemala</option>
										<option value="Guernesei">Guernesei</option>
										<option value="Guiana">Guiana</option>
										<option value="Guiana Francesa">Guiana Francesa</option>
										<option value="Guin??">Guin??</option>
										<option value="Guin?? Equatorial">Guin?? Equatorial</option>
										<option value="Guin??-Bissau">Guin??-Bissau</option>
										<option value="G??mbia">G??mbia</option>
										<option value="Haiti">Haiti</option>
										<option value="Honduras">Honduras</option>
										<option value="Hong Kong">Hong Kong</option>
										<option value="Hungria">Hungria</option>
										<option value="Ilha Bouvet">Ilha Bouvet</option>
										<option value="Ilha de Man">Ilha de Man</option>
										<option value="Ilha do Natal">Ilha do Natal</option>
										<option value="Ilha Heard e Ilhas McDonald">Ilha
											Heard e Ilhas McDonald</option>
										<option value="Ilha Norfolk">Ilha Norfolk</option>
										<option value="Ilhas Cayman">Ilhas Cayman</option>
										<option value="Ilhas Cocos (Keeling)">Ilhas Cocos
											(Keeling)</option>
										<option value="Ilhas Cook">Ilhas Cook</option>
										<option value="Ilhas Fero??">Ilhas Fero??</option>
										<option value="Ilhas Ge??rgia do Sul e Sandwich do Sul">Ilhas
											Ge??rgia do Sul e Sandwich do Sul</option>
										<option value="Ilhas Malvinas">Ilhas Malvinas</option>
										<option value="Ilhas Marshall">Ilhas Marshall</option>
										<option value="Ilhas Menores Distantes dos Estados Unidos">Ilhas
											Menores Distantes dos Estados Unidos</option>
										<option value="Ilhas Salom??o">Ilhas Salom??o</option>
										<option value="Ilhas Virgens Americanas">Ilhas
											Virgens Americanas</option>
										<option value="Ilhas Virgens Brit??nicas">Ilhas
											Virgens Brit??nicas</option>
										<option value="Ilhas ??land">Ilhas ??land</option>
										<option value="Indon??sia">Indon??sia</option>
										<option value="Inglaterra">Inglaterra</option>
										<option value="??ndia">??ndia</option>
										<option value="Iraque">Iraque</option>
										<option value="Irlanda do Norte">Irlanda do Norte</option>
										<option value="Irlanda">Irlanda</option>
										<option value="Ir??">Ir??</option>
										<option value="Isl??ndia">Isl??ndia</option>
										<option value="Israel">Israel</option>
										<option value="It??lia">It??lia</option>
										<option value="I??men">I??men</option>
										<option value="Jamaica">Jamaica</option>
										<option value="Jap??o">Jap??o</option>
										<option value="Jersey">Jersey</option>
										<option value="Jord??nia">Jord??nia</option>
										<option value="Kiribati">Kiribati</option>
										<option value="Kuwait">Kuwait</option>
										<option value="Laos">Laos</option>
										<option value="Lesoto">Lesoto</option>
										<option value="Let??nia">Let??nia</option>
										<option value="Lib??ria">Lib??ria</option>
										<option value="Liechtenstein">Liechtenstein</option>
										<option value="Litu??nia">Litu??nia</option>
										<option value="Luxemburgo">Luxemburgo</option>
										<option value="L??bano">L??bano</option>
										<option value="L??bia">L??bia</option>
										<option value="Macau">Macau</option>
										<option value="Maced??nia">Maced??nia</option>
										<option value="Madag??scar">Madag??scar</option>
										<option value="Malawi">Malawi</option>
										<option value="Maldivas">Maldivas</option>
										<option value="Mali">Mali</option>
										<option value="Malta">Malta</option>
										<option value="Mal??sia">Mal??sia</option>
										<option value="Marianas Setentrionais">Marianas
											Setentrionais</option>
										<option value="Marrocos">Marrocos</option>
										<option value="Martinica">Martinica</option>
										<option value="Maurit??nia">Maurit??nia</option>
										<option value="Maur??cia">Maur??cia</option>
										<option value="Mayotte">Mayotte</option>
										<option value="Mold??via">Mold??via</option>
										<option value="Mong??lia">Mong??lia</option>
										<option value="Montenegro">Montenegro</option>
										<option value="Montserrat">Montserrat</option>
										<option value="Mo??ambique">Mo??ambique</option>
										<option value="Myanmar">Myanmar</option>
										<option value="M??xico">M??xico</option>
										<option value="M??naco">M??naco</option>
										<option value="Nam??bia">Nam??bia</option>
										<option value="Nauru">Nauru</option>
										<option value="Nepal">Nepal</option>
										<option value="Nicar??gua">Nicar??gua</option>
										<option value="Nig??ria">Nig??ria</option>
										<option value="Niue">Niue</option>
										<option value="Noruega">Noruega</option>
										<option value="Nova Caled??nia">Nova Caled??nia</option>
										<option value="Nova Zel??ndia">Nova Zel??ndia</option>
										<option value="N??ger">N??ger</option>
										<option value="Om??">Om??</option>
										<option value="Palau">Palau</option>
										<option value="Palestina">Palestina</option>
										<option value="Panam??">Panam??</option>
										<option value="Papua-Nova Guin??">Papua-Nova Guin??</option>
										<option value="Paquist??o">Paquist??o</option>
										<option value="Paraguai">Paraguai</option>
										<option value="Pa??s de Gales">Pa??s de Gales</option>
										<option value="Pa??ses Baixos">Pa??ses Baixos</option>
										<option value="Peru">Peru</option>
										<option value="Pitcairn">Pitcairn</option>
										<option value="Polin??sia Francesa">Polin??sia Francesa</option>
										<option value="Pol??nia">Pol??nia</option>
										<option value="Porto Rico">Porto Rico</option>
										<option value="Portugal">Portugal</option>
										<option value="Quirguist??o">Quirguist??o</option>
										<option value="Qu??nia">Qu??nia</option>
										<option value="Reino Unido">Reino Unido</option>
										<option value="Rep??blica Centro-Africana">Rep??blica
											Centro-Africana</option>
										<option value="Rep??blica Checa">Rep??blica Checa</option>
										<option value="Rep??blica Democr??tica do Congo">Rep??blica
											Democr??tica do Congo</option>
										<option value="Rep??blica do Congo">Rep??blica do Congo</option>
										<option value="Rep??blica Dominicana">Rep??blica
											Dominicana</option>
										<option value="Reuni??o">Reuni??o</option>
										<option value="Rom??nia">Rom??nia</option>
										<option value="Ruanda">Ruanda</option>
										<option value="R??ssia">R??ssia</option>
										<option value="Saara Ocidental">Saara Ocidental</option>
										<option value="Saint Martin">Saint Martin</option>
										<option value="Saint-Barth??lemy">Saint-Barth??lemy</option>
										<option value="Saint-Pierre e Miquelon">Saint-Pierre
											e Miquelon</option>
										<option value="Samoa Americana">Samoa Americana</option>
										<option value="Samoa">Samoa</option>
										<option value="Santa Helena, Ascens??o e Trist??o da Cunha">Santa
											Helena, Ascens??o e Trist??o da Cunha</option>
										<option value="Santa L??cia">Santa L??cia</option>
										<option value="Senegal">Senegal</option>
										<option value="Serra Leoa">Serra Leoa</option>
										<option value="Seychelles">Seychelles</option>
										<option value="Singapura">Singapura</option>
										<option value="Som??lia">Som??lia</option>
										<option value="Sri Lanka">Sri Lanka</option>
										<option value="Suazil??ndia">Suazil??ndia</option>
										<option value="Sud??o">Sud??o</option>
										<option value="Suriname">Suriname</option>
										<option value="Su??cia">Su??cia</option>
										<option value="Su????a">Su????a</option>
										<option value="Svalbard e Jan Mayen">Svalbard e Jan
											Mayen</option>
										<option value="S??o Crist??v??o e Nevis">S??o Crist??v??o e
											Nevis</option>
										<option value="S??o Marino">S??o Marino</option>
										<option value="S??o Tom?? e Pr??ncipe">S??o Tom?? e
											Pr??ncipe</option>
										<option value="S??o Vicente e Granadinas">S??o Vicente
											e Granadinas</option>
										<option value="S??rvia">S??rvia</option>
										<option value="S??ria">S??ria</option>
										<option value="Tadjiquist??o">Tadjiquist??o</option>
										<option value="Tail??ndia">Tail??ndia</option>
										<option value="Taiwan">Taiwan</option>
										<option value="Tanz??nia">Tanz??nia</option>
										<option value="Terras Austrais e Ant??rticas Francesas">Terras
											Austrais e Ant??rticas Francesas</option>
										<option value="Territ??rio Brit??nico do Oceano ??ndico">Territ??rio
											Brit??nico do Oceano ??ndico</option>
										<option value="Timor-Leste">Timor-Leste</option>
										<option value="Togo">Togo</option>
										<option value="Tonga">Tonga</option>
										<option value="Toquelau">Toquelau</option>
										<option value="Trinidad e Tobago">Trinidad e Tobago</option>
										<option value="Tun??sia">Tun??sia</option>
										<option value="Turcas e Caicos">Turcas e Caicos</option>
										<option value="Turquemenist??o">Turquemenist??o</option>
										<option value="Turquia">Turquia</option>
										<option value="Tuvalu">Tuvalu</option>
										<option value="Ucr??nia">Ucr??nia</option>
										<option value="Uganda">Uganda</option>
										<option value="Uruguai">Uruguai</option>
										<option value="Uzbequist??o">Uzbequist??o</option>
										<option value="Vanuatu">Vanuatu</option>
										<option value="Vaticano">Vaticano</option>
										<option value="Venezuela">Venezuela</option>
										<option value="Vietname">Vietname</option>
										<option value="Wallis e Futuna">Wallis e Futuna</option>
										<option value="Zimbabwe">Zimbabwe</option>
										<option value="Z??mbia">Z??mbia</option>
									</select>
								</div>
								
							</div>
								<c:set var="total" value="${0}" />
				<c:set var="frete" value="${16}" />
				<c:set var="subtotal" value="${0}" />
				<c:forEach var="produto" items="${listaCarrinho}">
					<input type="hidden" name="idProduto" value="${produto.produto.idProduto}">
					<input type="hidden" name="QuantidadeEstq" value="${produto.produto.quantidadeEstoque}">
					<input type="hidden" name="Quantidade" value="${produto.quantidade}">
					<div class="clear"></div>
					<c:set var="total"
						value="${total + (produto.produto.valor*produto.quantidade)}" />
					<c:set var="subtotal" value="${total + frete}" />
							</c:forEach>
							<div class="row">
							<div class="form-group col-md-4">
							<label for="QtdParcela">Qtd de Parcelas </label></div>
								<div class="form-group col-md-8">
								<select class="form-control" name="QtdParcela" id="QtdParcela">
										<option class="preco1" value="1x">${subtotal/1}</option>
										<option class="preco1" value="2x">${subtotal/2}</option>
										<option class="preco1" value="3x">${subtotal/3}</option>
										<option class="preco1" value="4x">${subtotal/4}</option>
										<option class="preco1" value="5x">${subtotal/5}</option>
										<option class="preco1" value="6x">${subtotal/6}</option>
										<option class="preco1" value="7x">${subtotal/7}</option>
										<option class="preco1" value="8x">${subtotal/8}</option>
										<option class="preco1" value="9x">${subtotal/9}</option>
										<option class="preco1" value="10x">${subtotal/10}</option>
										<option class="preco1" value="11x">${subtotal/11}</option>
										<option class="preco1" value="12x">${subtotal/12}</option>
										
								</select>
								</div>
							</div>
						</div>

						<div id="panelC" style="display: none">
							<div class="row">
								<div class="form-group col-md-12">
									<div class="TituloTrf">Dados Para Transfer??ncia:</div>
								</div>
							</div>
							<br>
							<div class="ContainerTransf">
								<div class="row">
									<div class="form-group col-md-12">
										<span class="Inf">N??mero da conta: </span> 1545748-1
									</div>
								</div>
								<div class="row">
									<div class="form-group col-md-12">
										<span class="Inf">Ag??ncia: </span> 6656
									</div>
								</div>
								<div class="row">
									<div class="form-group col-md-12">
										<span class="Inf">Banco: </span> Bradesco
									</div>
								</div>
								<div class="row">
									<div class="form-group col-md-12">
										<span class="Inf">Cidade-UF: </span> S??o Paulo
									</div>
								</div>
								<div class="row">
								<div class="form-group col-md-12">
									<div class="TituloTrf">Dados do Cliente:</div>
								</div>
							</div>
							
							<div class="row">
								<div class="form-group col-md-12">
									<label class="cpfC" for="modelo">Valor da Transfer??ncia: </label>
								</div>
							</div>
							<div class="row">
								<div class="form-group col-md-12">
									<p class="vlrtrsf preco">${subtotal}</p>
								</div>
							</div>
							<div class="row">
								<div class="form-group col-md-12">
									<label class="cpfC" for="modelo">CPF da Conta: </label>
								</div>
							</div>
							<div class="row">
								<div class="form-group col-md-12">
									<input type="text" class="form-control" name="CPF" id="CPF"
										 maxlength="3" placeholder="CPF do Titular da conta" />
								</div>
							</div>
							
							<div class="row">
								<div class="form-group col-md-12">
									<label class="cpfC" for="modelo">N??mero da Conta: </label>
								</div>
							</div>
								<div class="row">
								<div class="form-group col-md-12">
									<input type="text" class="form-control" name="CPF" id="CPF"
										 maxlength="3" placeholder="N??mero da conta do titular" />
								</div>
							</div>
							<div class="row">
								<div class="form-group col-md-12">
									<label class="cpfC" for="modelo">Ag??ncia da Conta: </label>
								</div>
							</div>
								<div class="row">
								<div class="form-group col-md-12">
									<input type="text" class="form-control" name="CPF" id="CPF"
										 maxlength="3" placeholder="Ag??ncia da conta do titular" />
								</div>
							</div>
								</div>
							</div>
						</div>

					</div>
					<div class="divBtn">
						<a class="text-dark voltar"
							href="controller.do?command=CarregarPedido">??? Voltar para o
							frete</a>
						<button class="btn btn-danger btn-lg pagto"
							value="FinalizarCompra" name="command" role="button" href="controller.do?command=AlterarEstoque">Finalizar Compra</button>
					</div>
				</div>
			<div class="itens">
				<c:set var="total" value="${0}" />
				<c:if test="${cliente.estado=='SP'}">
			<c:set var="frete" value="${15}"/>
			</c:if>
			<c:if test="${cliente.estado!='SP'}">
			<c:set var="frete" value="${30}"/>
			</c:if>
				<c:set var="subtotal" value="${0}" />
				<c:forEach var="produto" items="${listaCarrinho}">
				<input type="hidden" name="idPedido" value="${produto.idPedido}" />
					<div class="prod">
						<a class="puxar"> <img class="imgProduto"
							src="data:image/jpg;base64,${produto.produto.base64Image}">
							<strong class="nome">${produto.produto.nome}</strong>
						</a> <span class="preco vlrqtd">${produto.produto.valor*produto.quantidade}</span>

					</div>
					<div class="clear"></div>
					<c:set var="total"
						value="${total + (produto.produto.valor*produto.quantidade)}" />
					<c:set var="subtotal" value="${total + frete}" />
				</c:forEach>
				<hr>
				<div class="separacao">
					<p>
						Subtotal<span class="preco"><c:out value="${total}" /></span>
					</p>
				</div>
				<div class="separacao">
					<p>
						Frete<span class="preco"><c:out value="${frete}" /></span>
					</p>
				</div>
				<hr>
				<div class="separacao">
					<input type="hidden" name="total" class="preco" value="${subtotal}" >
						SubTotal<span class="preco"><c:out value="${subtotal}" /></span>
				</div>
			</div>
		</div>

	</form>
	<div class="clear"></div>
</body>
</HTML>

