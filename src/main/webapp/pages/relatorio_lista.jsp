<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/relatorio_lista.css">

<link rel="shortcut icon" sizes="16x16"
	href="https://cdn-icons-png.flaticon.com/256/2954/2954366.png">

<title>Relatório Lista</title>

</head>
<body>
	<%@   taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@  page import="dao.*, model.*, java.util.*"%>




	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">

		<img src="<%=request.getContextPath()%>/images/usuario.png"
			width="40px" class="navbar-brand">
			
			<div class="nome-usuario">${nome}</div>
			
			
			
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="#"> <span
						class="sr-only">(current) </span></a></li>


				<li class="nav-item "><a class="nav-link" href="<%= request.getContextPath() %>/pages/home.jsp">Home</a></li>
			</ul>


			<a href="<%=request.getContextPath()%>/ServletLogin?acao=logout"><button
					type="button" class="btn btn-danger">Sair</button> </a>
	</nav>
	</div>
	<br>




    <div class="botaoImprimir">
    <button onclick="imprimir()" type="button" class="btn btn-warning">Imprimir</button>
    </div>
	

	<%
	List<Ramal> list = RamalDao.getAllRamal();
	request.setAttribute("list", list);
	%>

	<div id="content" class="tabela">
		<table class="table">
			<thead class="thead">
				<tr>
					<th scope="col">Setor</th>
					<th scope="col">Ramal</th>
					<th scope="col">Localização</th>
				</tr>
			</thead>
			<tbody id="tabelaDeRegistros">
				<c:forEach items="${list}" var="ramal">
					<tr>
						<td>${ramal.getSetor()}</td>
						<td>${ramal.getRamal()}</td>
						<td>${ramal.getLocalizacao()}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<br>
	<h5
		style="text-align: right; font-size: 13px; padding: 35px; text-align: center; color: rgba(0, 0, 0, 0.822);">
		Desenvolvido por <strong
			style="color: rgb(42, 187, 119); font-size: 17px;"> Davi
			Braz </strong>
	</h5>




	<!----------------- AREA DESTINADA AOS CODIGOS JAVASCRIPT -------------------- -->


	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/gerarPdf.js"></script>


</body>
</html>