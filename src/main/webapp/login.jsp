<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Painel de Controle</title>
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/login.css">
    <link rel="stylesheet" href="../css/login.css">

</head>
<body>
              
   
<br>
             <% String MensagemErroAcesso; %>
             <h6>${MensagemErroAcesso} </h6>

    <form class="form-login"  action="<%= request.getContextPath() %>/ServletLogin" method="post">
    <input type="hidden" value="<%=request.getParameter("url")%>" name="url" > 
        <div class="card"> 
          <div class="itens-top">
            <img src="../images/logo.png" alt="">
            <img src="images/logo.png" alt="">
            <h2>Painel de Controle</h2>
            <p>Listagem de Ramais</p>

          </div>

          <form >
          <input type="hidden" value="<%= request.getParameter("url") %>" name="url">
            <div class="form-group">
              <label for="usuario">Login</label>
              <input type="text" name="username" class="form-control" id="username" aria-describedby="emailHelp" placeholder="Digite seu usuário" required autocomplete="off">
            
            </div>
            <div class="form-group">
              <label for="password">Senha</label>
              <input type="password" name="password" class="form-control" id="password" placeholder="Digite sua senha" required>
            </div>
            <button type="submit" value="Login" class="btn btn-primary">Entrar</button>
             <% String MensagemErroLogin; %>
              ${MensagemErroLogin}
          </form>
      
         
          </div>

        </div>

    </form>
</body>
</html>