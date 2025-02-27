<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
<%@   taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@  page import="dao.RamalDao, model.*, java.util.*"%>


<meta charset="UTF-8">

   <!-- Incluindo o CSS do DataTables -->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css">
    <!-- Incluindo o jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Incluindo o JavaScript do DataTables -->
    <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>



<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
	
	
	
<link rel="shortcut icon" sizes="16x16" href="https://cdn-icons-png.flaticon.com/256/2954/2954366.png">

<link rel="stylesheet" href="<%= request.getContextPath() %>/css/ListagemRamais.css">

<meta http-equiv="refresh" content="120" />
<title>Lista de Ramais</title>

</head>
<body>
<div class="div-header">
    
    <div>
        <h1 class="titulo-page"><strong>NOME DA EMPRESA</strong></h1>
        <h3 class="subtitulo-page">Listagem de Ramais</h3>
    </div>
</div>

<div class="div-content">
    <div class="tabela">
        <table id="listagem" class="table table-striped table-bordered">
            <thead class="thead">
                <tr>
                    <th class="item-colum-center" scope="col">SETOR</th>
                    <th class="item-colum-center" scope="col">RAMAL</th>
                    <th class="item-colum-center" scope="col">LOCALIZAÇÃO</th>
                </tr>
            </thead>
            <tbody>
                <%
                List<Ramal> list = RamalDao.getAllRamal(); 
                if(list != null) {
                    for(Ramal ramal : list) {
                        out.println("<tr>");
                        out.println("<td>" + ramal.getSetor() + "</td>");
                        out.println("<td>" + ramal.getRamal() + "</td>");
                        out.println("<td>" + ramal.getLocalizacao() + "</td>");
                        out.println("</tr>");
                    }
                }
                %>
            </tbody>
        </table>
    </div>
</div>

<footer style="color: rgba(0, 0, 0, 0.822);">
    Desenvolvido por<strong style="color: rgb(42, 187, 119);"> Davi Braz </strong>
</footer>

	<!----------------- script para datatable -------------------- -->

 <script>
        $(document).ready(function() {
            $('#listagem').DataTable({
                "language": {
                    "sEmptyTable": "Nenhum dado disponível na tabela",
                    "sInfo": "Mostrando _START_ a _END_ de _TOTAL_ ramais",
                    "sInfoEmpty": "Mostrando 0 a 0 de 0 ramais",
                    "sInfoFiltered": "(filtrado de _MAX_ ramais totais)",
                    "sInfoPostFix": "",
                    "sInfoThousands": ".",
                    "sLengthMenu": "Mostrar _MENU_ ramais por página",
                    "sLoadingRecords": "Carregando...",
                    "sProcessing": "Processando...",
                    "sSearch": "Pesquisar:",
                    "sZeroRecords": "Nenhum ramal encontrado",
                    "oPaginate": {
                        "sFirst": "Primeira",
                        "sLast": "Última",
                        "sNext": "Próxima",
                        "sPrevious": "Anterior"
                    },
                    "oAria": {
                        "sSortAscending": ": ativar para ordenar a coluna em ordem crescente",
                        "sSortDescending": ": ativar para ordenar a coluna em ordem decrescente"
                    }
                }
            });
        });
    </script>
</body>

</html>