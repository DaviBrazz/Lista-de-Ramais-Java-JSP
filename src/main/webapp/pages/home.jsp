<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link rel="stylesheet" href="../css/home.css">
     <link rel="stylesheet" href="css/home.css">
      <link rel="shortcut icon" sizes="16x16" href="https://cdn-icons-png.flaticon.com/256/2954/2954366.png">
  
    <title>Painel de Controle</title>
    
</head>
<body>
<%@   taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@  page import="dao.*, model.*, java.util.*" %>




  <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  
    <img src="<%= request.getContextPath() %>/images/usuario.png" width="40px" class="navbar-brand" >
    <div class="nome-usuario">${nome}</div>
  
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item active">
          <a class="nav-link" href="#"> <span class="sr-only">(current)</span></a>
        </li>
        
        	<li class="nav-item active"><a class="nav-link" href="<%= request.getContextPath() %>/pages/home.jsp">Home</a></li>
                      
           <li class="nav-item dropdown"> <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Relatórios</a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          
           
            <a class="dropdown-item" href="<%= request.getContextPath() %>/pages/relatorio_lista.jsp">Lista de ramais</a>
        </li>
      </ul>
        <a href="<%= request.getContextPath() %>/ServletLogin?acao=logout&usuario=${nome}"><button type="button" class="btn btn-danger">Sair</button> </a>
   
  </nav>
   </div>
<br>

    <% String erroCadastrar; %>
     ${erroCadastrar}

<%

int total = RamalDao.getAllRamal().size();
request.setAttribute("totalRamais",total);
%>



<div class="barra-pesquisa">
  <div class="botao-inserir-ramal"> 
   <button  type="button" class="btn btn-success" data-toggle="modal" data-target="#telaCadastrarRamal" data-whatever="inserir-ramal">Inserir Ramal</button> 
    <button type="button" class="btn btn-info" data-toggle="modal" data-target="#telaMostrarTotal" data-whatever="total-ramal">Exibir total</button> 
   <a href="<%= request.getContextPath() %>/lista.jsp"> <button  type="button" class="btn btn-warning" >Visualizar</button> </a>

<!-- ----------------Modal de exibição de total de ramais --------------------- -->
<div class="modal fade" id="telaMostrarTotal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header bg-info text-white">
        <h5 class="modal-title" id="exampleModalLongTitle"> Ramais Cadastrados</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <h4>Total: <strong> ${totalRamais} </strong>ramais cadastrados</h4>
      </div>
      <div class="modal-footer">
         <button type="submit" class="btn btn-info" data-dismiss="modal" >Ok</button>
      </div>
    </div>
  </div>
</div>
<!-------------------inicio tela modal para cadastrar ramal----------------------->
 
<div class="modal fade" id="telaCadastrarRamal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
 
    <div class="modal-content">
      <div class="modal-header bg-success text-white">
        <h5 class="modal-title" id="exampleModalLabel">Cadastro de Ramal</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form  method="post" action="<%= request.getContextPath() %>/ServletCadastrarRamal" class="needs-validation" novalidate >
          <div class="form-group">
            <input name="id" type="hidden" id="input-id">
            <label for="validationCustom01">Setor:</label>
            <input type="text" name="setor" class="form-control" id="input-setor" value="" required >
            <div class="invalid-feedback">Preencha este campo com o setor</div>
          </div>
          
           <div class="form-group">
            <label for="validationCustom02">Nº Ramal:</label>
            <input type="text" name="ramal" class="form-control" id="input-ramal"  value="" required>
            <div class="invalid-feedback">Preencha este campo com o ramal</div>
          </div>
          
           <div class="form-group">
            <label for="validationCustom03">Localização</label>
            <input type="text"  name="localizacao"  class="form-control" id="input-localizacao"  value="" required>
            <div class="invalid-feedback">Preencha este campo com a localização</div>
            
          </div>
          <div class="modal-footer">
         <button id="fecharmodalcadastro" type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button> 
       <button type="submit" class="btn btn-success"  >Cadastrar</button>
      </div>
        </form>
      </div>
      
    </div>
  </div>
</div>
<!------------------- fim da tela modal para cadastro de ramal ----------------------->




<!-- ---------------- TELA MODAL PARA EDITAR RAMAL -------------------------------- -->

<div class="modal fade" id="telaEditarRamal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
 
    <div class="modal-content">
    <form method="POST" action="<%= request.getContextPath() %>/pages/editarRamal.jsp">
      <div class="modal-header bg-primary text-white">
        <h5 class="modal-title" id="exampleModalLabel">Edição de Ramal</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <div class="form-group">
             <input name="id" type="hidden" id="input-id">
            <label for="recipient-name" class="col-form-label">Setor:</label>
            <input name="setor" type="text" class="form-control" id="input-setor" required>
          </div>
           <div class="form-group">
            <label for="recipient-name" class="col-form-label">Nº Ramal:</label>
            <input name="ramal" type="text" class="form-control" id="input-ramal" required>
          </div>
           <div class="form-group">
            <label for="recipient-name" class="col-form-label">Localização:</label>
            <input name="localizacao" type="text" class="form-control" id="input-localizacao">
          </div>
          <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
         <button type="submit"  class="btn btn-primary" >Salvar</button> 
      </div>
        </form>
      </div>
 
    </div>
  </div>

