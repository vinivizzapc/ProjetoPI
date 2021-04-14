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
						› <a class="linkHead" href="controller.do?command=CarregarPedido"><span>Frete</span></a>
						› <a class="linkHead"
							href="controller.do?command=CarregarPagamento"><span>Pagamento</span></a>
					</div>




					<div class="Pagamento">
						<div class="Cartao">
							<i class="material-icons icon">credit_card</i> <input
								type="radio" value="2" name="pagamento" id="flip" required>
							<span class="CartaoS">Cartão</span>
						</div>
						<div class=transf>
							<i class="material-icons icon">monetization_on</i> <input
								type="radio" value="1" name="pagamento" id="flip1"> <span
								class="BoletoS">Transferência online</span>
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
									<label for="modelo">Número do Cartão: </label>
								</div>
								<div class="form-group col-md-8">
									<input type="text" class="form-control" name="NumeroCartao"
										id="NumeroCartao" maxlength="16"
										placeholder="Número do Cartão" />
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
									<label for="modelo">País </label>
								</div>
								<div class="form-group col-md-8">
									<select class="form-control" name="Pais" id="Pais">
										<option value="Brasil" selected="selected">Brasil</option>
										<option value="Afeganistão">Afeganistão</option>
										<option value="África do Sul">África do Sul</option>
										<option value="Albânia">Albânia</option>
										<option value="Alemanha">Alemanha</option>
										<option value="Andorra">Andorra</option>
										<option value="Angola">Angola</option>
										<option value="Anguilla">Anguilla</option>
										<option value="Antilhas Holandesas">Antilhas
											Holandesas</option>
										<option value="Antárctida">Antárctida</option>
										<option value="Antígua e Barbuda">Antígua e Barbuda</option>
										<option value="Argentina">Argentina</option>
										<option value="Argélia">Argélia</option>
										<option value="Armênia">Armênia</option>
										<option value="Aruba">Aruba</option>
										<option value="Arábia Saudita">Arábia Saudita</option>
										<option value="Austrália">Austrália</option>
										<option value="Áustria">Áustria</option>
										<option value="Azerbaijão">Azerbaijão</option>
										<option value="Bahamas">Bahamas</option>
										<option value="Bahrein">Bahrein</option>
										<option value="Bangladesh">Bangladesh</option>
										<option value="Barbados">Barbados</option>
										<option value="Belize">Belize</option>
										<option value="Benim">Benim</option>
										<option value="Bermudas">Bermudas</option>
										<option value="Bielorrússia">Bielorrússia</option>
										<option value="Bolívia">Bolívia</option>
										<option value="Botswana">Botswana</option>
										<option value="Brunei">Brunei</option>
										<option value="Bulgária">Bulgária</option>
										<option value="Burkina Faso">Burkina Faso</option>
										<option value="Burundi">Burundi</option>
										<option value="Butão">Butão</option>
										<option value="Bélgica">Bélgica</option>
										<option value="Bósnia e Herzegovina">Bósnia e
											Herzegovina</option>
										<option value="Cabo Verde">Cabo Verde</option>
										<option value="Camarões">Camarões</option>
										<option value="Camboja">Camboja</option>
										<option value="Canadá">Canadá</option>
										<option value="Catar">Catar</option>
										<option value="Cazaquistão">Cazaquistão</option>
										<option value="Chade">Chade</option>
										<option value="Chile">Chile</option>
										<option value="China">China</option>
										<option value="Chipre">Chipre</option>
										<option value="Colômbia">Colômbia</option>
										<option value="Comores">Comores</option>
										<option value="Coreia do Norte">Coreia do Norte</option>
										<option value="Coreia do Sul">Coreia do Sul</option>
										<option value="Costa do Marfim">Costa do Marfim</option>
										<option value="Costa Rica">Costa Rica</option>
										<option value="Croácia">Croácia</option>
										<option value="Cuba">Cuba</option>
										<option value="Dinamarca">Dinamarca</option>
										<option value="Djibouti">Djibouti</option>
										<option value="Dominica">Dominica</option>
										<option value="Egito">Egito</option>
										<option value="El Salvador">El Salvador</option>
										<option value="Emirados Árabes Unidos">Emirados
											Árabes Unidos</option>
										<option value="Equador">Equador</option>
										<option value="Eritreia">Eritreia</option>
										<option value="Escócia">Escócia</option>
										<option value="Eslováquia">Eslováquia</option>
										<option value="Eslovênia">Eslovênia</option>
										<option value="Espanha">Espanha</option>
										<option value="Estados Federados da Micronésia">Estados
											Federados da Micronésia</option>
										<option value="Estados Unidos">Estados Unidos</option>
										<option value="Estônia">Estônia</option>
										<option value="Etiópia">Etiópia</option>
										<option value="Fiji">Fiji</option>
										<option value="Filipinas">Filipinas</option>
										<option value="Finlândia">Finlândia</option>
										<option value="França">França</option>
										<option value="Gabão">Gabão</option>
										<option value="Gana">Gana</option>
										<option value="Geórgia">Geórgia</option>
										<option value="Gibraltar">Gibraltar</option>
										<option value="Granada">Granada</option>
										<option value="Gronelândia">Gronelândia</option>
										<option value="Grécia">Grécia</option>
										<option value="Guadalupe">Guadalupe</option>
										<option value="Guam">Guam</option>
										<option value="Guatemala">Guatemala</option>
										<option value="Guernesei">Guernesei</option>
										<option value="Guiana">Guiana</option>
										<option value="Guiana Francesa">Guiana Francesa</option>
										<option value="Guiné">Guiné</option>
										<option value="Guiné Equatorial">Guiné Equatorial</option>
										<option value="Guiné-Bissau">Guiné-Bissau</option>
										<option value="Gâmbia">Gâmbia</option>
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
										<option value="Ilhas Feroé">Ilhas Feroé</option>
										<option value="Ilhas Geórgia do Sul e Sandwich do Sul">Ilhas
											Geórgia do Sul e Sandwich do Sul</option>
										<option value="Ilhas Malvinas">Ilhas Malvinas</option>
										<option value="Ilhas Marshall">Ilhas Marshall</option>
										<option value="Ilhas Menores Distantes dos Estados Unidos">Ilhas
											Menores Distantes dos Estados Unidos</option>
										<option value="Ilhas Salomão">Ilhas Salomão</option>
										<option value="Ilhas Virgens Americanas">Ilhas
											Virgens Americanas</option>
										<option value="Ilhas Virgens Britânicas">Ilhas
											Virgens Britânicas</option>
										<option value="Ilhas Åland">Ilhas Åland</option>
										<option value="Indonésia">Indonésia</option>
										<option value="Inglaterra">Inglaterra</option>
										<option value="Índia">Índia</option>
										<option value="Iraque">Iraque</option>
										<option value="Irlanda do Norte">Irlanda do Norte</option>
										<option value="Irlanda">Irlanda</option>
										<option value="Irã">Irã</option>
										<option value="Islândia">Islândia</option>
										<option value="Israel">Israel</option>
										<option value="Itália">Itália</option>
										<option value="Iêmen">Iêmen</option>
										<option value="Jamaica">Jamaica</option>
										<option value="Japão">Japão</option>
										<option value="Jersey">Jersey</option>
										<option value="Jordânia">Jordânia</option>
										<option value="Kiribati">Kiribati</option>
										<option value="Kuwait">Kuwait</option>
										<option value="Laos">Laos</option>
										<option value="Lesoto">Lesoto</option>
										<option value="Letônia">Letônia</option>
										<option value="Libéria">Libéria</option>
										<option value="Liechtenstein">Liechtenstein</option>
										<option value="Lituânia">Lituânia</option>
										<option value="Luxemburgo">Luxemburgo</option>
										<option value="Líbano">Líbano</option>
										<option value="Líbia">Líbia</option>
										<option value="Macau">Macau</option>
										<option value="Macedônia">Macedônia</option>
										<option value="Madagáscar">Madagáscar</option>
										<option value="Malawi">Malawi</option>
										<option value="Maldivas">Maldivas</option>
										<option value="Mali">Mali</option>
										<option value="Malta">Malta</option>
										<option value="Malásia">Malásia</option>
										<option value="Marianas Setentrionais">Marianas
											Setentrionais</option>
										<option value="Marrocos">Marrocos</option>
										<option value="Martinica">Martinica</option>
										<option value="Mauritânia">Mauritânia</option>
										<option value="Maurícia">Maurícia</option>
										<option value="Mayotte">Mayotte</option>
										<option value="Moldávia">Moldávia</option>
										<option value="Mongólia">Mongólia</option>
										<option value="Montenegro">Montenegro</option>
										<option value="Montserrat">Montserrat</option>
										<option value="Moçambique">Moçambique</option>
										<option value="Myanmar">Myanmar</option>
										<option value="México">México</option>
										<option value="Mônaco">Mônaco</option>
										<option value="Namíbia">Namíbia</option>
										<option value="Nauru">Nauru</option>
										<option value="Nepal">Nepal</option>
										<option value="Nicarágua">Nicarágua</option>
										<option value="Nigéria">Nigéria</option>
										<option value="Niue">Niue</option>
										<option value="Noruega">Noruega</option>
										<option value="Nova Caledônia">Nova Caledônia</option>
										<option value="Nova Zelândia">Nova Zelândia</option>
										<option value="Níger">Níger</option>
										<option value="Omã">Omã</option>
										<option value="Palau">Palau</option>
										<option value="Palestina">Palestina</option>
										<option value="Panamá">Panamá</option>
										<option value="Papua-Nova Guiné">Papua-Nova Guiné</option>
										<option value="Paquistão">Paquistão</option>
										<option value="Paraguai">Paraguai</option>
										<option value="País de Gales">País de Gales</option>
										<option value="Países Baixos">Países Baixos</option>
										<option value="Peru">Peru</option>
										<option value="Pitcairn">Pitcairn</option>
										<option value="Polinésia Francesa">Polinésia Francesa</option>
										<option value="Polônia">Polônia</option>
										<option value="Porto Rico">Porto Rico</option>
										<option value="Portugal">Portugal</option>
										<option value="Quirguistão">Quirguistão</option>
										<option value="Quênia">Quênia</option>
										<option value="Reino Unido">Reino Unido</option>
										<option value="República Centro-Africana">República
											Centro-Africana</option>
										<option value="República Checa">República Checa</option>
										<option value="República Democrática do Congo">República
											Democrática do Congo</option>
										<option value="República do Congo">República do Congo</option>
										<option value="República Dominicana">República
											Dominicana</option>
										<option value="Reunião">Reunião</option>
										<option value="Romênia">Romênia</option>
										<option value="Ruanda">Ruanda</option>
										<option value="Rússia">Rússia</option>
										<option value="Saara Ocidental">Saara Ocidental</option>
										<option value="Saint Martin">Saint Martin</option>
										<option value="Saint-Barthélemy">Saint-Barthélemy</option>
										<option value="Saint-Pierre e Miquelon">Saint-Pierre
											e Miquelon</option>
										<option value="Samoa Americana">Samoa Americana</option>
										<option value="Samoa">Samoa</option>
										<option value="Santa Helena, Ascensão e Tristão da Cunha">Santa
											Helena, Ascensão e Tristão da Cunha</option>
										<option value="Santa Lúcia">Santa Lúcia</option>
										<option value="Senegal">Senegal</option>
										<option value="Serra Leoa">Serra Leoa</option>
										<option value="Seychelles">Seychelles</option>
										<option value="Singapura">Singapura</option>
										<option value="Somália">Somália</option>
										<option value="Sri Lanka">Sri Lanka</option>
										<option value="Suazilândia">Suazilândia</option>
										<option value="Sudão">Sudão</option>
										<option value="Suriname">Suriname</option>
										<option value="Suécia">Suécia</option>
										<option value="Suíça">Suíça</option>
										<option value="Svalbard e Jan Mayen">Svalbard e Jan
											Mayen</option>
										<option value="São Cristóvão e Nevis">São Cristóvão e
											Nevis</option>
										<option value="São Marino">São Marino</option>
										<option value="São Tomé e Príncipe">São Tomé e
											Príncipe</option>
										<option value="São Vicente e Granadinas">São Vicente
											e Granadinas</option>
										<option value="Sérvia">Sérvia</option>
										<option value="Síria">Síria</option>
										<option value="Tadjiquistão">Tadjiquistão</option>
										<option value="Tailândia">Tailândia</option>
										<option value="Taiwan">Taiwan</option>
										<option value="Tanzânia">Tanzânia</option>
										<option value="Terras Austrais e Antárticas Francesas">Terras
											Austrais e Antárticas Francesas</option>
										<option value="Território Britânico do Oceano Índico">Território
											Britânico do Oceano Índico</option>
										<option value="Timor-Leste">Timor-Leste</option>
										<option value="Togo">Togo</option>
										<option value="Tonga">Tonga</option>
										<option value="Toquelau">Toquelau</option>
										<option value="Trinidad e Tobago">Trinidad e Tobago</option>
										<option value="Tunísia">Tunísia</option>
										<option value="Turcas e Caicos">Turcas e Caicos</option>
										<option value="Turquemenistão">Turquemenistão</option>
										<option value="Turquia">Turquia</option>
										<option value="Tuvalu">Tuvalu</option>
										<option value="Ucrânia">Ucrânia</option>
										<option value="Uganda">Uganda</option>
										<option value="Uruguai">Uruguai</option>
										<option value="Uzbequistão">Uzbequistão</option>
										<option value="Vanuatu">Vanuatu</option>
										<option value="Vaticano">Vaticano</option>
										<option value="Venezuela">Venezuela</option>
										<option value="Vietname">Vietname</option>
										<option value="Wallis e Futuna">Wallis e Futuna</option>
										<option value="Zimbabwe">Zimbabwe</option>
										<option value="Zâmbia">Zâmbia</option>
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
									<div class="TituloTrf">Dados Para Transferência:</div>
								</div>
							</div>
							<br>
							<div class="ContainerTransf">
								<div class="row">
									<div class="form-group col-md-12">
										<span class="Inf">Número da conta: </span> 1545748-1
									</div>
								</div>
								<div class="row">
									<div class="form-group col-md-12">
										<span class="Inf">Agência: </span> 6656
									</div>
								</div>
								<div class="row">
									<div class="form-group col-md-12">
										<span class="Inf">Banco: </span> Bradesco
									</div>
								</div>
								<div class="row">
									<div class="form-group col-md-12">
										<span class="Inf">Cidade-UF: </span> São Paulo
									</div>
								</div>
								<div class="row">
								<div class="form-group col-md-12">
									<div class="TituloTrf">Dados do Cliente:</div>
								</div>
							</div>
							
							<div class="row">
								<div class="form-group col-md-12">
									<label class="cpfC" for="modelo">Valor da Transferência: </label>
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
									<label class="cpfC" for="modelo">Número da Conta: </label>
								</div>
							</div>
								<div class="row">
								<div class="form-group col-md-12">
									<input type="text" class="form-control" name="CPF" id="CPF"
										 maxlength="3" placeholder="Número da conta do titular" />
								</div>
							</div>
							<div class="row">
								<div class="form-group col-md-12">
									<label class="cpfC" for="modelo">Agência da Conta: </label>
								</div>
							</div>
								<div class="row">
								<div class="form-group col-md-12">
									<input type="text" class="form-control" name="CPF" id="CPF"
										 maxlength="3" placeholder="Agência da conta do titular" />
								</div>
							</div>
								</div>
							</div>
						</div>

					</div>
					<div class="divBtn">
						<a class="text-dark voltar"
							href="controller.do?command=CarregarPedido">‹ Voltar para o
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