</div>

<!------------------- FIM DA TELA MODAL PARA EDITAR RAMAL ------------------------------>




   </div> 
    <input type="search" class="form-control " id="input-busca" placeholder="Pesquisar..."> 
    <button class="btn btn-primary" > <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
        <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"/>
      </svg></button>
   
</div>

<% 

     List<Ramal> list = RamalDao.getAllRamal(); 
      request.setAttribute("list",list);
 %> 

    <div  class="tabela" >
    <table class="table" >
        <thead class="thead">
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Setor</th>
            <th scope="col">Ramal</th>
            <th scope="col">Localização</th>
            <th scope="col">Ação</th>
          </tr>
        </thead>
        <tbody id="tabelaDeRegistros">
       <c:forEach items="${list}" var="ramal">
          <tr>
           <td>${ramal.getId()}</td>
            <td>${ramal.getSetor()}</td>
            <td>${ramal.getRamal()}</td>
            <td>${ramal.getLocalizacao()}</td>
            <td>
             <a class="btn btn-primary" data-toggle="modal" data-target="#telaEditarRamal" data-whateverid="${ramal.getId()}" data-whateversetor="${ramal.getSetor() }" data-whateverramal="${ramal.getRamal() }" data-whateverlocalizacao="${ramal.getLocalizacao() }"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
                <path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325"/>
              </svg>
            </a>
              <a href="<%= request.getContextPath() %>/pages/deletarRamal.jsp?id=${ramal.getId()}&setor=${ramal.getSetor()}&ramal=${ramal.getRamal()}" class="btn btn-danger" data-confirm="#"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3" viewBox="0 0 16 16">
                <path d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5M11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47M8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5"/>
              </svg></a> 
              </td>
          </tr>
         </c:forEach>
          </tbody>
      </table>  
    </div>
    <br>
    <h5 style="text-align: right; font-size: 16px; padding: 35px; text-align: center; color: rgba(0, 0, 0, 0.822);">Desenvolvido por <strong style="color: rgb(42, 187, 119); font-size: 17px;"> Davi Braz </strong></h5>
    
    
    
    
    <!----------------- AREA DESTINADA AOS CODIGOS JAVASCRIPT -------------------- -->
    
    
  <script type="text/javascript" src="js/gerarPdf.js" defer></script>
    <script type="text/javascript">
    
    //------------------------------------ Envio de dados para modal de cadastro de ramal -------------------- --
    
    $('#telaEditarRamal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget) // Button that triggered the modal
        var id = button.data('whateverid');
        var setor = button.data('whateversetor');
        var ramal = button.data('whateverramal') ;
        var localizacao = button.data('whateverlocalizacao');

        console.log("ID: " + id );
        console.log("SETOR: " + setor);
        console.log("RAMAL: " + ramal);
        console.log("LOCALIZAÇÃO: " + localizacao);
     
        var modal = $(this)
        modal.find('.modal-title').text('Edição de Ramal')
        modal.find('#input-id').val(id)
        modal.find('#input-setor').val(setor);
        modal.find('#input-ramal').val(ramal);
        modal.find('#input-localizacao').val(localizacao);

      });
    
    //------------------------------------  -------------------- --
    
    //------------------------- Notificar no console do navegador o chamamento da modal de cadastro de ramal ---------------------
    
    $('#telaCadastrarRamal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget) // Button that triggered the modal
        console.log("Modal de cadastrar ramal aberta");

        
      });
  //----------------------------------------------
  
  //------------------------- Alertas de mesagem de validação  ---------------------
    (function() {
    	  'use strict';
    	  window.addEventListener('load', function() {
    	    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    	    var forms = document.getElementsByClassName('needs-validation');
    	    // Loop over them and prevent submission
    	    var validation = Array.prototype.filter.call(forms, function(form) {
    	      form.addEventListener('submit', function(event) {
    	        if (form.checkValidity() === false) {
    	          event.preventDefault();
    	          event.stopPropagation();
    	        }
    	        form.classList.add('was-validated');
    	      }, false);
    	    });
    	  }, false);
    	})();
   
    
    
 </script>
    <script type="text/javascript" src="<%= request.getContextPath() %>/js/limparFecharModal.js"></script>
    <script type="text/javascript" src="<%= request.getContextPath() %>/js/filtro.js"></script>
    <script type="text/javascript" src="<%= request.getContextPath() %>/js/delete.js"></script>
  
</body>
</html>